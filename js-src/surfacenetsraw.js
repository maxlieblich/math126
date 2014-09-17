/**
 * SurfaceNets in JavaScript
 *
 * Written by Mikola Lysenko (C) 2012
 *
 * MIT License
 *
 * Based on: S.F. Gibson, "Constrained Elastic Surface Nets". (1998) MERL Tech Report.
 * Lightly "modified" by Max Lieblich to make it stupidly browser- and webworker-friendly.
 * I got rid of "exports", so "marchingCubes" becomes a variable in the worker's global scope.
 * I also return a flattened form of things to make it possible to use BufferGeometry in Three.js, which
 * will hopefully be faster than looping over the vertices and faces to construct the mesh (which blocks
 * the rendering thread, making the Worker almost pointless!).
 */
//"use strict";

surfaceNets = function(dims, potential, bounds) {
    //Precompute edge table, like Paul Bourke does.
    // This saves a bit of time when computing the centroid of each boundary cell
    var cube_edges = new Int32Array(24),
        edge_table = new Int32Array(256);
    (function() {
        //Initialize the cube_edges table
        // This is just the vertex number of each cube
        var k = 0;
        for (var i = 0; i < 8; ++i) {
            for (var j = 1; j <= 4; j <<= 1) {
                var p = i ^ j;
                if (i <= p) {
                    cube_edges[k++] = i;
                    cube_edges[k++] = p;
                }
            }
        }

        //Initialize the intersection table.
        //  This is a 2^(cube configuration) ->  2^(edge configuration) map
        //  There is one entry for each possible cube configuration, and the output is a 12-bit vector enumerating all edges crossing the 0-level.
        for (var i = 0; i < 256; ++i) {
            var em = 0;
            for (var j = 0; j < 24; j += 2) {
                var a = !!(i & (1 << cube_edges[j])),
                    b = !!(i & (1 << cube_edges[j + 1]));
                em |= a !== b ? (1 << (j >> 1)) : 0;
            }
            edge_table[i] = em;
        }
    })();

    //Internal buffer, this may get resized at run time
    var buffer = new Array(4096);
    (function() {
        for (var i = 0; i < buffer.length; ++i) {
            buffer[i] = 0;
        }
    })();

    if (!bounds) {
        bounds = [
            [0, 0, 0], dims
        ];
    }

    var scale = [0, 0, 0];
    var shift = [0, 0, 0];
    for (var i = 0; i < 3; ++i) {
        scale[i] = (bounds[1][i] - bounds[0][i]) / dims[i];
        shift[i] = bounds[0][i];
    }

    var vertices = [],
        faces = [],
        n = 0,
        x = [0, 0, 0],
        R = [1, (dims[0] + 1), (dims[0] + 1) * (dims[1] + 1)],
        grid = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
        buf_no = 1;


    //Resize buffer if necessary 
    if (R[2] * 2 > buffer.length) {
        var ol = buffer.length;
        buffer.length = R[2] * 2;
        while (ol < buffer.length) {
            buffer[ol++] = 0;
        }
    }

    //March over the voxel grid
    for (x[2] = 0; x[2] < dims[2] - 1; ++x[2], n += dims[0], buf_no ^= 1, R[2] = -R[2]) {

        //m is the pointer into the buffer we are going to use.  
        //This is slightly obtuse because javascript does not have good support for packed data structures, so we must use typed arrays :(
        //The contents of the buffer will be the indices of the vertices on the previous x/y slice of the volume
        var m = 1 + (dims[0] + 1) * (1 + buf_no * (dims[1] + 1));

        for (x[1] = 0; x[1] < dims[1] - 1; ++x[1], ++n, m += 2) {
            for (x[0] = 0; x[0] < dims[0] - 1; ++x[0], ++n, ++m) {

                //Read in 8 field values around this vertex and store them in an array
                //Also calculate 8-bit mask, like in marching cubes, so we can speed up sign checks later
                var mask = 0,
                    g = 0;
                for (var k = 0; k < 2; ++k)
                    for (var j = 0; j < 2; ++j)
                        for (var i = 0; i < 2; ++i, ++g) {
                            var p = potential(
                                scale[0] * (x[0] + i) + shift[0],
                                scale[1] * (x[1] + j) + shift[1],
                                scale[2] * (x[2] + k) + shift[2]);
                            grid[g] = p;
                            mask |= (p < 0) ? (1 << g) : 0;
                        }

                //Check for early termination if cell does not intersect boundary
                if (mask === 0 || mask === 0xff) {
                    continue;
                }

                //Sum up edge intersections
                var edge_mask = edge_table[mask],
                    v = [0.0, 0.0, 0.0],
                    e_count = 0;

                //For every edge of the cube...
                for (var i = 0; i < 12; ++i) {
                    //Use edge mask to check if it is crossed
                    if (!(edge_mask & (1 << i))) {
                        continue;
                    }
                    //If it did, increment number of edge crossings
                    ++e_count;
                    //Now find the point of intersection
                    var e0 = cube_edges[i << 1], //Unpack vertices
                        e1 = cube_edges[(i << 1) + 1],
                        g0 = grid[e0], //Unpack grid values
                        g1 = grid[e1],
                        t = g0 - g1; //Compute point of intersection
                    if (Math.abs(t) > 1e-6) {
                        t = g0 / t;
                    } else {
                        continue;
                    }

                    //Interpolate vertices and add up intersections (this can be done without multiplying)
                    for (var j = 0, k = 1; j < 3; ++j, k <<= 1) {
                        var a = e0 & k,
                            b = e1 & k;
                        if (a !== b) {
                            v[j] += a ? 1.0 - t : t;
                        } else {
                            v[j] += a ? 1.0 : 0;
                        }
                    }
                }
            

            //Now we just average the edge intersections and add them to coordinate
            var s = 1.0 / e_count;
            for (var i = 0; i < 3; ++i) {
                v[i] = scale[i] * (x[i] + s * v[i]) + shift[i];
            }

            //Add vertex to buffer, store pointer to vertex index in buffer
            buffer[m] = vertices.length;
            vertices.push(v);

            //Now we need to add faces together, to do this we just loop over 3 basis components
            for (var i = 0; i < 3; ++i) {
                //The first three entries of the edge_mask count the crossings along the edge
                if (!(edge_mask & (1 << i))) {
                    continue;
                }

                // i = axes we are point along.  iu, iv = orthogonal axes
                var iu = (i + 1) % 3,
                    iv = (i + 2) % 3;

                //If we are on a boundary, skip it
                if (x[iu] === 0 || x[iv] === 0) {
                    continue;
                }

                //Otherwise, look up adjacent edges in buffer
                var du = R[iu],
                    dv = R[iv];

                //Remember to flip orientation depending on the sign of the corner.
                if (mask & 1) {
                    faces.push([buffer[m], buffer[m - du], buffer[m - dv]]);
                    faces.push([buffer[m - dv], buffer[m - du], buffer[m - du - dv]]);
                } else {
                    faces.push([buffer[m], buffer[m - dv], buffer[m - du]]);
                    faces.push([buffer[m - du], buffer[m - dv], buffer[m - du - dv]]);
                }
            }
        }
    }
  }
    // make flat form
    var flat_positions = new Float32Array(faces.length * 3 * 3),
        flat_normals = new Float32Array(faces.length * 3 * 3);
    for (var i = 0, i3 = 0; i < faces.length; i++, i3 += 9) {
        var face = faces[i];

        var a = vertices[face[0]];
        var b = vertices[face[1]];
        var c = vertices[face[2]];

        flat_positions[i3] = a[0];
        flat_positions[i3 + 1] = a[1];
        flat_positions[i3 + 2] = a[2];

        flat_positions[i3 + 3] = b[0];
        flat_positions[i3 + 4] = b[1];
        flat_positions[i3 + 5] = b[2];

        flat_positions[i3 + 6] = c[0];
        flat_positions[i3 + 7] = c[1];
        flat_positions[i3 + 8] = c[2];

        var cb = [c[0] - b[0], c[1] - b[1], c[2] - b[2]];
        var ab = [a[0] - b[0], a[1] - b[1], a[2] - b[2]];

        var cross = [cb[1] * ab[2] - cb[2] * ab[1], -cb[0] * ab[2] + cb[2] * ab[0], cb[0] * ab[1] - cb[1] * ab[0]];

        var len = Math.sqrt(cross[0] * cross[0] + cross[1] * cross[1] + cross[2] * cross[2]);

        var n = [cross[0] / len, cross[1] / len, cross[2] / len];

        flat_normals[i3] = n[0];
        flat_normals[i3 + 1] = n[1];
        flat_normals[i3 + 2] = n[2];

        flat_normals[i3 + 3] = n[0];
        flat_normals[i3 + 4] = n[1];
        flat_normals[i3 + 5] = n[2];

        flat_normals[i3 + 6] = n[0];
        flat_normals[i3 + 7] = n[1];
        flat_normals[i3 + 8] = n[2];
    }
    return {
        positions: flat_positions,
        normals: flat_normals
    };
};
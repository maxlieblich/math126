Surfaces
========

Vague question
--------------

### How can we relate equations to the shapes of their zero loci?

It help to see a bunch of different equations being graphed. (If you can interact with the panels, open the controls, change parameters, render the results, etc. You can also drag the shapes to rotate, zoom in and out, and pan using the mouse. This should help you get a sense of what these things look like.)

#### A menagerie of shapes

**Cone**: $x^2+y^2=z^2$

<div id="cone">
  <img src="media/lecture-6-cone.png"></img>
</div>
<script type="text/javascript">
//<![CDATA[
(function() {
  var scene = new MathScene("cone");
  var f = function (x, y, z){
    return x*x + y*y - z*z;
  }
  scene.camera.position.set(8, 8, 4);
  var surface = new MarchingCubesModel({func: f, resolution: 70, material: MathScene.UWMaterial.clone()});
  surface.embedInScene(scene);
}());
//]]>
</script>

**Freaky “cylinder”**: $y^2=x^2(x-1)$

<div id="cylinder">
  <img src="media/lecture-6-cylinder.png"></img>
</div>
<script type="text/javascript">
//<![CDATA[
(function() {
  var scene = new MathScene("cylinder");
  var f = function (x, y, z){
    return y*y - x*x*(x-1);
  }
  scene.camera.position.set(8, 8, 4);
  var surface = new MarchingCubesModel({func: f, resolution: 70, material: MathScene.UWMaterial.clone()});
  surface.embedInScene(scene);
}());
//]]>
</script>


**Ellipsoid**: $\frac{1}{2}x^2+\frac{1}{3}y^2+z^2=1$

<div id="ellipsoid">
  <img src="media/lecture-6-ellipsoid.png"></img>
</div>
<script type="text/javascript">
//<![CDATA[
(function () {
  var scene = new MathScene("ellipsoid");
  var f = function (x, y, z){
    return 1/2*x*x + 1/3 * y*y + z*z - 1;
  }
  scene.camera.position.set(8, 8, 4);
  var surface = new MarchingCubesModel({func: f, resolution: 70, material: MathScene.UWMaterial.clone()});
  surface.embedInScene(scene);
}());
//]]>
</script>

**Hyperbolic paraboloid**: $\frac{1}{9}x^2-\frac{1}{4}y^2=z$

<div id="hyp-par">
  <img src="media/lecture-6-hyp-par.png"></img>
</div>
<script type="text/javascript">
//<![CDATA[
(function () {
  var scene = new MathScene("hyp-par");
  var f = function (x, y, z){
    return 1/9 * x*x - 1/4 * y*y - z;
  }
  scene.camera.position.set(8, 8, 4);
  var surface = new MarchingCubesModel({func: f, resolution: 70, material: MathScene.UWMaterial.clone()});
  surface.embedInScene(scene);
}());
//]]>
</script>

**Elliptic paraboloid**: $\frac{1}{9}x^2+\frac{1}{4}y^2=z$

<div id="ell-par">
  <img src="media/lecture-6-ell-par.png"></img>
</div>
<script type="text/javascript">
//<![CDATA[
(function () {
  var scene = new MathScene("ell-par");
  var f = function (x, y, z){
    return 1/9 * x*x + 1/4 * y*y - z;
  }
  scene.camera.position.set(16, 16, 8);
  scene.cameraControls.target.set(0, 0, 6)
  var surface = new MarchingCubesModel({
    func: f,
    resolution: 70,
    xmin: -10,
    xmax: 10,
    ymin: -10,
    ymax: 10,
    zmin: 0,
    zmax: 10, material: MathScene.UWMaterial.clone()});
    surface.embedInScene(scene);
  }());
//]]>
</script>


### Key idea

To study shapes like this, especially a new one, there is a wonderful method that we all learn at the deli: slice the shape with planes and reassemble the pieces. While we can do powerful visualizations with computers (as you can see throughout this course), these visualizations are only directly helpful for surfaces in three-dimensional space, and things that your computer spits out can be misleading. (After all, an algorithm is used to generate the plots, and every algorithm has weaknesses.)  Even better, slicing is a way to visualize *higher-dimensional shapes*. Just like a curve is what you get when you slice a surface sitting in 3d space, a *surface is what you get when you slice a 3d shape sitting in 4d (or higher!) space*. 

If you are curious about how computers visualize these things, note that the computer is also doing a kind of slicing or subdividing, but it is a bit more complicated than what we describe here, because computers can't think. We can't say *hold a variable constant and **understand** what you get* because it can't understand. Instead, we have to give the computer comprehensive and simple instructions. Look at our code and read about the "marching cubes algorithm" to get an idea of how one might do these things automatically. (Note: there are many many other isosurface algorithms. Marching cubes has some serious weaknesses. You can spend hours reading about isosurface computations. Do it!)

#### Slicing example: $\frac{1}{9}x^2+\frac{1}{4}y^2=z$

We can make a horizontal trace (horizontal slice) at $z=6$.

Geometrically, we are intersecting the surface with a horizontal plane.
<div id="horizontal-trace-1">
  <img src="media/lecture-6-horizontal-trace-1.png"></img>
</div>
<script type="text/javascript">
//<![CDATA[
(function () {
  var scene = new MathScene("horizontal-trace-1");
  var f = function (x, y, z){
    return 1/9 * x*x + 1/4 * y*y - z;
  }
  scene.camera.position.set(16, 16, 8);
  scene.cameraControls.target.set(0, 0, 6);
  var surface = new MarchingCubesModel({
    func: f,
    resolution: 70,
    xmin: -10,
    xmax: 10,
    ymin: -10,
    ymax: 10,
    zmin: 0,
    zmax: 10, material: MathScene.UWMaterial.clone()});
    surface.embedInScene(scene);
  var tracePlaneGeom = new THREE.PlaneGeometry(20, 20);
  var tracePlane = new THREE.Mesh(tracePlaneGeom, new THREE.MeshNormalMaterial({side: THREE.DoubleSide}));
  tracePlane.position.set(0, 0, 6);
  scene.scene.add(tracePlane);
}());
//]]>
</script>
To calculate this algebraically:

- First, set $z=6$ in the equation to find a curve to plot: $\frac{1}{9}x^2+\frac{1}{4}y^2=6.$
- This will be an ellipse. (For which values of $z$ is this an ellipse?)
- We can plot the ellipse in a plane to visualize this slice. We can vary the value of $z$ and see how the horizontal traces vary. For the sake of visualization, we are plotting plane at its corresponding height over the $xy$-plane, but the "horizontal trace" is the red curve, **viewed simply as a curve in the plane, not in space**.

<div id="horizontal-trace-2">
  <img src="media/lecture-6-horizontal-trace-2.png"></img>
</div>
<script type="text/javascript">
//<![CDATA[
(function () {
  var scene = new MathScene("horizontal-trace-2");
  scene.camera.position.set(16, 16, 8);
  scene.cameraControls.target.set(0, 0, 6);

  var x = function (z){
    return function (t){
      return 3 * Math.sqrt(z) * Math.cos(2 * Math.PI * t);
    }
  }

  var y = function (z){
    return function (t){
      return 2 * Math.sqrt(z) * Math.sin(2 * Math.PI * t);
    }
  }

  var z = function (z) { 
    return function (t){
      return z; 
    }
  }

  var trace = new ParametricPathModel(
    x(6), y(6), z(6), [0, 1.01], 0, 100
  );

  trace.embedInScene(scene);

  trace.redraw = function (h) {
    trace.x = x(h);
    trace.y = y(h);
    trace.z = z(h)
    tracePlane.position.set(0, 0, h-0.01);
    scene.scene.remove(trace.path);
    trace.generate();
    trace.embedObjects();
    scene.render();
  }

  trace.level = 6;

  var levelControl = scene.gui.add(trace, "level", 0, 10).step(0.05);
  levelControl.onChange(function(value){
    trace.redraw(value);
  });

  var tracePlaneGeom = new THREE.PlaneGeometry(20, 20);
  var tracePlane = new THREE.Mesh(tracePlaneGeom, MathScene.UWMaterial.clone());
  tracePlane.position.set(0, 0, 6-0.1);
  scene.scene.add(tracePlane);
  scene.gui.open();
}());
//]]>
</script>


#### Vertical traces for $\frac{1}{9}x^2+\frac{1}{4}y^2=z$

Instead of intersecting with horizontal planes, we intersect with vertical ones.

<div id="vertical-trace-1">
  <img src="media/lecture-6-vertical-trace-1.png"></img>
</div>
<script type="text/javascript">
//<![CDATA[
(function () {
  var scene = new MathScene("vertical-trace-1");
  var f = function (x, y, z){
    return 1/9 * x*x + 1/4 * y*y - z;
  }
  scene.camera.position.set(16, 16, 8);
  scene.cameraControls.target.set(0, 0, 6);
  var surface = new MarchingCubesModel({
    func: f,
    resolution: 70,
    xmin: -10,
    xmax: 10,
    ymin: -10,
    ymax: 10,
    zmin: 0,
    zmax: 10, material: MathScene.UWMaterial.clone()});
    surface.embedInScene(scene);
  var tracePlaneGeom = new THREE.PlaneGeometry(50, 50);
  var tracePlane = new THREE.Mesh(tracePlaneGeom, new THREE.MeshNormalMaterial({side: THREE.DoubleSide}));
  tracePlane.position.set(0, 0, 0);
  tracePlane.rotation.set(Math.PI/2, 0, 0);
  scene.scene.add(tracePlane);
}());
//]]>
</script>
To calculate this algebraically:

- First, set $y=0$ in the equation to find a curve to plot: $\frac{1}{9}x^2=z.$
- This is a parabola. (For which values of $y$ is this a parabola?)
- We can plot the parabola in a (vertical) plane to visualize this slice. We can vary the value of $y$ and see how these vertical traces vary. For the sake of visualization, we are plotting plane at its corresponding position over the $xy$-plane, but the "vertical trace" is the red curve, **viewed simply as a curve in the plane, not in space**.

<div id="vertical-trace-2">
  <img src="media/lecture-6-vertical-trace-2.png"></img>
</div>
<script type="text/javascript">
//<![CDATA[
(function () {
  var scene = new MathScene("vertical-trace-2");
  scene.camera.position.set(16, 16, 8);
  scene.cameraControls.target.set(0, 0, 6);

  var x = function (c){
    return function (t){
      return t;
    }
  }

  var y = function (c){
    return function (t){
      return c;
    }
  }

  var z = function (c) { 
    return function (t){
      return 1/9 * t * t + 1/4 * c * c; 
    }
  }

  var trace = new ParametricPathModel(
    x(0), y(0), z(0), [-10, 10], 0, 100
  );

  trace.embedInScene(scene);

  trace.redraw = function (h) {
    trace.x = x(h);
    trace.y = y(h);
    trace.z = z(h)
    tracePlane.position.set(0, h - 0.01, 0);
    scene.scene.remove(trace.path);
    trace.generate();
    trace.embedObjects();
    scene.render();
  }

  trace.level = 0;

  var levelControl = scene.gui.add(trace, "level", -5, 5).step(0.05);
  levelControl.onChange(function(value){
    trace.redraw(value);
  });

  var tracePlaneGeom = new THREE.PlaneGeometry(50, 50);
  var tracePlane = new THREE.Mesh(tracePlaneGeom, MathScene.UWMaterial.clone());
  tracePlane.position.set(0, 0, 0);
  tracePlane.rotation.set(Math.PI/2, 0, 0);
  scene.scene.add(tracePlane);
  scene.gui.open();
}());
//]]>
</script>

### Sketching the shape

This exposes a general strategy for trying to sketch a shape.

-   Choose some horizontal traces and sketch them
-   Choose some vertical traces and sketch them
-   Hope for the best

Note: this idea leaves a lot to the imagination. There's a reason for that: it's hard.

#### Demonstration

Let's try putting this into practice for the equation $x^2+(y-z)^2=4$.

Here are horizontal traces.

<div id="demo-horizontal-trace">
  <img src="media/lecture-6-demo-horizontal-trace.png"></img>
</div>
<script type="text/javascript">
//<![CDATA[
(function () {
  var scene = new MathScene("demo-horizontal-trace");
  scene.camera.position.set(16, 16, 6);
  scene.cameraControls.target.set(0, 0, 0);

  var x = function (c){
    return function (t){
      return 2 * Math.cos(2 * Math.PI * t);
    }
  }

  var y = function (c){
    return function (t){
      return c + 2 * Math.sin(2 * Math.PI * t);
    }
  }

  var z = function (c) { 
    return function (t){
      return c; 
    }
  }

  var trace = new ParametricPathModel(
    x(0), y(0), z(0), [-1.01, 1.01], 0, 100
  );

  trace.embedInScene(scene);

  trace.redraw = function (h) {
    trace.x = x(h);
    trace.y = y(h);
    trace.z = z(h)
    tracePlane.position.set(0, 0, h);
    scene.scene.remove(trace.path);
    trace.generate();
    trace.embedObjects();
    scene.render();
  }

  trace.level = 0;

  var levelControl = scene.gui.add(trace, "level", -5, 5).step(0.05);
  levelControl.onChange(function(value){
    trace.redraw(value);
  });

  var tracePlaneGeom = new THREE.PlaneGeometry(20, 20);
  var tracePlane = new THREE.Mesh(tracePlaneGeom, MathScene.UWMaterial.clone());
  tracePlane.position.set(0, 0, 0);
  scene.scene.add(tracePlane);
  scene.gui.open();
}());
//]]>
</script>

Can you draw vertical traces? There are two kinds: parallel to the $xz$-plane and parallel to the $yz$-plane. Try it!

Here's the shape.

<div id="demo-shape">
  <img src="media/lecture-6-demo-shape.png"></img>
</div>
<script type="text/javascript">
//<![CDATA[
(function () {
  var scene = new MathScene("demo-shape");
  var f = function (x, y, z){
    return x * x + (y - z) * (y - z) - 4;
  }
  scene.camera.position.set(16, 16, 4);
  scene.cameraControls.target.set(0, 0, 0)
  var surface = new MarchingCubesModel({
    func: f,
    resolution: 70,
    xmin: -10,
    xmax: 10,
    ymin: -10,
    ymax: 10,
    zmin: -5,
    zmax: 5, material: MathScene.UWMaterial.clone()});
    surface.embedInScene(scene);
  }());
//]]>
</script>



### Practice

Here is a problem to actually try and some things to think about.

-   Calculate horizontal and vertical traces for the hyperbolic
    paraboloid: $\frac{1}{9}x^2-\frac{1}{4}y^2=z$
-   How do the traces help you to sketch the object?
-   How do the traces help you to tell objects apart?

#### New shapes to consider

Apply the techniques we've been discussing to to draw sketches of the
solutions to these equations in three variables.

-   $x^2+y^2-z^2=1$
-   $z^2-x^2-y^2=1$
-   $x^2+y^2=1$
-   $x^2-2x+y^2-z^2=0$

### Videos
[6](http://www.math.washington.edu/~lieblich/Math126/video/6.mp4)


### Content Contributors
@maxlieblich

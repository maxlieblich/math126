Surfaces
========

Vague question
--------------

### How can we relate equations to the shapes of their zero loci?

A menagerie of shapes
---------------------

Cone: $x^2+y^2=z^2$
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
  var surface = new MarchingCubesModel({func: f, resolution: 150, material: MathScene.UWMaterial.clone()});
  surface.embedInScene(scene);
  scene.render();
}());
//]]>
</script>


A menagerie of shapes
---------------------

Freaky “cylinder”: $y^2=x^2(x-1)$
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
  var surface = new MarchingCubesModel({func: f, resolution: 150, material: MathScene.UWMaterial.clone()});
  surface.embedInScene(scene);
  scene.render();
}());
//]]>
</script>



A menagerie of shapes
---------------------

Ellipsoid: $\frac{1}{2}x^2+\frac{1}{3}y^2+z^2=1$
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
  var surface = new MarchingCubesModel({func: f, resolution: 150, material: MathScene.UWMaterial.clone()});
  surface.embedInScene(scene);
  scene.render();
}());
//]]>
</script>


A menagerie of shapes
---------------------

Hyperbolic paraboloid: $\frac{1}{9}x^2-\frac{1}{4}y^2=z$
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
  var surface = new MarchingCubesModel({func: f, resolution: 150, material: MathScene.UWMaterial.clone()});
  surface.embedInScene(scene);
  scene.render();
}());
//]]>
</script>


A menagerie of shapes
---------------------

Elliptic paraboloid: $\frac{1}{9}x^2+\frac{1}{4}y^2=z$
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
    resolution: 150,
    xmin: -10,
    xmax: 10,
    ymin: -10,
    ymax: 10,
    zmin: 0,
    zmax: 10, material: MathScene.UWMaterial.clone()});
    surface.embedInScene(scene);
    scene.render();
  }());
//]]>
</script>


Key idea
--------

-   Slice the shape with planes and reassemble the pieces.
-   This idea recurs throughout the study of geometry (even by
    professionals!).
-   Subdividing, solving, reassembling is also how computers graph these
    things.

Example: $\frac{1}{9}x^2+\frac{1}{4}y^2=z$
------------------------------------------------

We can make a horizontal trace (horizontal slice) at $z=6$.

Geometrically, we are intersecting the surface with a horizontal plane.
<div id="horizontal-trace-1">
  <img src="lecture-6-horizontal-trace-1"></img>
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
    resolution: 150,
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
  scene.render();
}());
//]]>
</script>
To calculate this algebraically:

- First, set $z=6$ in the equation to find a curve to plot: $\frac{1}{9}x^2+\frac{1}{4}y^2=6.$
- This will be an ellipse. (For which values of $z$ is this an ellipse?)
- We can plot the ellipse in a plane to visualize this slice. We can vary the value of $z$ and see how the horizontal traces vary. For the sake of visualization, we are plotting plane at its corresponding height over the $xy$-plane, but the "horizontal trace" is the red curve, **viewed simply as a curve in the plane, not in space**.

<div id="horizontal-trace-2">
  <img src="lecture-6-horizontal-trace-2"></img>
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
  scene.render();
}());
//]]>
</script>


Example: $\frac{1}{9}x^2+\frac{1}{4}y^2=z$
------------------------------------------------

We can also make a vertical trace (vertical slice) at $y=0$.

Example: $\frac{1}{9}x^2+\frac{1}{4}y^2=z$
------------------------------------------------

We can also make a vertical trace (vertical slice) at $y=0$.

Example: $\frac{1}{9}x^2+\frac{1}{4}y^2=z$
------------------------------------------------

We can make a vertical trace (vertical slice) at $y=0$.

-   Equation for the curve in the vertical plane:
    $$\frac{1}{9}x^2=z.$$
-   What shape is this?
-   What shape will a general vertical trace have?

Sketching the shape
-------------------

-   Choose some horizontal traces and sketch them
-   Choose some vertical traces and sketch them
-   Hope for the best

Demonstration
-------------

Let's try the equation $x^2+y-z=0$.

-   General horizontal trace: $y=-x^2+a$, $a$ a constant.
-   General $xz$-plane vertical trace: $z=x^2+b$, $b$ a constant.
-   General $yz$-plane vertical trace: $z=y+c$, $c$ a constant.
-   Draw some!

Demonstration
-------------

### Final assembled product

Cosmic taco: $x^2+y-z=0$.

Practice
--------

-   Calculate horizontal and vertical traces for the hyperbolic
    paraboloid: $\frac{1}{9}x^2-\frac{1}{4}y^2=z$
-   How do the traces help you to sketch the object?
-   How do the traces help you to tell objects apart?

New shapes to consider
----------------------

Apply the techniques we've been discussing to to draw sketches of the
solutions to these equations in three variables.

-   $x^2+y^2-z^2=1$
-   $z^2-x^2-y^2=1$
-   $x^2+y^2=1$
-   $x^2-2x+y^2-z^2=0$

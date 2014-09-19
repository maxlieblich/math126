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

Example: $\frac{1}{9}x^2+\frac{1}{4}y^2=z$
------------------------------------------------

We can make a horizontal trace (horizontal slice) at $z=6$.

Example: $\frac{1}{9}x^2+\frac{1}{4}y^2=z$
------------------------------------------------

We can make a horizontal trace (horizontal slice) at $z=6$.

-   Equation for the curve in the horizontal plane:
    $$\frac{1}{9}x^2+\frac{1}{4}y^2=6.$$
-   What shape is this?
-   What shape will a general horizontal trace have?

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

# Introduction: Calculus in Multiple Dimensions

**What is this course about?**

You've seen derivatives, integrals, and differential equations in one
variable only. We've really only equipped you to understand "life on a
string". How can we understand a situation closer to reality, one involving
three (or more!) dimensions?

This course will introduce you to calculus in multiple dimensions. Unlike
previous courses, it will rely more heavily on visualization skills and
physical understanding/intuition than symbol pushing. Here's a rough
**outline of topics**:

 * Baby steps in three dimensions: 3D coordinates, vectors, lines and
   planes, dot and cross products, quadric surfaces (~Weeks 1-3)
 * Beginning Calculus in 3D: properties of parametric curves, functions of
   two variables, tangent lines and curves, optimization, differentials
   (~Weeks 4-6); multiple integrals and polar coordinates (~Weeks 7-8)
 * Taylor Series: polynomial approximation, error bounds, series
   (~Weeks 9-11).

## Motivation: I want...

1. ...to model three-dimensional space;
2. ...to describe objects in that space;
3. ...to distinguish objects in that space by their properties
   (center of mass, speed, sources of acceleration, volume, etc.)
4. ...to know if a roller coaster shaped like a trefoil knot will make riders
   black out:
<div id="trefoil">
  <img src="media/lecture-1-trefoil.png"></img>
</div>
<script type="text/javascript">
//<![CDATA[
(function() {
    var scene = new MathScene("trefoil");
    var trefoilFunc = function(t) {
          var t2, t3;
          t2 = t + t;
          t3 = t2 + t;
          return 41 * Math.cos(t) - 18 * Math.sin(t) - 83 * Math.cos(t2)
          - 83 * Math.sin(t2) - 11 * Math.cos(t3) + 27 * Math.sin(t3);
        };
    var trefoilPoint = function(t) {
          var kScale, x, y, z;
          kScale = 0.01;
          x = trefoilFunc(t);
          y = trefoilFunc(6.283185 - t);
          z = trefoilFunc(t - 1.828453);
          return new THREE.Vector3(kScale * x, kScale * y, kScale * z);
        };
    var x = function (t) { return trefoilPoint(t).x; }
    var y = function (t) { return trefoilPoint(t).y; }
    var z = function (t) { return trefoilPoint(t).z; }
    var ppath = new ParametricPathModel(x, y, z, [-4, 4], 1.3);
    ppath.embedInScene(scene);
    scene.animate();
}());
//]]>
</script>

## 1. Modeling 3D space: Cartesian coordinates

What is 3D space? Here's a picture:
<br><br><br></br></br></br>

No, really, that's a picture. Do you think it's missing something?

Rene Descartes (famous for thinking and, therefore, being) thought so. He
thought of something brilliant, something that shook the world. No,
not that thing about the pineal gland and the soul, the other one:
coordinates.

The 3D space of human experience is the set of ordered triples of numbers:

$$\mathbf{R^3}=\{(x,y,z) \mid x,y,z\in\mathbf{R}\}$$
(Read as, "The set of triples x, y, z such that x, y, and z are all real
numbers.") Here's a picture you probably recognize:

![](media/cartesian.png)

## 2. Objects in space: points and distance!

**Exercise:** In the picture, how far is $(x, y, z)$ ("the point x, y, z")
from the origin, $(0, 0, 0)$? Remember the Pythagorean Theorem as you try
it.

**Exercise:** Explain why your answer to the previous exercise says that the
distance between two points $(a,b,c)$ and $(a',b',c')$ is

$$\sqrt{(a-a')^2+(b-b')^2+(c-c')^2}.$$

If you need help, the book has a good explanation of this, but see if you
can figure it out before you read it! If you've already read it, try
before reading it again. (You read each section of the book several times,
right?)

We can now describe shapes, at least implicitly!

**Exercise:**

- What is the set of points at distance 1 from $(0,0,0)$?
- What shape is the set of points $(x,y,z)$ such that $x+y=z$?
- ...such that $x^2+y^2=z^2$?
- ...such that $x^2+y^2=z$? (How does it differ from the previous
  one?)
- ...such that $y=x^2$?
- ...such that $z=4$?

(Don't worry if you can't do all of these now. Start worrying if you still
can't do them after we've gone over quadric surfaces.)

## 3. Distinguishing objects in space

What makes this shape...
<div id="sphere">
  <img src="media/lecture-1-sphere.png"></img>
</div>
<script type="text/javascript">
//<![CDATA[
(function() {
    var scene = new MathScene("sphere");
    var f = function (x, y, z) {
        return x*x + y*y + z*z - 1;
    }
    var mc = new MarchingCubesModel({func: f, xmin: -1.5, xmax: 1.5, ymin: -1.5, ymax: 1.5, zmin: -1.5, zmax: 1.5, resolution: 50});
    mc.embedInScene(scene);
}());
//]]>
</script>

...different from this one?
<div id="ellipsoid">
  <img src="media/lecture-1-ellipsoid.png"></img>
</div>
<script type="text/javascript">
//<![CDATA[
(function() {
    var scene = new MathScene("ellipsoid");
    var f = function (x, y, z) {
        return x*x + 2*y*y + 0.5*z*z - 1;
    }
    var mc = new MarchingCubesModel({func: f, xmin: -2, xmax: 2,
    ymin: -2, ymax: 2, zmin: -2, zmax: 2, resolution: 50});
    mc.embedInScene(scene);
}());
//]]>
</script>

Imagine these objects are planets. People living on the first would probably
weigh things like humans---stick it on a scale, read a number, utterly ignore
any minor changes in gravity's strength. People on the second would have to
say where on the planet they measured things ("45 pounds at latitude 50").
("Newtons" are more appropriate than "kilograms" in this story's metric
version.)

This is vague and qualitative, while Math is rigorous and quantitative, so
let's add some rigor. We might try computing the average strength of gravity
on the surface of the second world as well as its maximum and minimum
strength. Well, averages are just integrals, so let's integrate gravity...
over... a surface?

Integrating over a surface is a great idea, but it's a bit too much for us
right now, and, sadly, we won't (really) do surface integrals this quarter;
take more multivariable calculus for that experience. This quarter, we'll
focus on properties of objects in space like curvature (what is this?),
surface area, volume, ....

**Exercise:** What other mathematical properties might distinguish objects
(lines, curves, surfaces, etc.)? Can you make any of them rigorous enough
to compute for some toy examples?

## 4. What about the trefoil riders?

Finding out whether or not the trefoil riders will black out will have
to wait until we've developed enough tools to define and compute the
acceleration of a point in space.

In the mean time, here's some math love to end on:
<div id="heart">
  <img src="media/lecture-1-heart.png"></img>
</div>
<script type="text/javascript">
//<![CDATA[
(function() {
    var scene = new MathScene("heart");
    var f = function (x, y, z) {
        return Math.pow(x * x + (9/4) * y * y + z * z - 1, 3)
          - x * x * z * z * z - (9/80) * y * y * z * z * z;
    }
    var mc = new MarchingCubesModel({func: f, resolution: 150, smoothingLevel: 1});
    mc.embedInScene(scene);
}());
//]]>
</script>
Want to know the equation? Read the source.

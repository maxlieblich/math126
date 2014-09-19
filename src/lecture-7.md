Vector valued functions: theory
===============================

Medium-term question
--------------------

A fun-loving electron is traveling in a spiral path around the surface
of a torus.

-   The radius of the torus (i.e., the radius of the circle at the
    center of the tube) is $2$ and the diameter of the circular
    cross-section is $1$.
-   The electron starts at position $(1,0,0)$, travels at a constant
    angular velocity around the vertical axis of $1$ radian per
    second, and its path winds up and around the torus $4$ times
    before it returns to its starting position.

What is the position and velocity of the electron at time $t$?

Fun-loving electron in action
-----------------------------
<div id="torus">
  <img src="media/lecture-7-torus.png"></img>
</div>
<script type="text/javascript">
//<![CDATA[
(function(){
    var scene = new MathScene("torus");
    scene.create();
    // scene.animated = true;
    scene.camera.position.set(0, 1, 10);
    var torusgeo = new THREE.TorusGeometry(2, 1, 64, 48);

    var torus = new THREE.Mesh(torusgeo, new THREE.MeshPhongMaterial({
        ambient: 0x555555,
        color: 0xee0000,
        emmissive: 0x00eeee,
        specular: 0x123456,
        shininess: 5,
        opacity: 0.7,
        transparent: true,
        side: THREE.DoubleSide
    }));

    scene.scene.add(torus);

    var electron = new THREE.Mesh(new THREE.SphereGeometry(0.1), new THREE.MeshLambertMaterial({
        ambient: 0x555555,
        color: 0xffff00,
        reflectivity: 100,
        side: THREE.DoubleSide
    }));

    scene.scene.add(electron);

    electron.position.set(1, 0, 0);

    scene.calc = function(t) {
        t = t / 1000;
        electron.position.set(Math.cos(t) * (2 - Math.cos(4 * t)), Math.sin(t) * (2 - Math.cos(4 * t)), Math.sin(4 * t));
        // console.log(scene);
    };

    scene.create();
}());
//]]>
</script>

A similar but simpler question
------------------------------

A socially awkward electron is traveling in a spiral path around the
surface of a cylinder.

-   The cylinder has radius $1$ and height $4$
-   The electron starts at position $(1,0,0)$, travels
    counterclockwise at a rotational speed of $1$ radian per second.
-   Its path winds around the cylinder exactly $4$ times when it
    reaches the top.

What is the electron's position at time $t$?

Awkward electron (loop)
-----------------------
<div id="electroncylindercontainer">
  <img src="media/lecture-7-electroncylindercontainer.png"></img>
</div>
<script type="text/javascript">
//<![CDATA[
  var EC = new MathScene("electroncylindercontainer");
  EC.create();
  // EC.animated = true;
  EC.camera.position.set(0, 1, 10);
  EC.cameraControls.target.set(0, 2, 0);
  var cylgeo = new THREE.CylinderGeometry(1, 1, 4, 64, 48);
  var cyl = new THREE.Mesh(cylgeo, new THREE.MeshPhongMaterial({
    ambient: 0x555555,
    color: 0xee0000,
    emmissive: 0x00eeee,
    specular: 0x123456,
    shininess: 5,
    opacity: 0.7,
    transparent: true
  }));
  EC.scene.add(cyl);
  cyl.position.set(0, 2, 0);
  var electron = new THREE.Mesh(new THREE.SphereGeometry(0.1), new THREE.MeshLambertMaterial({
    ambient: 0x555555,
    color: 0xffff00,
    reflectivity: 100,
    side: THREE.DoubleSide
  }));
  EC.scene.add(electron);
  electron.position.set(1, 0, 0);
  EC.calc = function(t) {
    t = t / 400;
    electron.position.set(Math.cos(2 * t), t / Math.PI % 4.000, Math.sin(-2 * t));
  };
//]]>
</script>

Teach the piglet of calculus
----------------------------

### How can we break down the motion into pieces the piglet of calculus can digest?

-   How would you explain the motion to the piglet?
-   The piglet needs a precise description in order to predict future
    positions.
-   If the piglet fails, it's bacon time. Don't let that happen.
-   Any ideas?

Parametric description
----------------------

We can trace the coordinates of the electron as it moves, giving
functions $$\begin{align} x&=x(t)\\ y&=y(t)\\ z&=z(t)
\end{align} $$

Equivalent formulation: view $\langle x(t),y(t),z(t)\rangle$ as a
vector-valued function.

How do we figure out these functions?

Vector valued functions: practice
=================================

One method: projection
----------------------

This is a fancy say to saying: ignore some coordinates and try to
describe the simpler motion. We already saw that ignoring coordinates is
one way of casting a shadow.

-   What happens if we ignore the $z$ coordinate of the electron on
    the cylinder?
-   Same as projecting the path into the $xy$-plane! (Looking down
    from above.)
-   What is that projection in this case?

Image in the $xy$-plane
-------------------------

The projection of the electron into the plane just moves in a circle.

-   The radius is $1$.
-   It moves at $1$ radian per second.
-   What are the $x$ and $y$ coordinates as functions of $t$?

The usual trigonometric formulas give

REDACTED

Image in the $xy$-plane
-------------------------

The projection of the electron into the plane just moves in a circle.

-   The radius is $1$.
-   It moves at $1$ radian per second.
-   What are the $x$ and $y$ coordinates as functions of $t$?

The usual trigonometric formulas give

$$(x(t),y(t))=(\cos(t),\sin(t)).$$

What about $z$?
-----------------

The key is the timing of the revolutions.

-   One revolution takes $2\pi$ seconds.
-   It should take four revolutions to get to the top ($z=4$), so
    $8\pi$ seconds.

 

A parametric description of the torus
-------------------------------------

Given two numbers $t$ and $u$ between $0$ and $2\pi$, we get a
point on a torus of radius $2$ and tube radius $1$ like this:

$$\begin{align} x(t,u)&=\cos(t)(2-\cos(u))\\
y(t,u)&=\sin(t)(2-\cos(u))\\ z(t,u)&=\sin(u) \end{align}$$

If you fix $u$, the $t$-path is a circle around the torus. If you
fix $t$, the $u$-path is a circle around the “tube”.

Use this to make a spiral path around the torus that starts at
$(1,0,0)$ and winds around the tube $4$ times before it returns to
its starting point.

Hint: substitute for $u$ as a function of $t$ to make the two act in
concert!

A parametric description of the torus
-------------------------------------

Given two numbers $t$ and $u$ between $0$ and $2\pi$, we get a
point on a torus of radius $2$ and tube radius $1$ like this:

$$\begin{align} x(t,u)&=\cos(t)(2-\cos(u))\\
y(t,u)&=\sin(t)(2-\cos(u))\\ z(t,u)&=\sin(u) \end{align}$$

If you fix $u$, the $t$-path is a circle around the torus. If you
fix $t$, the $u$-path is a circle around the “tube”.

Use this to make a spiral path around the torus that starts at
$(1,0,0)$ and winds around the tube $4$ times before it returns to
its starting point.

Think about this for next time!

Question
--------

Two tiny cars travel on paths

$$\begin{align} (x,y,z)&=(\cos(t),\sin(t),0)\\
(x',y',z')&=(0,\cos(t),\sin(t)) \end{align} $$

Will they collide?

Now suppose the second car travels at a different speed so that
$(x',y',z')=(0,\cos(\alpha t),\sin(\alpha t))$. For which
constants $\alpha$ will the tiny cars collide?

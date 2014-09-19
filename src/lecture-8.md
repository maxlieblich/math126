Vector calculus: derivatives
============================

Question
--------

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
  <img src="media/lecture-8-torus.png"></img>
</div>
<script type="text/javascript">
//<![CDATA[
(function(){
    var scene = new MathScene("torus");
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


It moves!
---------

Using the tools from last time, here is a parametric description of the
motion:

$$(x,y,z)=(\cos(t)(2-\cos(4t)),\sin(t)(2-\cos(4t)),\sin(4t))$$

In vector form:

$$\mathbf{f}(t)=\langle
\cos(t)(2-\cos(4t)),\sin(t)(2-\cos(4t)),\sin(4t)\rangle$$

What is the velocity? What *should* it be?

Velocity: derivative of position, right?
----------------------------------------

We should have that the velocity of the electron is $$\mathbf{v}(t)=\mathbf{f}'(t).$$ But what is this?

Classical definition of the derivative still works for vector-valued
functions:

$$\mathbf{f}'(t)=\lim_{h\to 0}\frac{\mathbf{f}(t+h)-\mathbf{f}(t)}{h}$$

As usual, the derivative of the position vector is the velocity vector.

Vector derivatives in practice
==============================

Calculating the derivative in practice
--------------------------------------

Given a vector function

$$\mathbf{f}(t)=\langle x(t),y(t),z(t)\rangle$$

the derivative is just

$$\mathbf{f}'(t)=\langle x'(t),y'(t),z'(t)\rangle,$$

the component-wise derivative.

The usual caveat applies: the derivative must exist for this to make
sense! I.e., this formula works when all three derivatives exist, and
when they don't neither does the derivative of $\mathbf{f}(t)$!

Practice
--------

Given the formula

$$\mathbf{f}(t)=\langle
\cos(t)(2-\cos(4t)),\sin(t)(2-\cos(4t)),\sin(4t)\rangle$$

for the motion of the electron on the torus,

-   calculate the velocity of the electron as a function of $t$
-   How does the speed vary over time?
-   (What is the “speed”, anyway? The magnitude of the velocity vector?
    That sounds right....)

Help the Piglet
---------------

The piglet of calculus tried the question on the previous slide and got
the following answer:

The derivative of $\mathbf{f}(t)=\langle
\cos(t)(2-\cos(4t)),\sin(t)(2-\cos(4t)),\sin(4t)\rangle$ is:

$$\frac{d\mathbf{f}}{dt}=\langle
-\sin(t)(2-\cos(4t))+4\cos(t)\sin(4t),
4\cos(t)\sin(4t),\sin(4t)\rangle$$

Every time the piglet enters the answer in webassign, it is marked
wrong. What mistakes did the piglet make?

The piglet
----------

Forgot to differentiate the third component!

-   Wrong: $\sin(4t)$
-   Right: $4\cos(4t)$

Used the product rule incorrectly in the second component (by just
taking the product of the derivatives)!

-   Wrong: $4\cos(t)\sin(4t)$
-   Right: $\cos(t)(2-\cos(4t))+4\sin(t)\sin(4t)$

Anything else?

Have you ever made mistakes like these?

Vector integration
==================

A new problem
-------------

A joey (baby kangaroo) is riding in her mother's pouch. She has a
smartphone with an accelerometer that continuously reports the
acceleration vector. Her friend wrote an app that calculates the
velocity at any moment in time $t$. She is too small to see out of the
pouch, but, like all infant kangaroos, she is interested in calculating
her position as a function of time. Sadly, her somewhat stupid friend
never figured out how to get the position before he started a new app
that mimics the hilarious sounds that giraffes make when embarrassed.

-   The joey records the velocity at time $t$ as $$\mathbf{v}(t)=\langle 1,t,\sin(t)\rangle$$
-   The joey starts at the point $(0,0,1)$
-   Where is the joey at time $t$?

Integrate!
----------

Just like one variable calculus: reconstruct position from velocity by
integrating.

-   Riemann sums: $\sum\mathbf{v}(t_i)\Delta(t)$
-   Practical: $$\int\langle x(t),y(t),z(t)\rangle
    dt=\left\langle\int x(t)dt,\int y(t)dt,\int
    z(t)dt\right\rangle.$$
-   Example: $$\int\langle 1,t,t^2\rangle dt=\langle
    a,b,c\rangle+\left\langle
    t,\frac{1}{2}t^2,\frac{1}{3}t^3\right\rangle$$
-   The constant of integration is now a vector!

Help the joey
-------------

Using vector integration, compute the path that the joey takes, starting
at $t=0$. Initial position: $(0,0,1)$, velocity $\langle
1,t,\sin(t)\rangle$. A looping animation (for $t=0$ to $t=15$ in
slo-mo):

<div id="joeycontainer">
  <img src="media/lecture-8-joeycontainer"></img>
</div>
<script type="text/javascript">
//<![CDATA[
  var joey = new MathScene("joeycontainer");
  joey.camera.position.set(22, 20, 15);
  joey.cameraControls.target.set(3, 0, 3);
  joey.renderer.shadowMapEnabled = true;
  joey.renderer.shadowMapSoft = true;
  joey.renderer.shadowCameraNear = 3;
  joey.renderer.shadowCameraFar = joey.camera.far;
  joey.renderer.shadowCameraFov = 50;
  joey.renderer.shadowMapBias = 0.0039;
  joey.renderer.shadowMapDarkness = 1.0;
  joey.renderer.shadowMapWidth = 1024;
  joey.renderer.shadowMapHeight = 1024;
  joey.pointLight.intensity = 0;
  joey.spot = new THREE.SpotLight(0xffffff, 0.7);
  joey.spot.position.set(40, 40, 40);
  joey.spot.castShadow = true;
  joey.spot.shadowDarkness = 1.0;
  joey.spot.shadowCameraFov = 50;
  joey.scene.add(joey.spot);
  joey.joey = new THREE.Mesh(new THREE.SphereGeometry(0.6), new THREE.MeshLambertMaterial({
    color: 0xff0000,
    ambient: 0x333333
  }));
  joey.joey.castShadow = true;
  joey.joey.receiveShadow = true;
  joey.scene.add(joey.joey);
  joey.joey.position.set(0, 0, 1);
  joey.joeylet = new THREE.Mesh(new THREE.SphereGeometry(0.3), new THREE.MeshLambertMaterial({
    color: 0xffff00,
    ambient: 0x123456
  }));
  joey.joeylet.castShadow = true;
  joey.joeylet.receiveShadow = true;
  joey.scene.add(joey.joeylet);
  joey.joeylet.position.set(0, 0, 1);
  joey.ground = new THREE.Mesh(new THREE.PlaneGeometry(30, 40), MathScene.UWMaterial.clone());
  //joey.ground.rotation.set(3 * Math.PI / 2, 0, 0);
  joey.ground.position.set(0, 0, 0);
  joey.ground.castShadow = true;
  joey.ground.receiveShadow = true;
  joey.scene.add(joey.ground);
  joey.y = function(t) {
    return 0.05 * t ^ 2;
  };
  joey.z = function(t) {
    return 2 - Math.cos(t);
  };
  joey.x = function(t) {
    return t;
  };

  joey.calc = function(t) {
    t = t / 300 % 15;
    joey.joey.position.set(joey.x(t), joey.y(t), joey.z(t));
    joey.joeylet.position.set(joey.x(t - 0.5), joey.y(t - 0.5), joey.z(t - 0.5));
  };

  joey.create();
//]]>
</script>

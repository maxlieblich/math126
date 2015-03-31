Vector valued functions
=======================

We are now going to start studying the calculus of one-dimensional objects in three-dimensional space. In other words, the properties of curves. What forces does a bean sliding along a track experience? How do we mathematically express the notion of curvature? How do we calculate the velocity of a moving particle, or the total distance it travels during a motion? As you will see, the key is to use vectors to leverage the familiar calculus of one variable.

### Medium-term question

Here's a question that we will return to a few times. It deals with a path on a surface. This is how it goes:

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

#### Fun-loving electron in action

Here's a display of the electron skittering around on the torus. The electron will move when you click on the scene; it might freeze when you stop interacting, to save resources.

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

### A similar but simpler question

As usual, it is often instructive to start with a *simpler* question that has the same flavor. Here's one:

A socially awkward electron is traveling in a spiral path around the
surface of a cylinder.

-   The cylinder has radius $1$ and height $4$
-   The electron starts at position $(1,0,0)$, travels
    counterclockwise at a rotational speed of $1$ radian per second.
-   Its path winds around the cylinder exactly $4$ times when it
    reaches the top.

What is the electron's position at time $t$?

#### Awkward electron (loop)

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

### Teach the piglet of calculus

In medicine, they have a saying: "see one, do one, teach one". If you are learning to do a complex procedure at the critical boundary of life and death, you *learn it better when you have to explain it to someone*. Effortful recall, thinking hard, dredging up explanations -- these lead to learning. Going through the motions just to get to the next thing...not so much.

So here's an exercise: can you explain what is happening here to the piglet of calculus? (The piglet of calculus is our mascot. You may not have seen a picture yet, but you will.) More precisely, think about the following.

#### How can we break down the motion into pieces the piglet of calculus can digest?

-   How would you explain the motion to the piglet?
-   The piglet needs a precise description in order to predict future
    positions. The piglet needs the *coordinates*.
-   If the piglet fails, it's bacon time. Don't let that happen.

Before moving on, *take a moment to think about this*. It will be better if you have struggled with this for a bit before you see one way to approach it.

### Parametric description

We can trace the coordinates of the electron as it moves, giving
functions $$\begin{align} x&=x(t)\\ y&=y(t)\\ z&=z(t)
\end{align} $$

Equivalent formulation: view $\langle x(t),y(t),z(t)\rangle$ as a
vector-valued function.

How do we figure out these functions?


### One method: projection

One common method is to project the path on lower-dimensional spaces in order to build it up from simpler parts. This is a fancy say to saying: ignore some coordinates and try to
describe the simpler motion. We already saw that ignoring coordinates is
one way of *casting a shadow*.

Here's an example of this method in practice.

#### Image in the $xy$-plane

As we've seen, ignoring the $z$ coordinate of the electron on the cylinder is the same as projecting the path into the $xy$-plane. (In other words, look down at the motion from directly above.) For the electron spiraling up the cylinder, projecting to the $xy$-plane eliminates the "up" from the description. That is, the projection of the electron into the plane just moves in a circle.

-   The radius is $1$.
-   It moves at $1$ radian per second.

What are the $x$ and $y$ coordinates as functions of $t$? The usual trigonometric formulas give

$$(x(t),y(t))=(\cos(t),\sin(t)).$$

This already gives us two of the three coordinates! We're almost done!

#### What about $z$?

The key to finding the last coordinate $z(t)$ is the timing of the revolutions. One revolution takes $2\pi$ seconds. It should take four revolutions to get to the top ($z=4$), so $8\pi$ seconds. Putting these together: $z(t)=4t/8\pi$.

#### Putting it all together

Reassembling the simpler parts, we end up with this description of our path up the cylinder.

$$(x(t), y(t), z(t)) = (\cos(t),\sin(t), t/2\pi).$$

Beautiful!

Now what about the torus?
 

### A parametric description of the torus

One way to attack the torus us to unzip it and roll it out onto a square. The fancier way to say this is: we can leverage a two-dimensional parametric description of the surface of the torus. *Note*: you may never have seen anything like this before. Enjoy it!

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

This is not trivial when you are just learning about these things. That is why it is worth doing.

### Question

Let's end with a question to think about as you reflect on this material. Two tiny cars travel on paths

$$\begin{align} (x,y,z)&=(\cos(t),\sin(t),0)\\
(x',y',z')&=(0,\cos(t),\sin(t)) \end{align} $$

Will they collide? What does it mean to collide? It means that the cars will be in the same place at the same time.

To make things more interesting, now suppose the second car travels at a different speed so that
$(x',y',z')=(0,\cos(\alpha t),\sin(\alpha t))$. For which
constants $\alpha$ will the tiny cars collide?

### Videos
[7-1](http://www.math.washington.edu/~lieblich/Math126/video/7-1.mp4)
[7-2](http://www.math.washington.edu/~lieblich/Math126/video/7-2.mp4)

### Content Contributors
@maxlieblich

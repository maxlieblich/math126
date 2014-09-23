Lines and planes: introduction
==============================

Warm up
-------

**Question:** how can we describe the line of intersection of two
planes?

<div id="warm-up">
  <img src="media/lecture-5-warm-up.png"></img>
</div>
<script type="text/javascript">
//<![CDATA[
(function(){
var scene = new MathScene("warm-up");
scene.scene.add(new THREE.AxisHelper(3));
scene.camera.position.set(6, 8, 4);
var plane1 = new PlaneShadowModel({
  normal: [3, 4, 5],
  position: [0, 0, 0],
  color: 0xaaaa00
  });
var plane2 = new PlaneShadowModel({
  normal: [-3, 5, 0],
  position: [0, 0, 0],
  color: 0x00aaaa
  });
  plane1.embedInScene(scene);
  plane2.embedInScene(scene);
}());
//]]>
</script>


Warm up
-------

**Simpler:** what is the intersection of the planes $x=0$ and $y=0$

<div id="simple">
  <img src="media/lecture-5-simple.png"></img>
</div>
<script type="text/javascript">
//<![CDATA[
(function(){
var scene = new MathScene("simple");
scene.scene.add(new THREE.AxisHelper(3));
scene.camera.position.set(6, 8, 4);
var plane1 = new PlaneShadowModel({
  normal: [1, 0, 0],
  position: [0, 0, 0],
  color: 0xaaaa00
  });
var plane2 = new PlaneShadowModel({
  normal: [0, 1, 0],
  position: [0, 0, 0],
  color: 0x00aaaa
  });
  plane1.embedInScene(scene);
  plane2.embedInScene(scene);
}());
//]]>
</script>


The enemy of my enemy...
------------------------

-   What is a plane?
-   The plane is perpendicular to the line that is perpendicular to it
    (?!?!!?!)

The enemy of my enemy...
------------------------

-   What is a plane?
-   The plane is perpendicular to the line that is perpendicular to it
    (?!?!!?!)

Quick review
------------

How can you tell if two vectors $\mathbf{a}$ and $\mathbf{b}$ are
perpendicular?

Quick review
------------

How can you tell if two vectors $\mathbf{a}$ and $\mathbf{b}$ are
perpendicular?

So how do you write the equation describing "the set of all endpoints of
vectors $\mathbf{b}$ that are perpendicular to a fixed vector
$\mathbf{a}$"?

Quick review
------------

How can you tell if two vectors $\mathbf{a}$ and $\mathbf{b}$ are
perpendicular?

So how do you write the equation describing "the set of all endpoints of
vectors $\mathbf{b}$ that are perpendicular to a fixed vector
$\mathbf{a}$"?

Don't look at the next slide if you don't want to see the answer!

Quick review
------------

How can you tell if two vectors $\mathbf{a}$ and $\mathbf{b}$ are
perpendicular?

So how do you write the equation describing "the set of all endpoints of
vectors $\mathbf{b}$ that are perpendicular to a fixed vector
$\mathbf{a}$"?

If $\mathbf{a}=\langle \alpha,\beta,\gamma\rangle$ then the
equation is

$$\alpha x+\beta y+\gamma z = 0.$$

Quick review
------------

How can you tell if two vectors $\mathbf{a}$ and $\mathbf{b}$ are
perpendicular?

So how do you write the equation describing "the set of all endpoints of
vectors $\mathbf{b}$ that are perpendicular to a fixed vector
$\mathbf{a}$"?

If $\mathbf{a}=\langle \alpha,\beta,\gamma\rangle$ then the
equation is

$$\alpha x+\beta y+\gamma z = 0.$$

Example: if $\mathbf{a}=\langle 1, 2, -1\rangle$, you get
$x+2y-z=0$.

Quick review
------------

How can you tell if two vectors $\mathbf{a}$ and $\mathbf{b}$ are
perpendicular?

So how do you write the equation describing "the set of all endpoints of
vectors $\mathbf{b}$ that are perpendicular to a fixed vector
$\mathbf{a}$"?

If $\mathbf{a}=\langle \alpha,\beta,\gamma\rangle$ then the
equation is

$$\alpha x+\beta y+\gamma z = 0.$$

Example: if $\mathbf{a}=\langle 1, 2, -1\rangle$, you get
$x+2y-z=0$.

What shape is that?

Piglet of calculus conjectures
------------------------------

Any plane is just the set of endpoints of vectors perpendicular to a
fixed one! So just fix a vector $\mathbf{u}$ and let

$$P_{\mathbf{u}}=\{\mathbf{v}\textrm{ such that }\mathbf{v}\cdot\mathbf{u}=0\}.$$

For example, the $xy$-plane is the set of endpoints of vectors
perpendicular to $\langle 0,0,1\rangle$

Does it work? Can the piglet of calculus go to sleep now?

Conundrum: translation
----------------------

-   This is OK if the plane can be anchored like vectors can at
    $(0,0,0)$.
-   If not, we have to take what we just did and translate it in space
    (i.e., move it away from $(0,0,0)$).
-   This is just like making the plane $z=4$ by translating the
    $xy$-plane up $4$ units: the plane $z=4$ is **not** the set of
    **endpoints** of vectors perpendicular to $\mathbf{k}$, just a
    parallel **translation** of it.

Lines and planes: doing it
==========================

Planes described using vectors
------------------------------

If $\mathbf{u}=\langle\alpha, \beta,\gamma\rangle$ is
perpendicular to plane $P$ and $u=(a,b,c)$ is a point of $P$, we
can describe $P$ like this:

$$P=\{(x,y,z):\langle x-a, y-b, z-c\rangle\cdot\mathbf{u}=0\}$$

-   Get a linear equation: $\alpha(x-a)+\beta(y-b)+\gamma(z-c)=0$
-   Any linear equation gives a plane.

Planes described using vectors
------------------------------

Describe the plane $x-3y+47z-28=0$ using vectors.

-   Normal vector: $\langle 1,-3,47\rangle$. How did I know?
-   Trick: always just use the coefficients of $x$, $y$, and $z$
-   To translate: find one solution by eyeballs. A solution:
    $(-16,1,1)$.
-   So the plane is the set of endpoints of vectors $\mathbf{v}$ such
    that
-   Another way to say it: it is what you get when you take the set of
    vectors perpendicular to $\langle 1, -3, 47\rangle$ and
    translate them all by $\langle -16, 1, 1\rangle$ (and then just
    keep the set of endpoints)

Practice
--------

Describe the plane $3x-4y-5z=6$ using vectors.

Who cares?
----------

-   Using this approach, you can prove that any plane is the set of
    solutions of a linear equation in $x,y,z$ (see book!).
-   This gives us a way to get a grip on the intersection of two planes.

Example
-------

-   Describe the intersection of the planes $x-2y-z=0$ and
    $2x-y+z=6$.
-   Perpendicular vectors: $\langle 1,-2,-1\rangle$ and $\langle
    2,-1,1\rangle$
-   Common solution: $(2,0,2)$
-   Thus, the line of intersection is the set of vectors $\mathbf{v}$
    such that

    $$(\mathbf{v}-\langle 2,0,2\rangle)\cdot\langle
    1,-2,-1\rangle=0$$

    and

    $$(\mathbf{v}-\langle 2,0,2\rangle)\cdot\langle
    2,-1,1\rangle=0.$$

-   The vector $\mathbf{v}-\langle 2,0,2\rangle$ is perpendicular to
    both: cross product!
-   The line is just the endpoints of vectors of the form

    $$\langle 2,0,2\rangle+t\langle 1,-2,-1\rangle\times\langle
    2,-1,1\rangle,$$

    where $t$ ranges over all scalars. Parametric equations!

Last step: expand cross product
-------------------------------

To describe $\langle 2,0,2\rangle+t\langle
1,-2,-1\rangle\times\langle 2,-1,1\rangle$, let's expand:

-   $\langle 1,-2,-1\rangle\times\langle 2,-1,1\rangle=\langle
    -3,-3,3\rangle$
-   So the line is given by the endpoints of the vectors $\{\langle
    2,0,2\rangle+t\langle -3,-3,3\rangle\}$
-   Parametric form: $(x,y,z)=(2-3t,-3t,2+3t)$
-   As $t$ varies, this traces out the line of intersection.

More practice
-------------

-   Describe the intersection of $3x+4y+5z=6$ and $y+z=0$.
-   Describe the intersection of $3x+4y+5z=6$ and $6x+8y+10y=12$.
-   Describe the intersection of $3x+4y+5z=6$ and $9x+12y+15z=17$.

Lines and planes: introduction
==============================

In this lecture we will use our new understanding of vectors to attack the simplest shapes: lines and planes. This is our first witness to the raw power of the simple theory we've developed.

### Warm up

Let's start with a simple question.

**Question:** how can we describe the line of intersection of two planes?

<div id="warm-up-q">
  <img src="media/lecture-5-warm-up.png"></img>
</div>

<script type="text/javascript">
//<![CDATA[
(function(){
var scene = new MathScene("warm-up-q");
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

-----------

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


### The enemy of my enemy...

Since vectors have shown us they have a deep understanding of angles, it turns out that the following description of a plane is key:

*A plane $P$ is perpendicular to the line that is perpendicular to $P$ (?!?!!?!)*

That is to say, if I think of a flagpole above the schoolyard, we get what are known as *dual* descriptions: "the pole is perpendicular to the yard" is dual to "the yard is perpendicular to the pole". This lets us use lines to understand planes (or vice versa).

### Lines are vectors that won't quit

This duality idea is only helpful if one of the two sides is easy to understand. This is a common theme in mathematics: we often find ourselves doing some kind of transformation that translates information between contexts, and we hope that one of those contexts is simpler to understand. In an ideal setup, the translation procedure loses no information and is perfectly bidirectional. This is precisely the position we find ourselves in here.

#### Specifying a line

To specify a line, we need to give

- a **point** in space that is contained in the line, and
- a **vector** that encodes the direction of the line.

You get the line by starting at the point and looking at the "line spanned by the vector" -- all of the scalar multiples of the vector. The set of all of the endpoints you get this way is precisely the line.

For example, the line below passes through the point $(1, 2, 3)$ and has direction parallel to $\langle -3, 2, 1\rangle$. We've embedded a small sphere at the point and a vector along the direction so you can see what is going on. (If you can manipulate it, you can get a sense for how it is embedded in space. Otherwise: make some examples on your own!)

<div id="line">
  <img src="media/lecture-5-line.png"></img>
</div>

<script type="text/javascript">
//<![CDATA[
(function(){
var scene = new MathScene("line");
scene.scene.add(new THREE.AxisHelper(3));
scene.camera.position.set(8, 15, 8);
var x = function (t) {
  return 1 - 3 * t;
}
var y = function (t) {
  return 2 + 2 * t;
}
var z = function (t) {
  return 3 + t;
}

var line = new ParametricPathModel(
  x, y, z, [-10, 10], 0, 2
);

line.embedInScene(scene);

var sphGeom = new THREE.SphereGeometry(0.03);
var sph = new THREE.Mesh(sphGeom, MathScene.UWMaterial.clone());
sph.position.set(1, 2, 3);

scene.scene.add(sph);

var vec = new VectorModel({origin: [1, 2, 3], vector: [-3, 2, 1], color: 0xff00ff});

vec.embedInScene(scene);
}());
//]]>
</script>

### Making a plane

Here's the **dual** perspective. Instead of making a *line* from a point and a vector, we can make a *plane*: the plane that passes through that point and is perpendicular to that line (i.e., to that vector). Here's a picture using the same setup as above.

<div id="line-and-plane">
  <img src="media/lecture-5-line-and-plane.png"></img>
</div>

<script type="text/javascript">
//<![CDATA[
(function(){
var scene = new MathScene("line-and-plane");
scene.scene.add(new THREE.AxisHelper(3));
scene.camera.position.set(8, 15, 8);
var x = function (t) {
  return 1 - 3 * t;
}
var y = function (t) {
  return 2 + 2 * t;
}
var z = function (t) {
  return 3 + t;
}

var line = new ParametricPathModel(
  x, y, z, [-10, 10], 0, 2
);

line.embedInScene(scene);

var sphGeom = new THREE.SphereGeometry(0.03);
var sph = new THREE.Mesh(sphGeom, MathScene.UWMaterial.clone());
sph.position.set(1, 2, 3);

scene.scene.add(sph);

var vec = new VectorModel({origin: [1, 2, 3], vector: [-3, 2, 1], color: 0xff00ff});

vec.embedInScene(scene);

var pl = new PlaneShadowModel({normal: [-3, 2, 1], position: [1, 2, 3]});
pl.embedInScene(scene);
console.log(pl);
}());
//]]>
</script>

### Equations for perpendicularity

**Question**: How can you tell if two vectors $\mathbf{a}$ and $\mathbf{b}$ are
perpendicular?

**(One) Answer**: Test if $\mathbf{a}\cdot\mathbf{b}=0$.

So how do you write the equation describing "the set of all endpoints of
vectors $\mathbf{b}$ that are perpendicular to a fixed vector
$\mathbf{a}$"? Well, if $\mathbf{a}=\langle \alpha,\beta,\gamma\rangle$ then the equation is

$$\alpha x+\beta y+\gamma z = 0.$$

Example: if $\mathbf{a}=\langle 1, 2, -1\rangle$, you get
$x+2y-z=0$.

What shape is that? It's the solutions to a *linear* equation, so it should be *flat*. Convince yourself that this is a plane. Then try to prove it if you really want to think about what is going on.

#### The catch

What we have above has one catch: the perpendicularity of *vectors* cannot make reference to position, because **vectors do not have a position**. But planes do -- they are located *somewhere*. 

#### The fix

Just like what we say with a line, we need to *find or fix one point on the plane* and use it as a **basepoint**.

*NEVER FORGET THIS*: use a common basepoint when doing calculations with vectors to describe a plane.

### Calculating the equation

If $\mathbf{u}=\langle\alpha, \beta,\gamma\rangle$ is
perpendicular to plane $P$ and $u=(a,b,c)$ is a point of $P$, we
can describe $P$ like this:

$$P=\{(x,y,z):\langle x-a, y-b, z-c\rangle\cdot\mathbf{u}=0\}$$

This gives us a *linear* equation for the plane: $\alpha(x-a)+\beta(y-b)+\gamma(z-c)=0$. Challenge problem: any linear equation gives a plane. (Most of the challenge here is philosophical -- what does "plane" mean? Is there any way to define it other than using a linear equation? Maybe you could define it in terms of perpendicularity to a line, using our "duality formalism".)

#### An example

Describe the plane $x-3y+47z-28=0$ using vectors.

-   Normal vector: $\langle 1,-3,47\rangle$. How did I know?
-   Trick: always just use the coefficients of $x$, $y$, and $z$. (This isn't actually a trick; it is math. Try to understand this. If, by the end of this lecture, you have no idea why this is true, start over again. Really. Keep thinking hard about it. If you are still confused, post on the forum or come to office hours. Things like this should not just swim by -- catch this fish and eat it!)
-   We now have the normal vector, but *we still need our basepoint*. We need to find one solution by eyeballs. A solution: $(-16,1,1)$. (How do we know? It works! How did I find this? Randomly. Strategies you could *try*: set two of the variables equal to $0$ and solve for the third. Danger: that is not guaranteed if you make bad choices.)
-   So the plane is the set of endpoints of vectors $\mathbf{v}$ such
    that $$(\mathbf{v} - \langle -16, 1, 1\rangle)\cdot\langle 1, -2, 47\rangle=0.$$
-   Another way to say it: it is what you get when you take the set of
    vectors perpendicular to $\langle 1, -3, 47\rangle$ and
    translate them all to start at $\langle -16, 1, 1\rangle$ (and then just
    keep the set of endpoints).

#### One for you to practice

Describe the plane $3x-4y-5z=6$ using vectors. In other words: find a *point* $(a, b, c)$ on the plane and a *normal vector* $\mathbf{u}$ to the plane, and use these to think of the equation has having the form $(\langle x, y, z\rangle - \langle a, b, c\rangle\cdot\mathbf{u}$

### One beautiful application of this method

Once we have grasped how to describe planes using points and vectors, we can suddenly get a deep understanding of how planes *intersect*. Let us illustrate with an example.

#### Example

Suppose we want to describe the intersection of the planes $x-2y-z=0$ and $2x-y+z=6$. There are a few options: the intersection could be

1. a plane (if the two planes are the same)
2. empty (if the two planes are parallel but not the same)
3. a line (otherwise)

How can we tell if two planes are parallel? Using the dual formulation, we can see that two *planes* are parallel if and only if their *normal vectors* are parallel. So we need to compute those and start to think.

We can get normal vectors to the plane from the equations: the first plane has normal vector $\langle 1,-2,-1\rangle$ and the second has normal vector $\langle 2,-1,1\rangle$. (Be careful: the normal vector is not unique. This is perfectly fine, but it can make things confusing. Meta-point: when things are not unique -- especially when people have *chosen* things -- the opportunity to make a mistake arises. Be especially careful when choices are being made! Then the math machine is not running by itself and it can grab you by the shirt and grind you to a pulp if you lean in too closely.)

The two normal vectors are not parallel. What does this tell us? It tells us that the planes have to intersect in a line. But how do we find this line? Well, we need a *point* on the line and a *vector* giving the direction of the line. Finding a point is "easy": we just need a common solution of the two equations. Here's one: $(2,0,2)$. (How did I find this? By finding it. There are many ways to do this. Go read about them or watch videos about them and try them!)

The line of intersection is exactly the points on both planes. But we have conditions defined using vectors that *describe* what it means to be on each plane. A vector $\mathbf{v}$ has endpoint in the first plane if 
$$(\mathbf{v}-\langle 2,0,2\rangle)\cdot\langle 1,-2,-1\rangle=0$$
and it has endpoint in the second plane if $$(\mathbf{v}-\langle 2,0,2\rangle)\cdot\langle 2,-1,1\rangle=0.$$

In other words, to be on both planes the vector $\mathbf{v}-\langle 2,0,2\rangle$ is perpendicular to both $\langle 1, -2, -1\rangle$ and to $\langle 2, -1, 1\rangle$. How do we find one vector that is simultaneously perpendicular to two vectors: using the cross product! That is to say, a direction vector for the line of intersection is given by the cross product $\langle 1, -2, -1\rangle\times\langle 2, -1, 1\rangle$.

Using what we learned about how to describe lines using a point and a vector, we find that the line of intersection is just the endpoints of vectors of the form $$\langle 2,0,2\rangle+t\langle 1,-2,-1\rangle\times\langle 2,-1,1\rangle,$$ where $t$ ranges over all scalars. This is a set of parametric equations for the line!

Here's what it looks like with the cross-product computed:

-   $\langle 1,-2,-1\rangle\times\langle 2,-1,1\rangle=\langle
    -3,-3,3\rangle$
-   So the line is given by the endpoints of the vectors $\{\langle
    2,0,2\rangle+t\langle -3,-3,3\rangle\}$
-   Parametric form: $(x,y,z)=(2-3t,-3t,2+3t)$
-   As $t$ varies, this traces out the line of intersection.

#### Here are some for you to try

If you don't try these you will never learn anything. Familiarity is not learning. Watching is not doing. Reading is not thinking.

-   Describe the intersection of $3x+4y+5z=6$ and $y+z=0$.
-   Describe the intersection of $3x+4y+5z=6$ and $6x+8y+10y=12$.
-   Describe the intersection of $3x+4y+5z=6$ and $9x+12y+15z=17$.

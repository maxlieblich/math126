# Vectors Defined, Manipulated

## Summary

Today we'll introduce **vectors**. We'll define some geometric operations
on vectors including addition and scaling. Finally we'll translate our
geometric considerations into algebra via coordinates.

## Motivating Vectors

Imagine pushing a book across a desk with your finger. How would you
communicate to someone else precisely how you pushed the book? For a good
approximation, you'd need to specify the direction of your push and how
strong it was. Now imagine an arrow attached to your finger pointing
through the book, with the length of the arrow increasing or decreasing
depending on how hard you push. Roughly, that arrow is a **vector** which
describes your push quantitatively.

Continuing informally, a vector is an object with two properties: direction
and magnitude. It's a surprisingly flexible concept. They also model...

-   Displacement from a fixed point
-   Velocity
-   Acceleration
-   The law of cosines
-   Force applied by angry customers
-   Direction of magnetic fields
-   Polarization of photons
-   ...

## Defining Vectors

More formally, a **vector** is a directed line segment up to translation
equivalence. That is, a vector has a start point and an end point, but
if we move both the start point and end point in the same way, we have the
same vector.

For example, here's a vector in 3D:
<div id="vector">
  <img src="media/lecture-2-vector.png"></img>
</div>
<script type="text/javascript">
//<![CDATA[
(function(){
    var scene = new MathScene("vector");
    var vec = new VectorModel({color: 0xff00ff, vector: [1, 2, 2]});
    scene.scene.add(vec.arrow);
    scene.scene.add(new THREE.AxisHelper());
    scene.camera.position.set(4, 6, 5);
    scene.create();
})();
//]]>
</script>
This vector starts at the origin and ends at $(1, 2, 2)$. (Red is the
x-axis, green is the y-axis, blue is the z-axis.) We write this vector
as $\langle 1, 2, 2 \rangle$ (read as "The vector one two two").

Important yet confusing: two vectors are equivalent if they have the
same direction and magnitude, i.e. if you can translate one to the other
without rotation or reflection. Here's four copies of the **same vector**
$\langle 0.1, 0, 1 \rangle$:

<div id="equivVectors">
  <img src="media/lecture-2-equivVectors.png"></img>
</div>
<script type="text/javascript">
//<![CDATA[
(function(){
    var scene = new MathScene("equivVectors");
    var makeVector = function (pos, dir) {
        var vec = new VectorModel({color: 0xff00ff, origin: pos, vector: dir});
        return vec;
    }
    positions = [[0, 0, 0], [1, 0, 0], [1, 1, 1], [0, 2, 0]];
    for (var i = 0; i < positions.length; i++){
        var vec = makeVector(positions[i], [0.1, 0, 1]);
        vec.embedInScene(scene);
    }
    scene.scene.add(new THREE.AxisHelper());
    scene.camera.position.set(-1, 6, 2);
})();
//]]>
</script>

**Exercise:** Which vectors are equivalent to others in this picture?
(For simplicity, they live in a plane. Vectors can live in space with
any number of dimensions.)

<div id="vector-check">
  <img src="media/lecture-2-vector-check.png"></img>
</div>
<script type="text/javascript">
//<![CDATA[
(function(){
    var scene = new MathScene("vector-check");
    scene.camera.position.set(0, -10, 0);
    scene.cameraControls.enabled = false;
    var makeVector = function (pos, dir) {
        return new VectorModel({color: 0xff0000, origin: pos, vector: dir});
    }
    dir = [3, 0, 4];
    positions = [[-5, 0, -1], [-3, 0, -1], [-1, 0, -1], [2.5, 0, -1], [4.5, 0, 1]];
    dirs = [[1.5, 0, 2], [1.5, 0, 2], [2, 0, 3], [-1.5, 0, 2], [-1.5, 0, -2]]
    vectors = []
    for (var i = 0; i < positions.length; i++){
        var vec = makeVector(positions[i], dirs[i]);
        vec.embedInScene(scene);
    }
})();
//]]>
</script>

### Vectors, Points, and Zero

The **zero vector** $\langle 0, 0, 0 \rangle$ starts and ends at the same
point. It represents the "trivial displacement" (go nowhere!). It has
magnitude $0$ and "any" direction; all other vectors have a single
direction. (This points out a weakness in the "definition" of a vector as
an object with direction and magnitude, since the zero vector has no single
direction, but allowing the zero vector will bring us only happiness.)

We write $\mathbf{0}$ for the zero vector, though depending on context we
may also mean $\mathbf{0} = \langle 0, 0 \rangle$. More generally we
frequently refer to vectors via bold variables like $\mathbf{u}$ or
$\mathbf{v}$. We may instead draw an arrow over variable names like
$\vec{a}$ or $\vec{b}$.

Since a vector can always be thought of as starting at the origin, we
will almost always represent vectors as arrows starting at the origin.
We will also frequently translate between points and vectors without
comment. Finally, given two points $P$ and $Q$, the vector starting at
$P$ ending at $Q$ is written $\overrightarrow{PQ}$.

## Adding Vectors Graphically

If I jog north-northwest 2 miles and then southwest 3 miles, where do I end
up? Represent the NNW leg by a red vector and the SW leg by a blue vector:

<div id="vector-add-1">
  <img src="media/lecture-2-vector-add-1.png"></img>
</div>
<script type="text/javascript">
//<![CDATA[
(function(){
    var scene = new MathScene("vector-add-1");
    scene.camera.position.set(0, 8, 0);
    scene.cameraControls.enabled = false;
    var v1 = new VectorModel({color: 0xff0000, vector: [1, 0, 2]});
    var v2 = new VectorModel({color: 0x0000ff, vector: [2, 0, -3]});
    // scene.scene.add(v1.arrow);
    // scene.scene.add(v2.arrow);
    v1.embedInScene(scene);
    v2.embedInScene(scene);
})();
//]]>
</script>

Translate the second one so that it starts at the end of the first one:

<div id="vector-add-2">
  <img src="media/lecture-2-vector-add-2.png"></img>
</div>
<script type="text/javascript">
//<![CDATA[
(function(){
    var scene = new MathScene("vector-add-2");
    scene.camera.position.set(0, 8, 0);
    scene.cameraControls.enabled = false;
    var v1 = new VectorModel({color: 0xff0000, vector: [1, 0, 2]});
    var v2 = new VectorModel({color: 0x0000ff, origin: [1, 0, 2], vector: [2, 0, -3]});
    v1.embedInScene(scene);
    v2.embedInScene(scene);
})();
//]]>
</script>

Connect the start of the first with the end of the translated second. This gives
purple as the result of adding red and blue:

<div id="vector-add-3">
  <img src="media/lecture-2-vector-add-3.png"></img>
</div>
<script type="text/javascript">
//<![CDATA[
(function(){
    var scene = new MathScene("vector-add-3");
    scene.camera.position.set(0, 8, 0);
    scene.cameraControls.enabled = false;
    var v1 = new VectorModel({color: 0xff0000, vector: [1, 0, 2]});
    var v2 = new VectorModel({color: 0x0000ff, origin: [1, 0, 2], vector: [2, 0, -3]});
    var v3 = new VectorModel({color: 0x551a8b, vector: [3, 0, -1]});
    v1.embedInScene(scene);
    v2.embedInScene(scene);
    v3.embedInScene(scene);
})();
//]]>
</script>

Moreover, the purple vector represents my final position after jogging both
legs, so this is a physically useful operation.

**Exercise:** Check yourself before you wreck yourself! What is the sum of
the vector connecting points $p_1$ and $p_2$ and the vector connecting points
$p_2$ and $p_3$?

**Exercise:**

-   Let $A,B,C,D$ be the vertices of a square. Choose a specific
    example if you want. Compute the sum of vectors
    $$\overrightarrow{AB}+\overrightarrow{BC}
      +\overrightarrow{CD}+\overrightarrow{DA}.$$
-   Let $A_1,A_2,A_3,A_4,A_5,A_6$ be points. Compute the sum
    $$\overrightarrow{A_1A_2}+\overrightarrow{A_2A_3}
      +\overrightarrow{A_3A_4}+\overrightarrow{A_4A_5}
      +\overrightarrow{A_5A_6}+\overrightarrow{A_6A_1}.$$

## Scaling Vectors Graphically

Given a vector $\mathbf{v}$, there's an obvious interpretation of
$2\mathbf{v}$: it's the same as $\mathbf{v}$ but twice as long.
Likewise $\mathbf{v}/2$ is $\mathbf{v}$ but half as long. What about
negatives? They reverse the direction of the vector.

**Exercise:** Show graphically that

-   $\mathbf{v} + \mathbf{v} = 2\mathbf{v}$.
-   $\mathbf{v} + (-\mathbf{v}) = \mathbf{0}$.

**Exercise:** (Difficult.) Let $A, B, C$ be vertices of a triangle.
What is
    $$ \frac{A+B+C}{3} $$
geometrically? (Here we're treating $A$ as the vector
$\overrightarrow{OA}$ where $O$ is the origin.) Does it lie inside
the triangle or outside? (Hint: look up "barycentric coordinates.")

## Manipulating Vectors Algebraically

The geometric definitions above are simple and beautiful. They are
not particularly efficient: to add two vectors, you have to draw
them out. So, we'll next distill the essence of these definitions
into a few algebraic rules. To motivate those rules, try the
following concrete examples first:

**Exercise:**

1. Consider the vectors $\langle 1,0,0\rangle$ and $\langle
   0,1,0\rangle$. Find $a,b,c$ such that
   $$\langle1,0,0\rangle+\langle 0,1,0\rangle=\langle a,b,c\rangle.$$
2. Show that
   $$\langle 0,3,4\rangle+\langle 1,-1,0\rangle=\langle
     1,2,4\rangle$$
   from the geometric definition.
3. Calculate the length of the vector connecting the point $(0,2,4)$
   to the point $(1,-1,1)$.

From these examples (and similar ones) we can guess a few general
rules for computing scaled vector sums, which we'll get to shortly.
It's often convenient to "decompose" a vector into coordinates:
for instance, in $\langle a, b, c\rangle$, $a$ is called the x-coordinate,
$b$ is the y-coordinate, and $c$ is the z-coordinate. Using the first
property below, we can frequently reduce general properties of vectors
to their one-dimensional counterparts, like the second property below:

**Exercise:** Prove **any three** from the geometric definition:

1. $$\langle a, b, c \rangle = \langle a, 0, 0 \rangle
     + \langle 0, b, 0 \rangle + \langle 0, 0, c \rangle.$$
2. $$t \langle a, 0, 0 \rangle = \langle ta, 0, 0 \rangle.$$
3. $$t \langle a, b, c \rangle = \langle ta, tb, tc \rangle.$$
4. $$\langle a, b, c \rangle + \langle a', b', c' \rangle
     = \langle a+a', b+b', c+c' \rangle.$$
5. Show that the vector connecting the point $A=(a,b,c)$ to
   the point $B=(a',b',c')$ is
   $$\overrightarrow{AB} = \langle a'-a,b'-b,c'-c\rangle.$$
6. Show that the length of $\langle a, b, c\rangle$ is
   $$\sqrt{a^2+b^2+c^2}.$$

We write $|\mathbf{v}|$ for the **length** or **magnitude** of $\mathbf{v}$.
If $\mathbf{v} \neq \mathbf{0}$, then
$$ \frac{\mathbf{v}}{|\mathbf{v}|} $$
has length 1 but points in the same direction as $\mathbf{v}$. It will
frequently be convenient to throw away the length information and keep only
direction information using this operation.

Unimportant remark: vectors behave extremely well under addition and scaling.
These operations are associative, commutative, distributive, various
inverses exist, identities exist and behave themselves, etc. We will typically
assume such properties as geometrically obvious without further comment.
If you're interested in this sort of thing, vectors are formally a
"real vector space". For more on this, see Math 308 or any introductory
book on linear algebra.

## Brain massage: use it or lose it

Here are some problems that require a little creativity--the sort
of thing that might show up on an exam.

**Exercise:**

-   Do the points
    $$(1,2,3), (2,3,4), (37, 38, 40)$$
    lie on a single line in $\mathbf{R}^3$?
-   Find the line containing the largest number of the following points
    $$(1,0,1), (0,2,0), (1,2,3), (2,2,4), (3,2,5).$$

Hint:

-   Two non-zero vectors $\mathbf{v}$ and $\mathbf{w}$ have the same
    or opposite direction if and only if $$\mathbf{v}=c\mathbf{w}$$ for some
    non-zero number $c$.
-   Why is this true?
-   Does this help with the problem?

### Content Contributors
@maxlieblich, @jpswanson

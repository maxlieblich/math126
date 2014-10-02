Dot products
============

### Warm up

Let's start with a few natural questions about vectors that arise in the
world.

**Question**: a light shines perpendicularly down onto the plane
$x-y+z=0$. Can we calculate the shadow of the vector $\langle
3,4,5\rangle$ in the plane? (Natural question for computer graphics,
architecture, etc. )
<div id="shadow">
  <img src="media/lecture-3-shadow.png"></img>
</div>
<script type="text/javascript">
//<![CDATA[
(function (){
  var scene = new MathScene("shadow");
  var plane = new PlaneShadowModel({
    normal: [1, -1, 1],
    position: [0, 0, 0],
    color: 0xff0000,
    xrange: [-10, 10],
    yrange: [-10, 10]
    });
  var vector = new VectorModel({
    color: 0x0000ff,
    origin: [0, 0, 0],
    vector: [3, 4, 5]
    });
  vector.arrow.castShadow = true;
  // cheating so I don't have to ask for lines to cast shadows
  var shadowLineGeo = new THREE.Geometry();
  var shadowLineMat = new THREE.MeshBasicMaterial({color: 0x000000});
  shadowLineGeo.vertices.push(new THREE.Vector3(0, 0, 0), new THREE.Vector3(1.666, 5.333, 3.666));
  scene.scene.add(new THREE.Line(shadowLineGeo, shadowLineMat));
  scene.camera.position.set(10, -10, 0);
  plane.embedInScene(scene);
  vector.embedInScene(scene);
  scene.render();
  })();
//]]>
</script>


**Similar:** a light shines perpendicularly down onto the plane $z=0$.
How can we calculate the shadow of the vector $\langle 3,4,5\rangle$
in the plane?

Can you draw a picture of this one? How do shadows work?

**Answer:** projecting into the $xy$-plane just forgets about the
$z$-component!

Here's another question, that might not seem related.

**Question:** given two vectors in $\mathbf{R}^3$, how can we compute
the angle between them?

Why is there an angle between two vectors? Well, any two vectors span a plane, and if you draw two vectors in the plane there is surely an angle between them. **Note**: By *definition*, the angle between two vectors is the *smaller* of the two possible angles. In other words, don't go around the long way when trying to compute the angle!

### The main tool

In this lecture we'll learn about a marvelous tool for answering these questions called the *dot product*. It is a perfect mathematical tool: powerful yet simple to compute. As with components and addition of vectors, using coordinates allows us to do concrete calculations that tell us about geometry.

As simple as they seem, the ideas we'll discuss here tap into one of the
richest veins of ideas in mathematics. Mathematicians think about dot products and their generalizations *all the time*. They appear in everything from Fermat's Last Theorem to General Relativity. With the right kind of weird version of the the dot product, you can have triangles whose angles add up to more than 180 degrees. In fact, you already live in a world where this is possible: take two points on the equator and make a triangle on the Earth by connecting those points to one another and to the North Pole. Presto! A triangle whose angles are all 90 degrees.

But I digress.

#### Definition

The dot product of two vectors

$$\mathbf{a}=\langle a_1,a_2,a_3\rangle\textrm{ }\mathbf{b}=\langle b_1,b_2,b_3\rangle$$

is the number

$$\mathbf{a}\cdot\mathbf{b}=a_1b_1+a_2b_2+a_3b_3.$$

**Note**: this is a number (scalar), not a vector!

#### Examples

-   $\langle 1, 2, 3\rangle\cdot\langle 3, 0, 1\rangle = 1\cdot
    3+2\cdot 0+3\cdot 1=6$
-   $\langle 2, 5\rangle\cdot\langle 5, -2\rangle = 2\cdot 5 +
    5\cdot(-2) = 0$

Simple, but powerful, as we'll see.


### Practice

Compute these dot products (build a data set for your inner child!):

-   $\langle 1,0,0\rangle\cdot\langle 2,3,7\rangle$
-   $\mathbf{i}\cdot\mathbf{j}$ (you know what $\mathbf{i}$ and
    $\mathbf{j}$ are because you read the book!)
-   $\mathbf{i}\cdot\mathbf{i}$
-   take a point $(x,y,z)$ in the plane $x+y+z=0$ and compute
    $\langle x,y,z\rangle\cdot\langle 1,1,1\rangle$
-  take a point $(x, y, z)$ in the plane $-x+2y+3z=0$ and compute $\langle x, y, z\rangle\cdot\langle -1, 2, 3\rangle
-  take a point $(x, y, z)$ in the plane $(x-3) + 7(y-4)-(z+2)=0$ and compute $\langle x-3, y-4, z+2\rangle\cdot\langle 1, 7, -1\rangle$.
- take any vector $\mathbf{v}$ and compute its dot product with a unit vector $\mathbf{u}$ pointing along the $z$-axis. Actually, compute the vector difference $\mathbf{v} - (\mathbf{v}\cdot\mathbf{k})\mathbf{k}$. Do you notice anything? Try this for many vectors. What happens? Stop looking at Facebook. Try this, really.

#### Observations

-   $\mathbf{i}$ and $\mathbf{j}$ are perpendicular, and $\mathbf{i}\cdot\mathbf{j}=0$
-   $\mathbf{i}$ has length $1$, and $\mathbf{i}\cdot\mathbf{i}=1$
-  The vector $\mathbf{k}$ is perpendicular to the $xy$-plane, and its dot product with any vector of the form $\langle a, b, 0\rangle$ is $0$. What about those examples with planes above? Are the vectors (like $\langle 1, 1, 1\rangle$) perpendicular to the corresponding planes (like $x+y+z=0$ in that example)?
-  What happens if you take any vector $\mathbf{v}$ and dot it with itself -- compute $\mathbf{v}\cdot\mathbf{v}$? How does the resulting number compare to the magnitude of the vector? Can we recover the direction of $\mathbf{v}$ just using dot products?
-  Are there any properties of geometry that *aren't* encoded somehow in the dot product? Is ths ellipsiness of an ellipse versus the circularity of a circle somehow detectable using the dot product?

### Sweet Theorem

Given two vectors $\mathbf{a}$ and $\mathbf{b}$, the angle
$\theta$ between them satisfies

$$\mathbf{a}\cdot\mathbf{b}=|\mathbf{a}||\mathbf{b}|\cos(\theta).$$

![](media/lecture3_3.png)

Since by convention we always take the angle between two vectors to lie
between $0$ and $\pi$ radians, this determines $\theta$
uniquely.

This theorem shows how the dot product relates to both **angle** and **length**.

Let's see how we can leverage this for both angles and lengths.

## Angles

#### Example

Computing the angle using the formula is pretty straightforward. Here's an example. The angle $\theta$ between $\langle 1,3,5\rangle$ and $\langle
-1,3,2\rangle$ satisfies

$$18=\sqrt{35}\sqrt{14}\cos(\theta).$$

Conclusion: $\theta=0.6212404....$ radians, or around $35.59$
degrees.

No picture necessary!

#### One to try
To check that you understand what's going on, here's one to try: What is the angle between $\langle 1,0,0\rangle$ and $\langle
2,2,0\rangle$?

### Orthogonality

A special case of angle computations is detecting when two vectors are perpendicular. We get a criterion from the dot product:

*Two vectors $\mathbf{a}$ and $\mathbf{b}$ are perpendicular if and
only if $\mathbf{a}\cdot\mathbf{b}=0$.*

This is a beautiful way to encode geometry with numbers. As a rule, coordinates are very fluffy: we could impose a wiggly grid on the world as we wish. We could even stick on a super-bizarre coordinate system such that different pairs or triples of coordinates could correspond to the same point (and we will when we study polar coordinates!).

But the dot product is different. The dot product **imposes additional structure**, namely a *notion of angles and perpendicularity*. Now the wiggles can't be arbitrary; wiggles are only allowed if the underlying shape is wiggly, otherwise we violate the perpendicularity constraint.

## Length

The dot product enodes more than just angles. It also encodes *length*. We get a tool that helps us see how far we've gone when we follow a path (integration! coming soon!). Here's a warm up.

#### True or False?

For any vector $\mathbf{a}$, we have that $\mathbf{a}\cdot\mathbf{a}$ equals the length of $\mathbf{a}$.

What does "true or false" mean? It means "figure out if this is always true -- i.e., holds for any $\mathbf{a} -- and if not, *figure out what **is** true*". You might not be used to the latter part, but thinking for yourself is part of becoming an educated person. Do you want to be a calculus monkey for your whole life?

#### Components

Suppose $\mathbf{u}$ is a unit vector (i.e., a vector of length
$1$). Then for any vector $\mathbf{a}$, the new vector

$$\operatorname{proj}_{\mathbf{u}}(\mathbf{a})=(\mathbf{a}\cdot\mathbf{u})\mathbf{u}$$

gives the projection of $\mathbf{a}$ onto $\mathbf{u}$.

The number $\mathbf{a}\cdot\mathbf{u}$ is called the *component of
$\mathbf{a}$ in the direction of $\mathbf{u}$*. The vector $(\mathbf{a}\cdot\mathbf{u})\mathbf{u}$ is the *projection of $\mathbf{a}$ on $\mathbf{u}$*. The component is the number you multiply by to get the projection. In other words, the component is the coordinate in a coordinate system that includes $\mathbf{u}$ as one of its unit directions. (If that last sentence makes no sense, don't worry.)

#### Example

![](media/lecture3_4.png)


#### Practice

-   Let $\mathbf{u}$ be a unit vector in the same direction as
    $\langle 1,1,1\rangle$. Find $\mathbf{u}$ and compute the
    projection $$\mathbf{c}=\operatorname{proj}_{\mathbf{u}}(\langle 3,4,5\rangle).$$
-   Does the difference vector $$\langle 3,4,5\rangle-\mathbf{c}$$
    have endpoint in the plane $x+y+z=0$?

### Wrap up

#### More problems

-   Find a unit vector perpendicular to both $\mathbf{i}+\mathbf{j}$
    and $\mathbf{i}+\mathbf{k}$.
-   Calculate the angles in the triangle connecting the points
    $(0,0,0)$, $(0,1,3)$, $(2,1,-1)$ to three significant digits.

#### Original question

How do we calculate the projection of a vector into a plane?

What is the projection in human terms? "Walk along the plane from the
origin of the vector until you are just underneath its tip."

So: if you look straight "up" (perpendicular to the plane) from the
endpoint of the projection, you see the endpoint of the original vector.

How do we express "first go here, then go there" using vectors?

What if you project onto the line perpendicular to the plane and
subtract that projection from the original vector?

It is starting to smell something like this: 

- Suppose your plane $P$ contains $\mathbf{0}=\langle 0, 0, 0\rangle$. Let $\mathbf{u}$ be a unit vector perpendicular to $P$. 
- Given a vector $\mathbf{v}$, we can compute the projection of $\mathbf{v}$ into $P$ by simply subtracting off the projection on the perpendicular: $\mathbf{v}-(\mathbf{v}\cdot\mathbf{u})\mathbf{u}$. 
- Quick check: you should be able to prove that this result is perpendicular to $\mathbf{u}$, if you believe that this is a reasonable idea, since $\mathbf{u}$ is perpendicular to $P$. How do you tell if a vector $\mathbf{y}$ is perpendicular to $\mathbf{u}$, again? That's right, show that $\mathbf{y}\cdot\mathbf{u}=0$.

### Content Contributors
@maxlieblich

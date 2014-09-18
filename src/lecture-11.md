Tangents, normals, binormals
============================

Consider the electron spiraling around the torus
-------------------------------------------------

The vector description:

$$\mathbf{f}(t)=\langle
\cos(t)(2-\cos(4t)),\sin(t)(2-\cos(4t)),\sin(4t)\rangle$$

-   What plane best approximates (makes most contact with) the path
    followed by the electron? (Any guesses?)
-   How can we measure the twisting of the path in three-dimensional
    space?
-   Earlier: curvature measures curvature of path, but does not capture
    direction of curving.

Visualizing changes with vectors, I
-----------------------------------

Here's a model of the electron path with the unit tangent vector
$\mathbf{T}(t)$ attached.

How can we recover more of the curving structure?
-------------------------------------------------

Take the derivative of the unit tangent vector!

Definition: the unit normal vector to the parametrized path $\mathbf{f}(t)$ with unit tangent vector $\mathbf{T}(t)$ is defined to be
$$\mathbf{N}(t)=\frac{\mathbf{T}'(T)}{|\mathbf{T}'(t)|}.$$

We are normalizing the derivative of the unit tangent so that we can get
as close to bare intrinsic geometry as possible.

Why is this called a normal vector?

-   Because $\mathbf{T}(t)\cdot\mathbf{T}'(t)=0$, as you saw in the
    "Curvature" lecture segment.

Visualizing changes with vectors, II
------------------------------------

Here's a model of the electron path with the unit tangent and unit
normal both attached.

Try an example
--------------

Consider the helix

$$\mathbf{h}(t)=\langle\cos(t),\sin(t),t\rangle$$

-   Calculate the unit tangent vector $\mathbf{T}(t)$
-   Calculate the unit normal vector $\mathbf{N}(t)$

But wait, there's more!
-----------------------

Take the cross product now for a free third vector!

Definition: the binormal vector at time $t$ is the unit vector

$$\mathbf{B}(t)=\mathbf{T}(t)\times\mathbf{N}(t).$$

Together, the vectors $\mathbf{T}(t),\mathbf{N}(t),\mathbf{B}(t)$ form
a triad of unit vectors satisfying the right-hand rule. This is called a
*frame*.

-   Complete your unit tangent and unit normal to get the full frame for
    the helix $\mathbf{h}(t)=\langle\cos(t),\sin(t),t\rangle$

Visualizing changes with vectors, III
-------------------------------------

Here's a model of the electron path with the unit tangent, unit normal,
and binormal vectors all attached. Observe that the unit normal explains
the changes in direction of the unit tangent. The binormal is a bit more
mysterious at the moment.

What does this do for us?
-------------------------

We can find the normal plane and the osculating plane!

Osculating: kiss

You probably never thought you would be finding planes that kiss curves
in your calculus class.

-   Math is fun

The osculating plane is the plane spanned by $\mathbf{T}$ and
$\mathbf{N}$. The normal plane is the plane spanned by $\mathbf{N}$
and $\mathbf{B}$.

Do one: calculate the osculating plane and the normal plane to the helix
at time $t$.

More problems to think about
----------------------------

-   What are the osculating and normal planes of a parametric curve
    $(x(t),y(t),0)$?
-   Does the osculating plane depend upon the parametrization? E.g.,
    what about the crazy helix $(\cos(t^2),\sin(t^2),t^2)$?
-   How do the osculating planes of the electron's path on the torus
    relate to the tangent planes of the torus?
-   How awesome is this?


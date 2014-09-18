Distance
========

Kangaroos++
-----------

A joey (baby kangaroo) is riding in her mother's pouch with a
sophisticated inertial navigation system. She is too small to see out of
the pouch, but her system records the velocity vector at any time.

-   The joey records the velocity at time $t$ as $$\mathbf{v}(t)=\langle 1,t,\sin(t)\rangle$$
-   The joey starts at the point $(0,0,1)$
-   Last time: the position is $\mathbf{f}(t)=\langle
    t,\frac{1}{2}t^2,2-\cos(t) \rangle$
-   New question: How long is the joey's path between $t=0$ and
    $t=15$?

Distance by accretion
---------------------

How can we calculate the distance $s$ travelled by the joey from
$t=a$ to $t=b$?

-   Linear approximation to function near time $t=a$: $\mathbf{L}(t)=\mathbf{f}(a)+(t-a)\mathbf{f}'(a)$.
-   For a small change $\Delta(t)$, the distance travelled is thus
    approximately $\Delta(s)\approx|\mathbf{f}'(t)|\Delta(t)$.
-   The resulting Riemann sums approximate the integral
    $$s(t)=\int_a^b|\mathbf{f}'(t)|dt.$$
-   Important Note: when you reverse direction, the distance still adds
    up!

Practical distance, I
---------------------

If we have $\mathbf{f}(t)=\langle x(t),y(t),z(t)\rangle$ then the
distance from the starting point $t=a$ to a variable time $T$ is

$$s(T)=\int_a^T\sqrt{(x'(t)^2+(y'(t))^2+(z'(t))^2)}dt.$$

$$s(T)=\int_0^T\sqrt{1+t^2+\sin^2(t)}dt$$

Evaluating this function seems rather mysterious in general. Using
numerical methods, we get a concrete answer for $T=15$:

$$s(15)=115.255\ldots.$$

Practical distance, I
---------------------

If we have $\mathbf{f}(t)=\langle x(t),y(t),z(t)\rangle$ then the
distance from the starting point $t=a$ to a variable time $T$ is

$$s(T)=\int_a^T\sqrt{(x'(t)^2+(y'(t))^2+(z'(t))^2)}dt.$$

Try one:

What is the distance of the cylinder path $\mathbf{f}(t) = \langle
\cos(t), \sin(t), t/2\pi\rangle,$ from $t=0$ to $t=T$?

Move on only when ready for the answer!

Practical distance, I
---------------------

If we have $\mathbf{f}(t)=\langle x(t),y(t),z(t)\rangle$ then the
distance from the starting point $t=a$ to a variable time $T$ is

$$s(T)=\int_a^T\sqrt{(x'(t)^2+(y'(t))^2+(z'(t))^2)}dt.$$

Plugging/chugging:

$$\int_0^T\sqrt{\frac{4\pi^2+1}{4\pi^2}}dt =
\frac{T\sqrt{4\pi^2+1}}{2\pi}$$

Arc length
==========

Distance vs arc length
----------------------

Important: the integrals in the "Distance" lecture segment give the
**total distance traveled**.

If you never reverse direction, you are also computing the length of the
path, not just your choice of traversal.

The physical length of the path is the arc length.

Practical arc length, II
------------------------

Here's a funny special case. Suppose that $|\mathbf{f}'(t)|=1$ for all
$t$. Then the distance traversed from time $0$ to time $T$ is
$$s(T)=\int_0^T|\mathbf{f}'(t)|dt=\int_0^T1dt=T.$$

In typical circumstances (called “smooth”: $\mathbf{f}'(t)$ is never
$0$), one can reparametrize the curve using arc length instead of
$t$.

Example: for the unit circle, the arc length parametrization is
$$\langle x,y\rangle=\langle\cos(s),\sin(s)\rangle.$$

Meaning: the arc length as $s$ goes from $0$ to $T$ is $T$!

Practical arc length, II
------------------------

A parametric vector function $\mathbf{f}(t)$ is parametrized by arc
length or an arc length parametrization if the arc length traced by
$\mathbf{f}$ between $t=a$ and $t=b$ is $b-a$.

$$\int_a^b|\mathbf{f}'(t)|dt=b-a$$

How do you find these things?

-   Start with a parametrization: $\mathbf{f}(t)$.
-   Hypothetical reparametrization: $t=t(s)$.
-   Chain rule: $|\mathbf{f}'(t)| = |\mathbf{f}'(t)t'(s)| = |\mathbf{f}'(t)||t'(s)|$.
-   In order to ensure that the speed is constant, can try to solve the
    differential equation $t'(s) = |\mathbf{f}'(t(s))|^{-1}.$

Practical arc length, II
------------------------

Example: circle of radius $2$, parametrized by $\mathbf{f}(t)=\langle 2\cos(t), 2\sin(t)\rangle$

$$\mathbf{f}'(t) = \langle -2\sin(t), 2\cos(t)\rangle$$

$$|\mathbf{f}'(t)|=\sqrt{4\sin^2(t)+4\cos^2(t)}=2$$

So: solve $t'(s)=1/2$; one solution is $t=s/2$

End result: arc length parametrization of circle of radius $2$ is
$\mathbf{f}(s)=\langle 2\cos(s/2),2\sin(s/2)\rangle$

Find the arc length parametrization of the circle of radius $r$.

Curvature
=========

Unit tangent vectors
--------------------

Something remarkable happens when parametrizing curves by arc length:
every tangent vector has length $1$.

We can do this more generally whenever we know that $\mathbf{f}'(t)\neq 0$.

The unit tangent vector to the curve $\mathbf{f}(t)$ at a point
$t=a$ is $$\mathbf{T}(a)=\frac{\mathbf{f}'(a)}{|\mathbf{f}'(a)|}.$$

Example: for the joey from the "Distance" lecture segment with
$\mathbf{f}'(t)=\langle 1,t,\sin(t)\rangle$, the unit tangent
vector at time $a$ is $$\mathbf{T}(a)=\frac{1}{\sqrt{1+t^2+\sin^2(t)}}\langle 1,t,\sin(t)
\rangle.$$

Practice
--------

Compute the unit tangent to the parabola $y=x^2$ at the point
$(a,a^2)$.

Hint: one way to do this is to parametrize the path first, say using
$x=t$. Then calculate $\mathbf{f}'(t)/|\mathbf{f}'(t)|$. What if you
parametrize (half of) the parabola as $\langle\sqrt t,t\rangle$
instead?

The benefits of all of this
---------------------------

Why work with arc length and unit tangents?

-   Capture intrinsic geometric information, not artifacts of the
    choices we made in our description.
-   Recovers delicate static information about the shape.

For example: $\mathbf{T}'(t)\cdot\mathbf{T}(t)=0.$ I.e., $\mathbf{T}'(t)$ is perpendicular to $\mathbf{T}(t)$.

Indeed, $$0=\frac{d}{dt}1=\frac{d}{dt}|\mathbf{T}(t)|=\frac{d}{dt}\left(\mathbf{T}(t)\cdot\mathbf{T}(t)\right)=2\mathbf{T}(t)\cdot\mathbf{T}'(t).$$

Meaning: $\mathbf{T}'(t)$, unlike the acceleration in general, is
always changing the tangent to the curve in the “most efficient” way.

Curvature
---------

The curvature of the smooth parametric curve $\mathbf{f}(t)$ is
defined to be $$\kappa(t)=\left|\frac{d\mathbf{T}(t)}{ds}\right|,$$ where $s$ is the arc length function.

Since $s'(t)=|\mathbf{f}'(t)|$, we also have $\kappa(t)=|\mathbf{T}'(t)|/|\mathbf{f}'(t)|$.

A lot to digest!

When $\mathbf{f}$ is already paramterized by arc length, this
simplifies to $$\kappa(s)=|\mathbf{f}''(s)|,$$ the acceleration.

In practice, this is *not* how you will compute it (because you won't
have paths parametrized by arc length most of the time).

Examples
--------

### *The Circle of Radius $r$* and *The Parabola Fights Back*.

The equations parametrizing with arc length: $\mathbf{f}(s)=\langle
r\cos(s/r),r\sin(s/r)\rangle$.

Thus, $$\kappa(s)=\left|\left\langle
-\frac{1}{r}\cos\left(\frac{s}{r}\right),
-\frac{1}{r}\sin\left(\frac{s}{r}\right)\right\rangle\right|=\frac{1}{r}.$$

Makes sense: the curvature of a circle of large radius is small. After
all, the path is basically a straight line!

What about for something like the parabola? Try it. You might consider
using $\mathbf{f}(t)=\langle t,t^2\rangle$ and $\kappa=|\mathbf{T}'|/|\mathbf{f}'|$, together with your calculation of $\mathbf{T}$
from before. What a mess!

Curvature in practice
---------------------

Mathematicians have thought about this one pretty hard, and here is what
turns out to happen:

The curvature of the smooth path parametrized by $\mathbf{f}(t)$ is
$$\kappa(t)=\frac{|\mathbf{f}'(t)\times\mathbf{f}''(t)|}{|\mathbf{f}'(t)|^3}.$$ Any book or the internet contains a proof!

We can dispatch the parabola $\mathbf{f}(t)=\langle t,t^2\rangle$:

$$\kappa(t)=\frac{|\langle 1,2t,0\rangle\times\langle
0,2,0\rangle|}{(1+4t^2)^\frac{3}{2}}=\frac{2}{(1+4t^2)^\frac{3}{2}}.$$

Do one!
-------

Recall the motion of the joey: $\mathbf{f}(t)=\langle
t,\frac{1}{2}t^2,2-\cos(t)\rangle$.

Calculate the limit of the curvature as $t\to\infty$.

Formulas for curvature: $$\kappa(t)=\left|\frac{d\mathbf{T}}{ds}\right|=\frac{|\mathbf{T}'(t)|}{|s'(t)|}=\frac{|\mathbf{f}'(t)\times\mathbf{f}''(t)|}{|\mathbf{f}'(t)|^3}$$



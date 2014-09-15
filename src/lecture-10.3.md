Curvature
=========

Unit tangent vectors
--------------------

Something remarkable happens when parametrizing curves by arc length:
every tangent vector has length $1$.

We can do this more generally whenever we know that $\mathbf
f'(t)\neq 0$.

The unit tangent vector to the curve $\mathbf f(t)$ at a point
$t=a$ is $$\mathbf T(a)=\frac{\mathbf f'(a)}{|\mathbf
f'(a)|}.$$

Example: for the joey from the "Distance" lecture segment with
$\mathbf f'(t)=\langle 1,t,\sin(t)\rangle$, the unit tangent
vector at time $a$ is $$\mathbf
T(a)=\frac{1}{\sqrt{1+t^2+\sin^2(t)}}\langle 1,t,\sin(t)
\rangle.$$

Practice
--------

Compute the unit tangent to the parabola $y=x^2$ at the point
$(a,a^2)$.

Hint: one way to do this is to parametrize the path first, say using
$x=t$. Then calculate $\mathbf f'(t)/|\mathbf f'(t)|$. What if you
parametrize (half of) the parabola as $\langle\sqrt t,t\rangle$
instead?

The benefits of all of this
---------------------------

Why work with arc length and unit tangents?

-   Capture intrinsic geometric information, not artifacts of the
    choices we made in our description.
-   Recovers delicate static information about the shape.

For example: $\mathbf T'(t)\cdot\mathbf T(t)=0.$ I.e., $\mathbf
T'(t)$ is perpendicular to $\mathbf T(t)$.

Indeed, $$0=\frac{d}{dt}1=\frac{d}{dt}|\mathbf
T(t)|=\frac{d}{dt}\left(\mathbf T(t)\cdot\mathbf
T(t)\right)=2\mathbf T(t)\cdot\mathbf T'(t).$$

Meaning: $\mathbf T'(t)$, unlike the acceleration in general, is
always changing the tangent to the curve in the “most efficient” way.

Curvature
---------

The curvature of the smooth parametric curve $\mathbf f(t)$ is
defined to be $$\kappa(t)=\left|\frac{d\mathbf
T(t)}{ds}\right|,$$ where $s$ is the arc length function.

Since $s'(t)=|\mathbf f'(t)|$, we also have $\kappa(t)=|\mathbf
T'(t)|/|\mathbf f'(t)|$.

A lot to digest!

When $\mathbf f$ is already paramterized by arc length, this
simplifies to $$\kappa(s)=|\mathbf f''(s)|,$$ the acceleration.

In practice, this is *not* how you will compute it (because you won't
have paths parametrized by arc length most of the time).

Examples
--------

### *The Circle of Radius $r$* and *The Parabola Fights Back*.

The equations parametrizing with arc length: $\mathbf f(s)=\langle
r\cos(s/r),r\sin(s/r)\rangle$.

Thus, $$\kappa(s)=\left|\left\langle
-\frac{1}{r}\cos\left(\frac{s}{r}\right),
-\frac{1}{r}\sin\left(\frac{s}{r}\right)\right\rangle\right|=\frac{1}{r}.$$

Makes sense: the curvature of a circle of large radius is small. After
all, the path is basically a straight line!

What about for something like the parabola? Try it. You might consider
using $\mathbf f(t)=\langle t,t^2\rangle$ and $\kappa=|\mathbf
T'|/|\mathbf f'|$, together with your calculation of $\mathbf T$
from before. What a mess!

Curvature in practice
---------------------

Mathematicians have thought about this one pretty hard, and here is what
turns out to happen:

The curvature of the smooth path parametrized by $\mathbf f(t)$ is
$$\kappa(t)=\frac{|\mathbf f'(t)\times\mathbf f''(t)|}{|\mathbf
f'(t)|^3}.$$ Any book or the internet contains a proof!

We can dispatch the parabola $\mathbf f(t)=\langle t,t^2\rangle$:

$$\kappa(t)=\frac{|\langle 1,2t,0\rangle\times\langle
0,2,0\rangle|}{(1+4t^2)^\frac{3}{2}}=\frac{2}{(1+4t^2)^\frac{3}{2}}.$$

Do one!
-------

Recall the motion of the joey: $\mathbf f(t)=\langle
t,\frac{1}{2}t^2,2-\cos(t)\rangle$.

Calculate the limit of the curvature as $t\to\infty$.

Formulas for curvature: $$\kappa(t)=\left|\frac{d\mathbf
T}{ds}\right|=\frac{|\mathbf T'(t)|}{|s'(t)|}=\frac{|\mathbf
f'(t)\times\mathbf f''(t)|}{|\mathbf f'(t)|^3}$$

[![Powered by
MathJax](http://www.mathjax.org/badge.gif "Powered by MathJax")](http://www.mathjax.org/)
[![HTML5 Powered with CSS3 / Styling, Graphics, 3D & Effects,
Multimedia, and
Semantics](http://www.w3.org/html/logo/badge/html5-badge-h-css3-graphics-multimedia-semantics.png "HTML5 Powered with CSS3 / Styling, Graphics, 3D & Effects, Multimedia, and Semantics")](http://www.w3.org/html/logo/)

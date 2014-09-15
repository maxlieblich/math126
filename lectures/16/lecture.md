Local max/min: theory
=====================

Critical point review
---------------------

Find all critical points ($(a,b)$ such that $f_x(a,b)=0=f_y(a,b)$)
for the following functions.

-   $f(x,y)=x^2+y^2$
-   $f(x,y)=x^2-y^2$
-   $f(x,y)=\sin(x)\cos(y)$
-   $f(x,y)=x^y$
-   $f(x,y)=x^3+y^3+x+y$

Can you tell which of these critical points are local maxima or minima?

The critical points:
--------------------

-   $f(x,y)=x^2+y^2$: $(0,0)$
-   $f(x,y)=x^2-y^2$: $(0,0)$
-   $f(x,y)=\sin(x)\cos(y)$: all
    $\left(m\frac{\pi}{2},n\frac{\pi}{2}\right)$ with one of
    $(m,n)$ odd and the other even (cool!)
-   $f(x,y)=x^y$: $(1,0)$
-   $f(x,y)=x^3+y^3+x+y$: none

Are critical points local max/min?
----------------------------------

$x^2+y^2$

$x^2-y^2$

$\sin(x)\cos(y)$

$x^y$

paraboloid hyperboloid egg carton exponential

The hyperboloid: a pure example
-------------------------------

It's hard to find a purer example of a critical point that is neither
max nor min than the critical point of the hyperboloid.

Near that point the shape curves up in one direction and down in the
other.This is called a saddle point.

Contemplating the egg carton
----------------------------

The egg carton has an intriguing feature: sometimes the critical points
are at local max/min, but sometimes they're not!

How can we analyze the difference?

Observation: near one of the funny points, the shape looks a like like a
hyperboloid: going up in one direction and down in another.

What happened for functions of one variable?

-   The sign of the second derivative ruled the roost.
-   Positive second derivative means local min, negative means local
    max.
-   Vanishing second derivative left us alone with our wits.

Second derivatives alone are not enough
---------------------------------------

Consider the function $f(x,y)=x^2+4xy+y^2$.

Critical point: $(0,0)$

$f_{xx}(0,0)=2$ and $f_{yy}(0,0)=2$, both positive

The graph shows why this isn't enough: the saddle is oriented away from
the axes!

Multivariable fix?
------------------

There is an additional piece of information needed to account for both
variables. This is not magic, but it looks like before you know enough
theory:

*Definition*: the Hessian determinant of $f(x,y)$ is the function

$$D(x,y)=f_{xx}f_{yy}-f_{xy}^2.$$

Here, as you learned from the book, $f_{xx}$, $f_{yy}$, and
$f_{xy}$ denote second derivatives.

$$f_{xx}=\frac{\partial^2f}{\partial x^2}\qquad
f_{yy}=\frac{\partial^2f}{\partial y^2}\qquad
f_{xy}=\frac{\partial^2f}{\partial y\partial x}$$

The order of the subscripts is the order in which the derivatives are
taken. Be careful: the "denominator" of the partial derivatives will
have the variables in the reverse order!

The second derivative test
--------------------------

Here's the love:

Suppose $f$ has continuous second partial derivatives and $(a,b)$ is
a critical point. Then

-   if $D \gt 0$ and $f_{xx}(a,b)\gt 0$ then $(a,b)$ is a local
    minimum;
-   if $D \gt 0$ and $f_{xx}(a,b)\lt 0$ then $(a,b)$ is a local
    maximum;
-   if $D \lt 0$ then $(a,b)$ is a saddle point.

Achtung! This does not cover all cases!

For example, if $D=0$ we get no love at all from this.

Local max/min: examples
=======================

Example: $f(x,y)=x^2+y^2$
-----------------------------

-   Unique critical point: $(0,0)$
-   $D(x,y)=f_{xx}f_{yy}-f_{xy}^2=2\cdot 2-0=4\gt 0$
-   $f_{xx}=2\gt 0$
-   Conclusion: local minimum! (Phew!!)

Do one!
-------

Describe which critical points of $f(x,y)=\sin(x)\cos(y)$ are local
minima, local maxima, and saddle points.

-   $D=f_{xx}f_{yy}-f_{xy}^2$
-   $D\gt 0$, $f_{xx}\lt 0$ implies local max (but not other way)
-   $D\gt 0$, $f_{xx}\gt 0$ implies local min (but not other way)
-   $D\lt 0$ means saddle point

Another one for fun
-------------------

Consider the function $f(x,y)=x^y$ with critical point $(1,0)$.

-   What is the Hessian determinant $D(1,0)$?
-   Is $(1,0)$ a local max, a local min, or neither?
-   Is there an "easy" explanation for the previous part?

This matters in reality, too
----------------------------

Here is an example of a problem that you might approach using the
methods we've developed today: what is the smallest distance between the
point $(1,2,3)$ and the paraboloid $z=x^2+y^2$?

-   Function to be minimized: $d(x,y,z)=(x-1)^2+(y-2)^2+(z-3)^2$
    (the square of the distance; why?)
-   Relation: $z=x^2+y^2$
-   So now trying to minimize:
    $f(x,y)=(x-1)^2+(y-2)^2+(x^2+y^2-3)^2$
-   You can try this in the comfort of your room.




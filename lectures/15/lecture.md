Differentials
=============

Nedwina Cummerbund and the Ankles of Doom
-----------------------------------------

Nedwina is standing on her favorite part of Rainier, given by the
equation $x^3+z^2(y^2+y^3)+x+y+z=0.$

The tangent plane: $x+y+z=0$.

The angle with the $xy$-plane is the angle between the normal vectors
$\langle 1,0,0\rangle$ and $\langle 1,1,1\rangle$:
$\cos(\theta)=\frac{1}{\sqrt{3}}$.

The angle is about $54.74^\circ$, slightly less than the
$60^\circ$ limit set by the doctor. Phew!

Nedwina has her pet slug Boffo with her. Boffo is very sensitive to
changes in elevation. He asks, sliming with fear:

"How many cm higher or lower will I be if you follow the path that goes
2cm in the $x$ direction and 1 cm in the $y$ direction?"

Centimeters are small
---------------------

For making small changes, we can use the linear approximation to the
function!

-   The best linear approximation to the nerd's model of Rainier at
    $(0,0,0)$ is the function $z=-x-y$.
-   Tiny changes in $x$ and $y$: $\Delta x=0.02$ meters and
    $\Delta y=0.01$ meters.
-   We get $\Delta z=-\Delta x-\Delta y=-0.03$ meters, or $3$
    centimeters lower.
-   Boffo will not explode.

Name for this: differentials
----------------------------

These tiny changes are called differentials, and our best linear
approximation lets us compute them.

General formula: if $z=f(x,y)$ then $dz=f_x(x,y)dx+f_y(x,y)dy$. We
get the tiny change in $z$ coming from that tiny change in the
position of the point $(x,y)$ using the partial derivatives according
to the formula.

Try one: find the differentials of $f(x,y)=x^y$.

Help the piglet
---------------

Find all of the mistakes in this solution: the differential at the point
$(a,b,a^b)$ is

$$dz=yx^{y-1}(x-a)+a^b\ln(a)ydy$$

Correct solution: the differential at $(a,b,a^b)$ is given by
$$dz=ba^{b-1}dx+a^b\ln(a)dy.$$

A real-world example
--------------------

Roughly how much cheese (in cubic meters) did we shave off a cylinder of
cheese of radius $1$ and height $4$ if it ends up with radius
$0.99$ and height $3.98$?

-   Make a model of the volume depending upon two variables.
-   Use the differential formula to estimate the change.
-   Eat a piece of pizza.

The piglet of calculus is wondering....
---------------------------------------

Can we find a differentiable function whose differential in any
direction is positive?

-   If so, find one.
-   If not, explain why not.

OK, the piglet has a refined question
-------------------------------------

Can we find a differentiable function $f(x,y)$ and a point $(a,b)$
so that the actual changes when we jiggle the point are all positive?

-   If so, find one.
-   If not, explain why not.

Optimization
============

Horizontality is not just for napping
-------------------------------------

For the graph to reach a minimum or maximum (i.e., for small changes to
be positive or negative), the tangent plane must be horizontal.

This smacks of local max and min. Remember that?

Local max and min
-----------------

You mastered this for functions $f(x)$ of one variable:

-   Look for points where $f'(x)$ is undefined.
-   Solve $f'(x)=0$.
-   The options: either $x$ is a local maximum, a local minimum, or an
    inflection point.
-   Local max/min are sometimes (but not always) distinguished by the
    sign of $f''(x)$: pos for min, neg for max
-   Inflection points occur when $f''(x)$ changes sign.

How does this work for functions of multiple variables?

Locate potential local max/min
------------------------------

Key observation: if $f(x,y)$ has a local max/min at $(a,b)$ then
$f_x(a,b)=0$ and $f_y(a,b)=0$, or at least one of the partial
derivatives is undefined.

Definition: a point $(a,b)$ is a critical point if **EITHER**

1.  $f_x(a,b)=0$ and $f_y(a,b)=0$, **OR**
2.  one of these partial derivatives is undefined at $(a,b)$.

Critical point lovefest
-----------------------

Find all critical points for the following functions.

-   $f(x,y)=x^2+y^2$
-   $f(x,y)=x^2-y^2$
-   $f(x,y)=\sin(x)\cos(y)$
-   $f(x,y)=x^y$
-   $f(x,y)=x^3+y^3+x+y$

Can you tell which of these critical points are local maxima or minima?




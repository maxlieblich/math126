Lines and planes: doing it
==========================

Planes described using vectors
------------------------------

If $\mathbf u=\langle\alpha, \beta,\gamma\rangle$ is
perpendicular to plane $P$ and $u=(a,b,c)$ is a point of $P$, we
can describe $P$ like this:

$$P=\{(x,y,z):\langle x-a, y-b, z-c\rangle\cdot\mathbf u=0\}$$

-   Get a linear equation: $\alpha(x-a)+\beta(y-b)+\gamma(z-c)=0$
-   Any linear equation gives a plane.

Planes described using vectors
------------------------------

Describe the plane $x-3y+47z-28=0$ using vectors.

-   Normal vector: $\langle 1,-3,47\rangle$. How did I know?
-   Trick: always just use the coefficients of $x$, $y$, and $z$
-   To translate: find one solution by eyeballs. A solution:
    $(-16,1,1)$.
-   So the plane is the set of endpoints of vectors $\mathbf v$ such
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
-   Thus, the line of intersection is the set of vectors $\mathbf v$
    such that

    $$(\mathbf v-\langle 2,0,2\rangle)\cdot\langle
    1,-2,-1\rangle=0$$

    and

    $$(\mathbf v-\langle 2,0,2\rangle)\cdot\langle
    2,-1,1\rangle=0.$$

-   The vector $\mathbf v-\langle 2,0,2\rangle$ is perpendicular to
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

[![Powered by
MathJax](http://www.mathjax.org/badge.gif "Powered by MathJax")](http://www.mathjax.org/)
[![HTML5 Powered with CSS3 / Styling, Graphics, 3D & Effects,
Multimedia, and
Semantics](http://www.w3.org/html/logo/badge/html5-badge-h-css3-graphics-multimedia-semantics.png "HTML5 Powered with CSS3 / Styling, Graphics, 3D & Effects, Multimedia, and Semantics")](http://www.w3.org/html/logo/)


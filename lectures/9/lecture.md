Polar Coordinates
=================

How does radar work?
--------------------

Antenna sweeps around broadcasting signal.

Signal bounces off of objects and comes back.

Radar records the direction and distance to locate the object.

Descartes is cool. So is radar.
-------------------------------

The radar uses a different coordinate system. To locate a point in the
plane one can:

-   Find its distance $r$ from the origin.
-   Find its angle $\theta$ counterclockwise from the $x$-axis.
-   The pair $(r,\theta)$ determines the location of the point, with
    one caveat: one point can have several different sets of polar
    coordinates!. (Give infinitely many examples. Now.)

Code name: polar coordinates
----------------------------

-   We can convert back and forth: $$x=r\cos(\theta),
    y=r\sin(\theta)$$ (like sending a code from East Berlin to West
    Berlin in 1974).
-   Example: the point with polar coordinates $(r,\theta)=(7,\pi)$
    has Cartesian coordinates
    $$(x,y)=(7\cos(\pi),7\sin(\pi))=(-7,0).$$
-   Converting in other direction is more fun: first,
    $r=\sqrt{x^2+y^2}$. To get the angle, you could try to use
    $$\tan(\theta)=\frac{y}{x}$$ when this makes sense, or you
    could use one of the formulas $x=r\cos(\theta)$ or
    $y=r\sin(\theta)$. Use eyeballs and brain(s).
-   Most fun: graphing equations.

Examples
--------

-   What is the polar equation of a circle of radius $a$ around the
    origin?
    -   $r=a$
-   What is the polar equation of the line $x=3$?
    -   $r\cos(\theta)=3$
-   Try one: find the polar equation of the line $y=2x+5$.
-   Try another one: find the polar equation of the ellipse
    $\frac{1}{2}x^2+\frac{1}{3}y^2=1$

Polar graphs are beautiful
--------------------------

### Here are some examples

You can play with the parameters and see what happens!

Examples
--------

$r=\theta^{\textrm{power}}$, $0\leq\theta\leq
\textrm{multiple}\cdot\pi$

Examples
--------

$r=\sin(\textrm{love}\cdot\theta)$, $0\leq\theta\leq
\textrm{multiple}\cdot\pi$

Examples
--------

$r=c+\sin(\textrm{love}\cdot\theta)$, $0\leq\theta\leq
\textrm{multiple}\cdot\pi$

Try some the other way!
-----------------------

Example: the Cartesian equation of the curve with polar equation
$$r=\sin(\theta)$$ is
$$x^2+\left(y-\frac{1}{2}\right)^2=\frac{1}{4}.$$

Trick: multiply both sides by $r$, yielding $r^2=r\sin\theta$,
then use $r^2=x^2+y^2$ and $r\sin\theta=y$.

-   What is the Cartesian equation corresponding to
    $r=\sin(\theta)+\cos(\theta)$?
-   How about $r=\cos(\theta)$?
-   Or $r^2=\sec(\theta)$?
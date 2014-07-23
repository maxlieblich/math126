Vector valued functions: practice
=================================

One method: projection
----------------------

This is a fancy say to saying: ignore some coordinates and try to
describe the simpler motion. We already saw that ignoring coordinates is
one way of casting a shadow.

-   What happens if we ignore the $z$ coordinate of the electron on
    the cylinder?
-   Same as projecting the path into the $xy$-plane! (Looking down
    from above.)
-   What is that projection in this case?

Image in the $xy$-plane
-------------------------

The projection of the electron into the plane just moves in a circle.

-   The radius is $1$.
-   It moves at $1$ radian per second.
-   What are the $x$ and $y$ coordinates as functions of $t$?

The usual trigonometric formulas give

REDACTED

Image in the $xy$-plane
-------------------------

The projection of the electron into the plane just moves in a circle.

-   The radius is $1$.
-   It moves at $1$ radian per second.
-   What are the $x$ and $y$ coordinates as functions of $t$?

The usual trigonometric formulas give

$$(x(t),y(t))=(\cos(t),\sin(t)).$$

What about $z$?
-----------------

The key is the timing of the revolutions.

-   One revolution takes $2\pi$ seconds.
-   It should take four revolutions to get to the top ($z=4$), so
    $8\pi$ seconds.

 

A parametric description of the torus
-------------------------------------

Given two numbers $t$ and $u$ between $0$ and $2\pi$, we get a
point on a torus of radius $2$ and tube radius $1$ like this:

$$\begin{align\*} x(t,u)&=\cos(t)(2-\cos(u))\\
y(t,u)&=\sin(t)(2-\cos(u))\\ z(t,u)&=\sin(u) \end{align\*}$$

If you fix $u$, the $t$-path is a circle around the torus. If you
fix $t$, the $u$-path is a circle around the “tube”.

Use this to make a spiral path around the torus that starts at
$(1,0,0)$ and winds around the tube $4$ times before it returns to
its starting point.

Hint: substitute for $u$ as a function of $t$ to make the two act in
concert!

A parametric description of the torus
-------------------------------------

Given two numbers $t$ and $u$ between $0$ and $2\pi$, we get a
point on a torus of radius $2$ and tube radius $1$ like this:

$$\begin{align\*} x(t,u)&=\cos(t)(2-\cos(u))\\
y(t,u)&=\sin(t)(2-\cos(u))\\ z(t,u)&=\sin(u) \end{align\*}$$

If you fix $u$, the $t$-path is a circle around the torus. If you
fix $t$, the $u$-path is a circle around the “tube”.

Use this to make a spiral path around the torus that starts at
$(1,0,0)$ and winds around the tube $4$ times before it returns to
its starting point.

Think about this for next time!

Question {.question}
--------

Two tiny cars travel on paths

$$\begin{align\*} (x,y,z)&=(\cos(t),\sin(t),0)\\
(x',y',z')&=(0,\cos(t),\sin(t)) \end{align\*} $$

Will they collide?

Now suppose the second car travels at a different speed so that
$(x',y',z')=(0,\cos(\alpha t),\sin(\alpha t))$. For which
constants $\alpha$ will the tiny cars collide?

[![Powered by
MathJax](http://www.mathjax.org/badge.gif "Powered by MathJax")](http://www.mathjax.org/)
[![HTML5 Powered with CSS3 / Styling, Graphics, 3D & Effects,
Multimedia, and
Semantics](http://www.w3.org/html/logo/badge/html5-badge-h-css3-graphics-multimedia-semantics.png "HTML5 Powered with CSS3 / Styling, Graphics, 3D & Effects, Multimedia, and Semantics")](http://www.w3.org/html/logo/)


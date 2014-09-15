Tangent planes
==============

Tangent planes to graphs
------------------------

One of the main uses of partial derivatives is in producing tangent
planes.

Theorem: for a function $f(x,y)$, the tangent plane to the graph
$z=f(x,y)$ at the point $(a,b,c)$ is given by the equation

$$z-c=f_x(a,b)(x-a)+f_y(a,b)(y-b)$$

Example: $f(x,y)=x^2+y^2$, $(a,b,c)=(1,1,2)$, get the plane

$$z-2=2(x-1)+2(y-1).$$

Why does this make sense?

-   If we take a vertical or horizontal trace, the tangent plane should
    give the tangent line. Does it?
-   The partial derivatives seem to capture just a vertical and
    horizontal trace. Is that really enough?

Try one! {.question}
--------

Calculate the tangent plane to the graph of the function
$$f(x,y)=\sin(x)\cos(y)$$ at the point $(a,b,\sin(a)\cos(b))$.

General formula for $f(x,y)$ at $(a,b,c)$:

$$z-c=f_x(a,b)(x-a)+f_y(a,b)(y-b)$$

Big but
-------

Our nerd's Rainier model does not express $z$ as a function of $x$
and $y$:

$$x^3+z^2(y^2+y^3)+x+y+z=0$$

What should we do?

-   Think of $z$ as an implicit function of $x$ and $y$!
-   Do you remember how implicit differentiation works?

Implicit partial derivatives
----------------------------

Follow the procedure you learned in the days of yore. Let's focus on
partial derivatives with respect to $x$.

-   Pretend $z$ is a function of $x$ and $y$ is a constant, so we
    have a partial derivative $\partial z/\partial x$.
-   Use the product rule, chain rule, etc., to take the derivative of
    the relation.
-   Solve for $\partial z/\partial x$ in terms of $x$, $y$,
    $z$.

Example: for the cone $z^2=x^2+y^2$ we get $2zz_x=2x$, so for
$z\neq 0$ we have $$\frac{\partial z}{\partial
x}=\frac{x}{z}.$$

Tangent plane to cone
---------------------

Continuing the cone example, at a point $(a,b,c)$ of the circular cone
$z^2=x^2+y^2$, we have $z_x(a,b)=a/c$ and $z_y(a,b)=b/c$.
Thus, the tangent plane is

$$z-c=\frac{a}{c}(x-a)+\frac{b}{c}(y-b),$$

or, equivalently,

$$c(z-c)=a(x-a)+b(y-b).$$

For kicks, let's expand that:

$$cz-c^2=ax-a^2+by-b^2.$$

Since $c^2=a^2+b^2$, we can simplify this to $cz=ax+by$. Nice!

Bizarre note: if we scale $a$, $b$, and $c$ by the same number,
the tangent plane does not change. Is there a reason for this?

Your turn!
----------

Find the tangent plane to Mt. Rainier at $(0,0,0)$.

The equation is $x^3+z^2(y^2+y^3)+x+y+z=0.$

Is the plane too steep for Nedwina?

[![Powered by
MathJax](http://www.mathjax.org/badge.gif "Powered by MathJax")](http://www.mathjax.org/)
[![HTML5 Powered with CSS3 / Styling, Graphics, 3D & Effects,
Multimedia, and
Semantics](http://www.w3.org/html/logo/badge/html5-badge-h-css3-graphics-multimedia-semantics.png "HTML5 Powered with CSS3 / Styling, Graphics, 3D & Effects, Multimedia, and Semantics")](http://www.w3.org/html/logo/)


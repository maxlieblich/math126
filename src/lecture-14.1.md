Partial Derivatives
===================

Medical emergency
-----------------

Nedwina has defective ankles, but like a true Seattleite she has decided
to climb Mt. Rainier. Her doctor says she cannot walk on any surface
whose angle with the $xy$-plane is greater than $\pi/3$.

Nedwina knows a nerd who modeled her favorite part of Rainier by the
equation $x^3+z^2(y^2+y^3)+x+y+z=0.$

Can Nedwina stand at the point $(0,0,0)$ without violating her
doctor's orders?

What is the best linear approximation to the surface around the point
$(0,0,0)$?

Here's the model with $(0,0,0)$ indicated
-------------------------------------------

A simpler situation
-------------------

Find the tangent plane to the paraboloid $z=x^2+y^2$ at the point
$(1,1,2)$.

A silly observation
-------------------

If we slice the whole package with a plane, we go from a surface and
tangent plane to a curve and tangent line!

Partial derivatives
-------------------

This process of restricting attention to one variable and taking
derivatives "with respect to that variable" is called taking partial
derivatives.

Formal definition: given a function of two variables $f(x,y)$, the
partial derivatives with respect to $x$ and $y$ at a point $(a,b)$
are defined as follows.

$$\frac{\partial f}{\partial x}=f_x(a,b)=\lim_{h\to
0}\frac{f(a+h,b)-f(a,b)}{h}$$

$$\frac{\partial f}{\partial y}=f_y(a,b)=\lim_{h\to
0}\frac{f(a,b+h)-f(a,b)}{h}$$

Rules

-   Treat one variable as a constant
-   Differentiate with respect to the other one
-   Rejoice

Example
-------

For example, consider the function $f(x,y)=x^2+y^2$. To compute the
partial derivative with respect to $x$, we treat $y$ as a constant
and do the usual one-variable differentiation:

$$\frac{\partial f}{\partial x}=2x.$$

Do some! Compute the partial derivatives with respect to $x$ and $y$
of these functions.

-   $f(x,y)=\sin(x)\cos(y)$
-   $f(x,y)=x^y$
-   $f(x,y)=y^5$

[![Powered by
MathJax](http://www.mathjax.org/badge.gif "Powered by MathJax")](http://www.mathjax.org/)
[![HTML5 Powered with CSS3 / Styling, Graphics, 3D & Effects,
Multimedia, and
Semantics](http://www.w3.org/html/logo/badge/html5-badge-h-css3-graphics-multimedia-semantics.png "HTML5 Powered with CSS3 / Styling, Graphics, 3D & Effects, Multimedia, and Semantics")](http://www.w3.org/html/logo/)


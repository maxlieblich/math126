Vector derivatives in practice
==============================

Calculating the derivative in practice
--------------------------------------

Given a vector function

$$\mathbf f(t)=\langle x(t),y(t),z(t)\rangle$$

the derivative is just

$$\mathbf f'(t)=\langle x'(t),y'(t),z'(t)\rangle,$$

the component-wise derivative.

The usual caveat applies: the derivative must exist for this to make
sense! I.e., this formula works when all three derivatives exist, and
when they don't neither does the derivative of $\mathbf f(t)$!

Practice {.question}
--------

Given the formula

$$\mathbf f(t)=\langle
\cos(t)(2-\cos(4t)),\sin(t)(2-\cos(4t)),\sin(4t)\rangle$$

for the motion of the electron on the torus,

-   calculate the velocity of the electron as a function of $t$
-   How does the speed vary over time?
-   (What is the “speed”, anyway? The magnitude of the velocity vector?
    That sounds right....)

Help the Piglet {.question}
---------------

The piglet of calculus tried the question on the previous slide and got
the following answer:

The derivative of $\mathbf f(t)=\langle
\cos(t)(2-\cos(4t)),\sin(t)(2-\cos(4t)),\sin(4t)\rangle$ is:

$$\frac{d\mathbf f}{dt}=\langle
-\sin(t)(2-\cos(4t))+4\cos(t)\sin(4t),
4\cos(t)\sin(4t),\sin(4t)\rangle$$

Every time the piglet enters the answer in webassign, it is marked
wrong. What mistakes did the piglet make?

The piglet
----------

Forgot to differentiate the third component!

-   Wrong: $\sin(4t)$
-   Right: $4\cos(4t)$

Used the product rule incorrectly in the second component (by just
taking the product of the derivatives)!

-   Wrong: $4\cos(t)\sin(4t)$
-   Right: $\cos(t)(2-\cos(4t))+4\sin(t)\sin(4t)$

Anything else?

Have you ever made mistakes like these?

[![Powered by
MathJax](http://www.mathjax.org/badge.gif "Powered by MathJax")](http://www.mathjax.org/)
[![HTML5 Powered with CSS3 / Styling, Graphics, 3D & Effects,
Multimedia, and
Semantics](http://www.w3.org/html/logo/badge/html5-badge-h-css3-graphics-multimedia-semantics.png "HTML5 Powered with CSS3 / Styling, Graphics, 3D & Effects, Multimedia, and Semantics")](http://www.w3.org/html/logo/)


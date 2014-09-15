Local max/min: examples
=======================

Example: $f(x,y)=x^2+y^2$
-----------------------------

-   Unique critical point: $(0,0)$
-   $D(x,y)=f_{xx}f_{yy}-f_{xy}^2=2\cdot 2-0=4\gt 0$
-   $f_{xx}=2\gt 0$
-   Conclusion: local minimum! (Phew!!)

Do one! {.question}
-------

Describe which critical points of $f(x,y)=\sin(x)\cos(y)$ are local
minima, local maxima, and saddle points.

-   $D=f_{xx}f_{yy}-f_{xy}^2$
-   $D\gt 0$, $f_{xx}\lt 0$ implies local max (but not other way)
-   $D\gt 0$, $f_{xx}\gt 0$ implies local min (but not other way)
-   $D\lt 0$ means saddle point

Another one for fun {.question}
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

[![Powered by
MathJax](http://www.mathjax.org/badge.gif "Powered by MathJax")](http://www.mathjax.org/)[![HTML5
Powered with CSS3 / Styling, Graphics, 3D & Effects, Multimedia, and
Semantics](http://www.w3.org/html/logo/badge/html5-badge-h-css3-graphics-multimedia-semantics.png "HTML5 Powered with CSS3 / Styling, Graphics, 3D & Effects, Multimedia, and Semantics")](http://www.w3.org/html/logo/)


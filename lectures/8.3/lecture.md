Vector integration
==================

A new problem
-------------

A joey (baby kangaroo) is riding in her mother's pouch. She has a
smartphone with an accelerometer that continuously reports the
acceleration vector. Her friend wrote an app that calculates the
velocity at any moment in time $t$. She is too small to see out of the
pouch, but, like all infant kangaroos, she is interested in calculating
her position as a function of time. Sadly, her somewhat stupid friend
never figured out how to get the position before he started a new app
that mimics the hilarious sounds that giraffes make when embarrassed.

-   The joey records the velocity at time $t$ as $$\mathbf
    v(t)=\langle 1,t,\sin(t)\rangle$$
-   The joey starts at the point $(0,0,1)$
-   Where is the joey at time $t$?

Integrate!
----------

Just like one variable calculus: reconstruct position from velocity by
integrating.

-   Riemann sums: $\sum\mathbf v(t_i)\Delta(t)$
-   Practical: $$\int\langle x(t),y(t),z(t)\rangle
    dt=\left\langle\int x(t)dt,\int y(t)dt,\int
    z(t)dt\right\rangle.$$
-   Example: $$\int\langle 1,t,t^2\rangle dt=\langle
    a,b,c\rangle+\left\langle
    t,\frac{1}{2}t^2,\frac{1}{3}t^3\right\rangle$$
-   The constant of integration is now a vector!

Help the joey
-------------

Using vector integration, compute the path that the joey takes, starting
at $t=0$. Initial position: $(0,0,1)$, velocity $\langle
1,t,\sin(t)\rangle$. A looping animation (for $t=0$ to $t=15$ in
slo-mo):

[![Powered by
MathJax](http://www.mathjax.org/badge.gif "Powered by MathJax")](http://www.mathjax.org/)
[![HTML5 Powered with CSS3 / Styling, Graphics, 3D & Effects,
Multimedia, and
Semantics](http://www.w3.org/html/logo/badge/html5-badge-h-css3-graphics-multimedia-semantics.png "HTML5 Powered with CSS3 / Styling, Graphics, 3D & Effects, Multimedia, and Semantics")](http://www.w3.org/html/logo/)


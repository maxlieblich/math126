Distance
========

Kangaroos++
-----------

A joey (baby kangaroo) is riding in her mother's pouch with a
sophisticated inertial navigation system. She is too small to see out of
the pouch, but her system records the velocity vector at any time.

-   The joey records the velocity at time $t$ as $$\mathbf{v}(t)=\langle 1,t,\sin(t)\rangle$$
-   The joey starts at the point $(0,0,1)$
-   Last time: the position is $\mathbf{f}(t)=\langle
    t,\frac{1}{2}t^2,2-\cos(t) \rangle$
-   New question: How long is the joey's path between $t=0$ and
    $t=15$?

Distance by accretion
---------------------

How can we calculate the distance $s$ travelled by the joey from
$t=a$ to $t=b$?

-   Linear approximation to function near time $t=a$: $\mathbf{L}(t)=\mathbf{f}(a)+(t-a)\mathbf{f}'(a)$.
-   For a small change $\Delta(t)$, the distance travelled is thus
    approximately $\Delta(s)\approx|\mathbf{f}'(t)|\Delta(t)$.
-   The resulting Riemann sums approximate the integral
    $$s(t)=\int_a^b|\mathbf{f}'(t)|dt.$$
-   Important Note: when you reverse direction, the distance still adds
    up!

Practical distance, I
---------------------

If we have $\mathbf{f}(t)=\langle x(t),y(t),z(t)\rangle$ then the
distance from the starting point $t=a$ to a variable time $T$ is

$$s(T)=\int_a^T\sqrt{(x'(t)^2+(y'(t))^2+(z'(t))^2)}dt.$$

$$s(T)=\int_0^T\sqrt{1+t^2+\sin^2(t)}dt$$

Evaluating this function seems rather mysterious in general. Using
numerical methods, we get a concrete answer for $T=15$:

$$s(15)=115.255\ldots.$$

Practical distance, I
---------------------

If we have $\mathbf{f}(t)=\langle x(t),y(t),z(t)\rangle$ then the
distance from the starting point $t=a$ to a variable time $T$ is

$$s(T)=\int_a^T\sqrt{(x'(t)^2+(y'(t))^2+(z'(t))^2)}dt.$$

Try one:

What is the distance of the cylinder path $\mathbf{f}(t) = \langle
\cos(t), \sin(t), t/2\pi\rangle,$ from $t=0$ to $t=T$?

Move on only when ready for the answer!

Practical distance, I
---------------------

If we have $\mathbf{f}(t)=\langle x(t),y(t),z(t)\rangle$ then the
distance from the starting point $t=a$ to a variable time $T$ is

$$s(T)=\int_a^T\sqrt{(x'(t)^2+(y'(t))^2+(z'(t))^2)}dt.$$

Plugging/chugging:

$$\int_0^T\sqrt{\frac{4\pi^2+1}{4\pi^2}}dt =
\frac{T\sqrt{4\pi^2+1}}{2\pi}$$

[![Powered by
MathJax](http://www.mathjax.org/badge.gif "Powered by MathJax")](http://www.mathjax.org/)
[![HTML5 Powered with CSS3 / Styling, Graphics, 3D & Effects,
Multimedia, and
Semantics](http://www.w3.org/html/logo/badge/html5-badge-h-css3-graphics-multimedia-semantics.png "HTML5 Powered with CSS3 / Styling, Graphics, 3D & Effects, Multimedia, and Semantics")](http://www.w3.org/html/logo/)


Arc length
==========

Distance vs arc length
----------------------

Important: the integrals in the "Distance" lecture segment give the
**total distance traveled**.

If you never reverse direction, you are also computing the length of the
path, not just your choice of traversal.

The physical length of the path is the arc length.

Practical arc length, II
------------------------

Here's a funny special case. Suppose that $|\mathbf f'(t)|=1$ for all
$t$. Then the distance traversed from time $0$ to time $T$ is
$$s(T)=\int_0^T|\mathbf f'(t)|dt=\int_0^T1dt=T.$$

In typical circumstances (called “smooth”: $\mathbf f'(t)$ is never
$0$), one can reparametrize the curve using arc length instead of
$t$.

Example: for the unit circle, the arc length parametrization is
$$\langle x,y\rangle=\langle\cos(s),\sin(s)\rangle.$$

Meaning: the arc length as $s$ goes from $0$ to $T$ is $T$!

Practical arc length, II
------------------------

A parametric vector function $\mathbf f(t)$ is parametrized by arc
length or an arc length parametrization if the arc length traced by
$\mathbf f$ between $t=a$ and $t=b$ is $b-a$.

$$\int_a^b|\mathbf f'(t)|dt=b-a$$

How do you find these things?

-   Start with a parametrization: $\mathbf f(t)$.
-   Hypothetical reparametrization: $t=t(s)$.
-   Chain rule: $|\mathbf f'(t)| = |\mathbf f'(t)t'(s)| = |\mathbf
    f'(t)||t'(s)|$.
-   In order to ensure that the speed is constant, can try to solve the
    differential equation $t'(s) = |\mathbf f'(t(s))|^{-1}.$

Practical arc length, II
------------------------

Example: circle of radius $2$, parametrized by $\mathbf
f(t)=\langle 2\cos(t), 2\sin(t)\rangle$

$$\mathbf f'(t) = \langle -2\sin(t), 2\cos(t)\rangle$$

$$|\mathbf f'(t)|=\sqrt{4\sin^2(t)+4\cos^2(t)}=2$$

So: solve $t'(s)=1/2$; one solution is $t=s/2$

End result: arc length parametrization of circle of radius $2$ is
$\mathbf f(s)=\langle 2\cos(s/2),2\sin(s/2)\rangle$

Find the arc length parametrization of the circle of radius $r$.

[![Powered by
MathJax](http://www.mathjax.org/badge.gif "Powered by MathJax")](http://www.mathjax.org/)
[![HTML5 Powered with CSS3 / Styling, Graphics, 3D & Effects,
Multimedia, and
Semantics](http://www.w3.org/html/logo/badge/html5-badge-h-css3-graphics-multimedia-semantics.png "HTML5 Powered with CSS3 / Styling, Graphics, 3D & Effects, Multimedia, and Semantics")](http://www.w3.org/html/logo/)


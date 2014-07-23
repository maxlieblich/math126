Area
====

An incredibly entertaining application of double integrals: area!
-----------------------------------------------------------------

We've been thinking about double integrals as computing volume.

They also compute area! Given a region $R$,

$$\iint_R1dA=\text{area}(R).$$

This can be useful when we can find nice coordinates.

Example
-------

Let's consider one of the marvelous polar shapes from before.

How about the area inside the curve $r=1+\sin(3\theta)$?

![There would be a flower here. Sigh.](20.1/flower.png)

The integral becomes
$$\int_0^{2\pi}\int_0^{1+\sin(3\theta)}rdrd\theta$$

Evaluate it, get
$\frac{1}{2}\theta-\frac{1}{3}\cos(3\theta)+\frac{1}{24}(6\theta-\sin(6\theta))|_0^{2\pi}=\frac{3}{2}\pi$

Be careful about how path is traversed!

Do one!
-------

Consider the delightful logarithmic spiral:

$$r=e^{\theta/5}.$$

-   What is the area of the first full turn of the spiral
    ($0\leq\theta\leq 2\pi$)?
-   What is the limit of the area inside the spiral
    $r=e^{\alpha\theta}$ as $\alpha$ tends to $0$?

One more, for extra fun
-----------------------

Suppose there is a snail whose shell is built around the spiral like
this: between each point of the spiral and the center there is a circle
of shell material. Thus, the circle connecting the center to the point
with polar coordinates $(\theta,e^{\theta/5})$ has radius
$\frac{1}{2}e^{\theta/5}$ and is centered at the point with polar
coordinates $(\theta,\frac{1}{2}e^{\theta/5})$. Write down an
explicit integral that computes the volume of the shell.

[![Powered by
MathJax](http://www.mathjax.org/badge.gif "Powered by MathJax")](http://www.mathjax.org/)[![HTML5
Powered with CSS3 / Styling, Graphics, 3D & Effects, Multimedia, and
Semantics](http://www.w3.org/html/logo/badge/html5-badge-h-css3-graphics-multimedia-semantics.png "HTML5 Powered with CSS3 / Styling, Graphics, 3D & Effects, Multimedia, and Semantics")](http://www.w3.org/html/logo/)


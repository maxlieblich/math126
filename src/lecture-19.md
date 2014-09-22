Double integrals in polar coordinates
=====================================

Return of the eyeball
---------------------

We had a model for an eyeball given by two equations:

$x^2+y^2+z^2=1$ and
$x^2+y^2+\left(z-\frac{3}{4}\right)^2=\frac{1}{4}$.

Circle of intersection: $z=\frac{7}{8}, x^2+y^2=\frac{15}{64}$.

A double integral that calculates the extra volume added inside the
cornea: let $R$ be the disk bounded by the circle
$x^2+y^2=\frac{15}{64}$

$$\iint_R\frac{3}{4}+\sqrt{\frac{1}{4}-x^2-y^2}-\sqrt{1-x^2-y^2}dA.$$

How can we compute something so crazy-looking?!

Let's try a simpler problem first.

Shark fins
----------

Nedwina is studying the biomechanics of the shark, and part of her
project requires her to calculate the volume and center of mass of the
dorsal fin.

Polar shark
-----------

The outer surface of the fin is described by the equation

$$z=\cos(2\theta)-r$$

where $-\pi/4\leq\theta\leq\pi/4$ and $0\leq r\leq
\cos(2\theta)$.

The region at the base of the fin is the teardrop shape inside the graph
of $r=\cos(2\theta)$, $-\pi/4\leq\theta\leq\pi/4$

We would like to compute the integral $\iint_RzdA$.

Do we need to re-express everything in terms of $x$ and $y$?

Polar coordinates are coordinates, too
--------------------------------------

We can perform double integration in polar coordinates!

Tricky point: we need to pay careful attention to $dA$.

In Cartesian coordinates: $dA=dxdy$.

In polar coordinates: $dA=rdrd\theta$.

A "small area element" in polar coordinates has area $rdrd\theta$.

Nedwina's shark
---------------

In our example, we can thus do this:

$$\begin{align}
\iint_RzdA&=\int_{-\pi/4}^{\pi/4}\int_0^{\cos(2\theta)}zrdrd\theta \\
&=\int_{-\pi/4}^{\pi/4}\int_0^{\cos(2\theta)}(\cos(2\theta)-r)rdrd\theta \\
&=\int_{-\pi/4}^{\pi/4}\frac{1}{2}\cos(2\theta)r^2-\frac{1}{3}r^3|_0^{\cos(2\theta)}d\theta \\
&=\int_{-\pi/4}^{\pi/4}\frac{1}{6}\cos^3(2\theta)d\theta \\
&=\frac{1}{12}\int_{-\pi/2}^{\pi/2}\cos^3(u)du \\
&=\frac{1}{12}\int_{-\pi/2}^{\pi/2}\cos(u)(1-\sin^2(u))du \\
&=\frac{1}{12}\left[\sin(u)-\frac{1}{3}\sin^3(u)\right]_{-\pi/2}^{\pi/2}=\frac{1}{9}. \\
\end{align}$$

(Look at this slide later for the details. It is a standard integration
problem once you change the variables!)

Eyeballs, again? (Better than brussels sprouts.)
------------------------------------------------

Our setup: let $R$ be the disk bounded by the circle
$x^2+y^2=\frac{15}{64}$

$$\iint_R\frac{3}{4}+\sqrt{\frac{1}{4}-x^2-y^2}-\sqrt{1-x^2-y^2}dA.$$

Do it!

(The numbers might get ugly. That's ok: eyeballs are messy.)

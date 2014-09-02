Double integrals: iterated integrals
====================================

Iterated integrals: summary
---------------------------

Given a continuous function $f(x,y)$ on a rectangle
$[a,b]\times[c,d]$,

$$\begin{align\*}\iint_Rf(x,y)dxdy&=\int_c^d\left(\int_a^b
f(x,y)dx\right)dy\\ &=\int_a^b\left(\int_c^d
f(x,y)dy\right)dx.\end{align\*}$$

Example: for $f(x,y)=x+y$ and $R=[0,1]\times[0,1]$

$$\begin{align\*} \iint_Rf(x,y)dxdy&=\int_0^1\left(\int_0^1
(x+y)dx\right)dy
=\int_0^1\left(\frac{1}{2}x^2+yx\right)\Biggr|_0^1dy\\
&=\int_0^1\frac{1}{2}+ydy=\frac{1}{2}y+\frac{1}{2}y^2\Biggr|_0^1=1.
\end{align\*}$$

Do one!
-------

Remember our friend the egg carton? Equation:
$f(x,y)=\sin(x)\cos(y)$.

Calculate the double integral

$$\iint_{[0,\pi]\times[-\pi/2,\pi/2]}\sin(x)\cos(y)dxdy$$

What if we change the region to $[0,2\pi]\times[0,2\pi]$?

The piglet was excited
----------------------

The piglet of calculus came knocking on your door at 2 AM waving a
notebook in the air. She called you over and said:

"For any function $f(x,y)$ of the form $f(x,y)=g(x)h(y)$ and any
rectangle $R=[a,b]\times[c,d]$, I know that

$$\iint_Rf(x,y)dxdy=\left(\int_a^bg(x)dx\right)\cdot\left(\int_c^dh(y)dy\right)."$$

Was she right?

Iterating the piglet
--------------------

Does our new tool help us understand the piglet's question?

$$\iint_Rg(x)h(y)dxdy=\left(\int_a^bg(x)dx\right)\cdot\left(\int_c^dh(y)dy\right).$$

Think about this for a few minutes.

[![Powered by
MathJax](http://www.mathjax.org/badge.gif "Powered by MathJax")](http://www.mathjax.org/)[![HTML5
Powered with CSS3 / Styling, Graphics, 3D & Effects, Multimedia, and
Semantics](http://www.w3.org/html/logo/badge/html5-badge-h-css3-graphics-multimedia-semantics.png "HTML5 Powered with CSS3 / Styling, Graphics, 3D & Effects, Multimedia, and Semantics")](http://www.w3.org/html/logo/)


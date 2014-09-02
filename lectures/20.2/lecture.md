Center of mass
==============

Question {.question}
--------

Nedwina enjoys eating roadkill. She has found a squashed squirrel in the
shape of the unit square centered at the origin in the $xy$-plane; its
density at a point $(x,y)$ is $e^{x+y}$. In order to cook the
squirrel correctly, Nedwina has to balance it on the top of a narrow
stick. How should she lay the flat and rigid squirrel on the stick?

Re-phrase: where is the center of mass of the flattened squirrel?

Here is a representation in which the intensity of color is proportional
to the density $e^{x+y}$.

Where do you guess the center of mass will be?

Computing center of mass
------------------------

Let's suppose we have a planar lamina $D$ with a function
$\rho(x,y)$ describing the density of the lamina at a point
$(x,y)$.

Just like in Math 125, we compute the center of mass by dividing the
moments around the $x$ and $y$ axes by the mass. In integrals, the
location $(\overline x,\overline y)$ of the center of mass will be:

$$\overline
x=\frac{\iint_Dx\rho(x,y)dA}{\iint_D\rho(x,y)dA}$$

$$\overline
y=\frac{\iint_Dy\rho(x,y)dA}{\iint_D\rho(x,y)dA}$$

In our case
-----------

Writing it out for Nedwina's squirrel:

$$\overline
x=\frac{\int_{-1/2}^{1/2}\int_{-1/2}^{1/2}xe^{x+y}dxdy}{\int_{-1/2}^{1/2}\int_{-1/2}^{1/2}e^{x+y}dxdy}=\frac{3-e}{2e-2}$$

$$\overline
y=\frac{\int_{-1/2}^{1/2}\int_{-1/2}^{1/2}ye^{x+y}dxdy}{\int_{-1/2}^{1/2}\int_{-1/2}^{1/2}e^{x+y}dxdy}=\frac{3-e}{2e-2}$$

*Yum!* {style="position:relative;top:2.4em;color:#00cc00"}
------

Do one!
-------

A steam roller comes by and runs over the squirrel. The poor thing now
occupies the square $[-1,1]\times[-1,1]$ with density function
$\rho(x,y)=\alpha e^{x+y}$ (where $\alpha$ is a constant that
keeps the total mass constant; find it if you feel like it).

-   What is the new center of mass?
-   Suppose this procedure repeats so that the $n$th time the steam
    roller runs over the squirrel the square becomes
    $[-2+e^{-n},2-e^{-n}]\times [-2+e^{-n},2-e^{-n}]$ and the
    density becomes $\rho(x,y)=\alpha_n e^{x/n+y/n}$ (for an
    appropriate constant $\alpha_n$ to keep the mass constant). What
    is the limiting position of the center of mass as $n\to\infty$?

[![Powered by
MathJax](http://www.mathjax.org/badge.gif "Powered by MathJax")](http://www.mathjax.org/)[![HTML5
Powered with CSS3 / Styling, Graphics, 3D & Effects, Multimedia, and
Semantics](http://www.w3.org/html/logo/badge/html5-badge-h-css3-graphics-multimedia-semantics.png "HTML5 Powered with CSS3 / Styling, Graphics, 3D & Effects, Multimedia, and Semantics")](http://www.w3.org/html/logo/)


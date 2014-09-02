Double integrals: first examples
================================

The double integral appears
---------------------------

In reasonable circumstances the approximations we get from Riemann sums
improve as the mesh gets finer and finer.

Let's give this limit a name!

If $f(x,y)$ is continuous on the rectangle $R=[a,b]\times[c,d]$
then the double integral of $f$ over $R$ is the limit

$$\iint_R f(x,y)dx
dy=\lim_{n\to\infty}\sum_{i=1}^n\sum_{j=1}^nf(x_{ij},y_{ij})\Delta(x)\Delta(y).$$

You will see a slightly different formulation in some books. Compare
them and decide if they're the same! (He divides the two directions into
different numbers of parts, etc., etc.)

It computes volume
------------------

As you can guess from our model, the double integral computes a volume.

Theorem: given a function $f(x,y)$ continuous and non-negative over a
rectangle $R$ in $\mathbf R^2$, the volume of the solid between
the $xy$-plane and the graph of $f$ over $R$ equals
$\iint_Rfdxdy.$

This baby has volume approximately $16.5895$. Sweet. (How did the
computer get this?)

How do you compute these?
-------------------------

Can we do a single example?

Here's one: $f(x,y)=1$ over the rectangle $R=[-1,1]\times[-1,1].$
For the $n$th Riemann sum,
$\Delta(x)=\frac{1-(-1)}{n}=\frac{2}{n}$ and similarly for
$\Delta(y)$.

Computing the Riemann sums:

$$\begin{align\*}
S_n=\sum_{i=1}^n\sum_{j=1}^n1\Delta(x)\Delta(y)=\left(\sum_{i=1}^n\Delta(x)\right)\left(\sum_{j=1}^n\Delta(y)\right)\\
&=
\left(\sum_{i=1}^n\frac{2}{n}\right)\left(\sum_{j=1}^n\frac{2}{n}\right)\\
&=2\cdot 2=4, \end{align\*}$$

so we get $\iint_R 1dxdy=4.$

The piglet is excited
---------------------

The piglet of calculus has come knocking on your door at 2 AM. She is
waving a notebook in the air. She calls you over and says:

"For any function $f(x,y)$ of the form $f(x,y)=g(x)h(y)$ and any
rectangle $R=[a,b]\times[c,d]$, I know that

$$\iint_Rf(x,y)dxdy=\left(\int_a^bg(x)dx\right)\cdot\left(\int_c^dh(y)dy\right)."$$

Is she right?

To warm up, you could try $f(x,y)=x$ and then $f(x,y)=xy.$

If you settle the piglet's question, you might try your hand at
computing $\iint_{[0,1]\times[0,2]}(x+y) dxdy$; this does not fit
into the piglet's pattern, of course!

Germany + Italy = happy pig
---------------------------

Go and learn about iterated integrals, an incredibly powerful method of
computing these beasts. We will use them together in other segments, but
I will assume you know what they are.

Observation: we can try to split up the integral by dealing with the
variables separately. If we choose the center points in each rectangle,
we can write a Riemann sum and then start speculating wildly.

$$\begin{align\*}&\sum_{i=1}^n\sum_{i=1}^mf(x_{i},y_{j})\Delta(x)\Delta(y)=\sum_{i=1}^m\Delta(x)\sum_{j=1}f(x_i,y_j)\Delta(y)\\
&\approx\sum_{i=1}^m\Delta(x)\int_{c}^d
f(x_i,y)dy\approx\int_{a}^b\left(\int_{c}^df(x,y)dy\right)dx\end{align\*}$$

[![Powered by
MathJax](http://www.mathjax.org/badge.gif "Powered by MathJax")](http://www.mathjax.org/)[![HTML5
Powered with CSS3 / Styling, Graphics, 3D & Effects, Multimedia, and
Semantics](http://www.w3.org/html/logo/badge/html5-badge-h-css3-graphics-multimedia-semantics.png "HTML5 Powered with CSS3 / Styling, Graphics, 3D & Effects, Multimedia, and Semantics")](http://www.w3.org/html/logo/)


Double integrals: Riemann sums
==============================

How big is Mt. Rainier?
-----------------------

A large mining company has decided it wants to turn Mt. Rainier into
pure profit by smashing and carting the whole thing away one rock at a
time (for use in fishtanks). They ask the piglet of calculus to help
them calculate the amount of rock they will end up with.

What are the piglet's options?

(Note: the piglet has access to the Puget Sound LIDAR Consortium's data
set.)

Toy model rides again
---------------------

Let's think about a toy model given by

$$z=\sqrt{\frac{10-x^2-y^2}{e^{x^2+y^2}}}.$$

Crude approximation
-------------------

Let's just try to get the volume over the 4 by 4 square centered at the
origin.

That oughta do it.

We can do better than that!
---------------------------

Let's refine the grid! Vol:

Change the number of blocks, observe the effect on the approximation.
"N" means "N by N grid"

Keep going!
-----------

Just to show you, here is what happens for a 100 by 100 grid. Vol:

That's a mighty fine approximation you have there. It would be a shame
if anything happened to it....

Does this remind you of anything?
---------------------------------

Are we just playing with blocks?

LEGO is Danish, but these things are          .

Remember Riemann sums?
----------------------

In your calculus youth, you learned about integration via Riemann sums.

Recall: given a function $f(x)$ defined on an interval $[a,b]$ and
an integer $n$, we form the $n$th Riemann sum like this:

$$S_n=\sum_{i=1}^nf\left(a+(2i-1)\frac{b-a}{2n}\right)\frac{1}{n}=\sum_{i=1}^nf(x_i)\Delta(x)$$

The idea: divide the interval into $n$ equal pieces, evaluate the
function in the middle of each interval, and add up the areas of the
resulting rectangles.

Stew in brain juices
--------------------

Try to set up a similar thing for functions of two variables $f(x,y)$
over a rectangle $[a,b]\times[c,d]$: $x$ goes from $a$ to $b$
and $y$ goes from $c$ to $d$.

Some components you might want to use to start:

$$\sum_{i=1}^m\sum_{j=1}^n\qquad\qquad
\Delta(x)\qquad\qquad \Delta(y)\qquad\qquad f\qquad\qquad
x_{ij}\qquad\qquad y_{ij}$$

This is not just a mindless exercise. How would you program a computer
to make these approximations? Work backwards from there if you want!

Maybe I just worked some magic to make those models before.

Riemann sums over rectangles
----------------------------

Here's one possible answer:

Suppose $f(x,y)$ is defined and continuous on the rectangle
$$[a,b]\times[c,d]=\{(x,y) | a\leq x\leq b, c\leq y\leq
d\}.$$ "The" $n$th Riemann sum of $f$ is

$$S_n=\sum_{i=1}^n\sum_{j=1}^nf(x_{ij},y_{ij})\Delta(x)\Delta(y),$$

where $(x_{ij},y_{ij})$ is a point in the $ij$-subrectangle
$$\left[a+(i-1)\frac{b-a}{n},a+i\frac{b-a}{n}\right]\times\left[c+(j-1)\frac{d-c}{n},c+j\frac{d-c}{n}\right].$$

Where the heck are the rectangles in there?!

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
rectangle $R$ in $\mathbf{R}^2$, the volume of the solid between
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

$$\begin{align}
S_n&=\sum_{i=1}^n\sum_{j=1}^n1\Delta(x)\Delta(y) \\
&=\left(\sum_{i=1}^n\Delta(x)\right)\left(\sum_{j=1}^n\Delta(y)\right)\\
&=\left(\sum_{i=1}^n\frac{2}{n}\right)\left(\sum_{j=1}^n\frac{2}{n}\right)\\
&=2\cdot 2=4, \end{align}$$

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

$$\begin{align}&\sum_{i=1}^n\sum_{i=1}^mf(x_{i},y_{j})\Delta(x)\Delta(y)=\sum_{i=1}^m\Delta(x)\sum_{j=1}f(x_i,y_j)\Delta(y)\\
&\approx\sum_{i=1}^m\Delta(x)\int_{c}^d
f(x_i,y)dy\approx\int_{a}^b\left(\int_{c}^df(x,y)dy\right)dx\end{align}$$

Double integrals: iterated integrals
====================================

Iterated integrals: summary
---------------------------

Given a continuous function $f(x,y)$ on a rectangle
$[a,b]\times[c,d]$,

$$\begin{align}\iint_Rf(x,y)dxdy&=\int_c^d\left(\int_a^b
f(x,y)dx\right)dy\\ &=\int_a^b\left(\int_c^d
f(x,y)dy\right)dx.\end{align}$$

Example: for $f(x,y)=x+y$ and $R=[0,1]\times[0,1]$

$$\begin{align} \iint_Rf(x,y)dxdy&=\int_0^1\left(\int_0^1
(x+y)dx\right)dy
=\int_0^1\left(\frac{1}{2}x^2+yx\right)\Biggr|_0^1dy\\
&=\int_0^1\frac{1}{2}+ydy=\frac{1}{2}y+\frac{1}{2}y^2\Biggr|_0^1=1.
\end{align}$$

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






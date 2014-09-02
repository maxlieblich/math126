Double integrals: Riemann sums
==============================

How big is Mt. Rainier? {.question}
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

[![Powered by
MathJax](http://www.mathjax.org/badge.gif "Powered by MathJax")](http://www.mathjax.org/)[![HTML5
Powered with CSS3 / Styling, Graphics, 3D & Effects, Multimedia, and
Semantics](http://www.w3.org/html/logo/badge/html5-badge-h-css3-graphics-multimedia-semantics.png "HTML5 Powered with CSS3 / Styling, Graphics, 3D & Effects, Multimedia, and Semantics")](http://www.w3.org/html/logo/)


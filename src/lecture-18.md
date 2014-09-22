Double integrals over regions
=============================

The volume of an eyeball
------------------------

Here's a simple model of an eyeball: take two spheres, say one of radius
$1$ and one of radius $1/2$ and translate the smaller one up by
$3/4$.

Equations: $x^2+y^2+z^2=1$, $x^2+y^2+(z-3/4)^2=1/4$

What is the total volume enclosed in the eyeball (including cornea)?

Hope (?): set up some kind of double integrals that calculate what we
want.

Think very hard about actually calculating the integrals....

Find the sticking point
-----------------------

You know about double integrals over rectangles.

Now think about where your tools might fail in attacking the eyeball
problem.

To get started, you might want to think about how you would like to use
the magic of calculus to calculate the extra volume contained in the
cornea. (Yes, this question is vague on purpose.)

The crux
--------

The two spheres intersect in a circle.

How do we take double integrals over interesting regions?

Miracle? Math!
--------------

Here's something absolutely amazing.

When we take an iterated integral $\int_c^d\int_a^bf(x,y)dxdy$,

we can let $a$ and $b$ be functions of $y$!

(And we can do the reverse if we integrate in the other order. Make the
limits on the inner integral functions of the outer variable.)

After all, we're treating $y$ like a constant when we integrate with
respect to $x$.

All that happens is that the limits of the integral change when we
change the (static) value of $y$.

Example
-------

Let's return to the function $f(x,y)=x+y$, but let's integrate it over
the region inside the parabola $x=y^2$ between $x=0$ and $x=1$.

![](media/region.jpg)

The integral becomes $\int_0^1\int_{-\sqrt x}^\sqrt{x}
(x+y)dydx$.

Inner: $\int_{-\sqrt x}^{\sqrt
x}(x+y)dy=xy+\frac{1}{2}y^2\Bigr|_{-\sqrt x}^{\sqrt
x}=2x^{3/2}$.

Outer:
$\int_0^12x^{3/2}dx=\frac{4}{5}x^{5/2}\Bigr|_0^1=\frac{4}{5}$

Piece of cake!

Do one
------

Let's warm up a bit for our eyeball problem.

What is the integral of the function $z=x+\frac{y}{e^{x^2+y^2}}$
over the unit disk?

If you are afraid, try doing the terms one at a time.

Standard operating procedure:

-   Write the problem as a double integral.
-   Choose a way of writing it as an iterated integral, expressing the
    limits of the inner integral in terms of the outer variable (!).
-   See what happens. If you get stuck, try it the other way. Or
    subdivide the region and try again (less common).
-   Remember: integration is HARD, so you cannot expect answers to come
    to you easily. If you find it hard, you are doing it right.

Return of the eyeball
---------------------

Set up a calculation of the eyeball volume. You might want to use the
formula for the volume of a sphere, but also one or more double
integrals over regions.

Equations: $x^2+y^2+z^2=1$, $x^2+y^2+(z-3/4)^2=1/4$

This time you have to think about your own picture. Dark alley, etc.,
etc.

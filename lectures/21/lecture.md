Errors in linear approximation
==============================

Nedwina and the piglet play the market
--------------------------------------

It's 1999, right before the bursting of the tech stock bubble, and
Nedwina and the piglet of calculus have stock market fever.

(This is not a good sign.)

Their friend, the Slimy Stock Snail, tells them that the best linear
approximation to the Dow Jones Industrial Average is

$$f(t)=10000+3000t,$$

where $t$ is the time in days from now.

What could go wrong?

More precisely:
---------------

What kinds of additional information do Nedwina and the piglet need to
evaluate the accuracy of the linear approximation?

Can they be sure that the projection will be within 5000 of the correct
value in one year?!?!

Examples
--------

Let's start with some simple minded examples. Here are a bunch of
functions with derivative $0$ at $t=0$:

-   $f(t)=t^2$
-   $f(t)=t^3$
-   $f(t)=\cos(t)-1$
-   $f(t)=t^{10}$

In each case, the best linear approximation around $t=0$ is the
function $L(t)=0$.

How can we capture the error in this approximation at $t=730$, i.e.,
how can we bound the absolute value $|L(730)-f(730)|$?

Photographic evidence
---------------------

Here's a graph showing all of the functions between $t=0$ and $t=2$

None of the functions is especially close, but some are much worse than
others.

The "rate of climb" of each graph seems to predict how far off the
approximation is.

*The pig is tingling*: grasping the first derivative seems to help bound
errors?

If you know more, you actually more, I
--------------------------------------

How about we start with a crudely wonderful estimate of values of the
function:

Theorem: if there is a number $M$ such that $|f'(x)|\leq M$ for all
$x$ between $b$ and $c$ then $$|f(c)-f(b)|\leq M|c-b|.$$

Indication of proof: $$|f(c)-f(b)|=\left|\int_b^c
f'(x)dx\right|\leq\left|\int_b^c
|f'(x)|dx\right|\leq\left|\int_b^c Mdx\right|=M|c-b|.$$

Example: $f(x)=\sin(x)$: $|f'(x)|\leq 1$ for all $x$, so
$|f(c)-f(b)|\leq|c-b|$ for all $b,c$.

How good an estimate is this?

If you know more, you actually know more, II
--------------------------------------------

If we know about more derivatives, we get *EVEN MORE*.

Given a differentiable function $f(t)$ and a point $b$ where $f$
is defined, the best linear approx to $f(t)$ near $b$ is
$L_b(t)=f(b)+f'(b)(t-b)$.

Theorem: if $M$ is a number such that $|f''(x)|\leq M$ for all
$x$ between $b$ and $c$ then $|L_b(c)-f(c)|\leq
\frac{1}{2}M|c-b|^2$.

Examples
--------

-   $f(t)=t^{10}$: $|f''(t)|\leq 10\cdot 9\cdot 2^8=23040$ for
    $0\leq t\leq 2$, so $|L_0(2)-f(2)|\leq 46080$ (ugh?)
-   $f(t)=\sin(t)$: $|f''(t)|\leq 1$ for all $t$, so for any
    value $c$ we have $|L_b(c)-f(c)|\leq \frac{1}{2}|c-b|^2$.
-   When (for which $b$) is this estimate of the error in the linear
    approximation to $\sin$ good? When is it terrible?

Do one!
-------

In our example: $L_0(t)=10000+3000t$.

-   What bound on $|f''(x)|$ for $0\leq x\leq 730$ will ensure
    Nedwina and the piglet that the Stock Snail's estimate is within
    10000 of the DJIA by the end of year 2 (day 730)?
-   What bound on $|f''(x)|$ for $0\leq x\leq 730$ will ensure
    that Nedwina and the piglet do not see the DJIA end up **below**
    5000 by year 2 (day 730)?
-   Which is a stronger (i.e., harder to achieve) assumption?

Do one backwards!
-----------------

Consider the function $f(t)=\cos(t)$. Find a number $c$ such that
on the interval $[\pi/2,c]$, the linear approximation
$L_{\pi/2}(t)$ to $f(t)$ is always within $0.01$ of $f(t)$.

Hint: try to bound the second derivative, and combine this with the
theorem: $|f''(x)|\leq M$ implies
$|L_b(x)-f(x)|\leq\frac{1}{2}M|x-b|^2$.

Do another one!
---------------

Do the same deal for the function $f(t)=1/t$, approximated near
$t=1$ with an accuracy of $10^{-7}$.

Theoretical question
--------------------

Given a twice continuously differentiable function $f$, what if we
know that for every value $t=b$, there is an interval $[b,c]$ such
that $f''(x)=0$ for $x\in[b,c]$? Can we say (or conjecture)
anything about the structure of $f$?


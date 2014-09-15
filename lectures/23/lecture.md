Even higher order approximation
===============================

Nedwina and the piglet won't stop playing the market
----------------------------------------------------

It's still 1999, still before the bursting of the tech stock bubble, and
Nedwina and the piglet of calculus have stock market fever.

Nedwina and the piglet have calculated every Taylor polynomial
$T_n(t)$ of the DJIA.

Do they have perfect information? Can they now play the market with
impunity?

In purely mathematical terms: can we reconstruct a function from its
Taylor polynomials?

Let's think about some examples
-------------------------------

How about $f(x)=\sin(x)$?

We know the Taylor polynomials, say around $b=0$: for $n=2m+1$,

$$T_n(x)=\sum_{i=0}^m(-1)^i\frac{x^{2i+1}}{(2i+1)!}.$$

-   $T_1(x)=x$
-   $T_3(x)=x-\frac{x^3}{3!}$
-   $T_5(x)=x-\frac{x^3}{3!}+\frac{x^5}{5!}$
-   $T_7(x)=x-\frac{x^3}{3!}+\frac{x^5}{5!}-\frac{x^7}{7!}.$

Fix $x$, feel the love.
-------------------------

Given a value of $x$ and any $n=2m+1$, using the techniques we
learned last time, we can bound the error like this:

$|\sin(x)-T_n(x)|\leq \frac{|x^{n+2}|}{(n+2)!}$.

What happens as we let $n$ grow?

Theorem: for a fixed $x$, $\lim_{N\to\infty}\frac{x^N}{N!}=0$.

Idea: pick an integer $M$ such that $x\leq M$. Then
$\frac{x^{M+K}}{(M+K)!}=\frac{x}{1}\cdot\cdots\cdot\frac{x}{M}\cdot\frac{x}{M+1}\cdots\cdot\frac{x}{M+K}$.
The first dotted clump is some fixed number, while the second has every
factor less than $1$ and in fact decreasing. Since
$\lim_{Q\to\infty}\frac{x}{Q}=0$, we are done.

$\infty$ bottles of beer on the wall....
-------------------------------------------

We seem to be seeing the following: for any value of $x$ we know that
$\lim_{n\to\infty}T_n(x)=\sin(x)$.

More suggestively,

$$\sin(x)=x-\frac{x^3}{3!}+\frac{x^5}{5!}-\frac{x^7}{7!}+\cdots=\sum_{i=0}^\infty
(-1)^i\frac{x^{2i+1}}{(2i+1)!}.$$

We call this an "infinite sum," but of course we can't add infinitely
many things.

As a function of $x$, this infinite sum is called the Taylor series
expansion of $\sin(x)$.

To compute $\sin(x)$ to arbitrary accuracy, we just have to take
enough terms to ensure that the error is low.

Example
-------

Let's see what happens if we try to compute
$\sin(\pi)=\pi-\pi^3/3!+\pi^5/5!-\cdots$ using the different
approximations.

-   $T_1(\pi)=\pi=3.14159269....$. Good approximation?
-   $T_3(\pi)=-2.02612....$
-   $T_5(\pi)=0.524044....$
-   $T_7(\pi)=-0.0752206$
-   $T_9(\pi)=0.00692527$
-   $T_{19}(\pi)\approx 5.28918\times 10^{-10}$. (This is pretty
    good, but not really that great, eh?)

Why do the signs alternate?

Make some!
----------

Write down the Taylor series $\sum_{i=1}^\infty
f^{(n)}(b)\frac{(x-b)^n}{n!}$ of the following functions around the
given points.

-   $f(x)=e^x$ around $b=0$
-   $f(x)=\frac{1}{1-x}$ around $b=0$
-   $f(x)=1+x+x^2+x^3+427x^7$ around $b=0$
-   $f(x)=\frac{1}{1-x}$ around $b=2$
-   $f(x)=e^{-1/x^2}$ around $b=0$


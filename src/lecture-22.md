Higher order approximation
==========================

Nedwina and the piglet keep playing the market
----------------------------------------------

It's still 1999, still before the bursting of the tech stock bubble, and
Nedwina and the piglet of calculus have stock market fever.

(This is still not a good sign.)

Nedwina and the piglet realize that they need to do better than a linear
approximation if they want to outsmart the Slimy Stock Snail. Recall
that the best linear approximation is:

$$f(t)=10000+3000t,$$

where $t$ is the time in days from now. In addition, by analyzing the
data, Nedwina and the piglet conclude that the best linear approximation
to the first derivative of $f$ is

$$g(t)=3000-10t.$$

Is it ever enough?
------------------

Using their New and Improved Better Tasting Stock Toothpick (© 1999),
how far off can N and the P be in six months? What additional
information would help? Do they have enough juice?

What kinds of additional information could N and the P use to evaluate
the accuracy of the new approximation?

Will it ever be enough?

Quadratic approximation
-----------------------

What kind of quadratic approximation do we get from our two pieces?

If $D(t)$ is the value of the DJIA, then $f(t)=10000+3000t$
approximates $D(t)$ and $g(t)=3000-10t$ approximates $D'(t)$.

Integrating $g(t)$ and accounting for the initial value (which we can
compute as $f(0)$), we get an approximation function

$$h(t)=10000+3000t-5t^2.$$

This is the best quadratic approximation to our function.

General formula: the best quadratic approximation to $f(t)$ around the
point $t=b$ is given by
$$T_2(x)=f(b)+f'(b)(x-b)+\frac{1}{2}f''(b)(x-b)^2.$$

Examples
--------

Let's continue with the some examples from last time. Here are a bunch
of functions with their quadratic approximations around $t=0$:

Quadratic approx near $0$: $T_2(x) = f(0) + f'(0)x +
\frac{1}{2}f''(0)x^2$

-   $f(t)=t^2$, best quadratic approximation near $0$:
    $T_2(t)=t^2$
-   $f(t)=t^3$, best quadratic approximation near $0$:
    $T_2(t)=0$ (!!)
-   $f(t)=\sin(t)$, best quadratic approximation near $0$:
    $T_2(t)=t$ (!?!)
-   $f(t)=t^{367}$, best quadratic approximation near $0$:
    $T_2(t)=0$.

Do some!
--------

Find the best quadratic approximations
$f(b)+f'(b)(x-b)+\frac{1}{2}f''(b)(x-b)^2$ to the following
functions around the points indicated:

-   $f(x)=x^3$ around $b=1$
-   $f(x)=\sin(x)$ around $b=\pi/2$
-   $f(x)=e^{-x^2}$ around $b=0$

Error
-----

We can estimate error just like we did last time.

The key: the *third* derivative! (Surprised?)

Theorem: If $|f'''(t)|\leq M$ for all $t$ between $b$ and $c$
then

$$|f(c)-T_2(c)|\leq\frac{M}{6}|c-b|^3.$$

In our example: $T_2(c)=10000+3000c-5c^2.$

If $|D'''(t)|\leq M$ during the next half year, then we see that

$$|T_2(c) - D(c)|\leq 1004762 M$$

Mind: blown
-----------

Why stop at quadratic approximations?

We can approximate to higher and higher order!

Let's fix a function $f(x)$ that is "infinitely differentiable" (every
derivative has a derivative).

-   Linear approx near $b$: $T_1(x)=f(b)+f'(b)(x-b)$
-   Quadratic approx near $b$:
    $T_2(x)=f(b)+f'(b)(x-b)+\frac{1}{2}f''(b)(x-b)^2$
-   Cubic approx near $b$:
    $T_3(x)=f(b)+f'(b)(x-b)+\frac{1}{2}f''(b)(x-b)^2+\frac{1}{6}f'''(b)(x-b)^3$.
-   General:
    $T_n(x)=f(b)+f'(b)(x-b)+\frac{1}{2}f^{(2)}(b)(x-b)^2+\cdots+\frac{1}{n!}f^{(n)}(b)(x-b)^n$.

Say what?
---------

Maybe we should refresh our memories about the notation.

-   $f^{(n)}(b)$ is the $n$th derivative of $f$ at $b$ (so
    $f=f^{(0)}$, $f'=f^{(1)}$, $f''=f^{(2)}$, etc.)
-   $n!=n\cdot(n-1)\cdot(n-2)\cdot\cdots\cdot 2\cdot 1$,
    pronounced "$n$ factorial", is the product of the integers from
    $1$ to $n$ (so $1!=1$, $2!=2$, $3!=6$, $4!=24$,etc.),
    and by definition $0!=1$.

The formula again: the $n$th Taylor polynomial of $f(x)$ around
$b$ is

$$\begin{align}T_n(x)&=f(b)+f^{(1)}(b)(x-b)+\frac{1}{2}f^{(2)}(b)(x-b)^2+\cdots+\frac{1}{n!}f^{(n)}(b)(x-b)^n\\&
=\sum_{i=0}^n\frac{1}{i!}f^{(i)}(b)(x-b)^i\end{align}$$

Example
-------

Let's wrap the piglet's head around an example: $f(x)=\sin(x)$.

-   Linear approximation at $b=0$: $T_1(x)=x$
-   Quadratic approx at $b=0$: $T_2(x)=x$
-   Cubic: $T_3(x)=x-\frac{1}{6}x^3$
-   Quartic: $T_4=x-\frac{1}{6}x^3$
-   Quintic: $T_5=x-\frac{1}{6}x^3+\frac{1}{5!}x^5$
-   Septic:
    $T_7=x-\frac{1}{6}x^3+\frac{1}{5!}x^5-\frac{1}{7!}x^7$
-   General, for $n=2m+1$ odd:
    $T_n=\sum_{i=0}^m\frac{(-1)^{i}}{(2i+1)!}x^{2i+1}$ (don't
    worry!)

Photographic evidence
---------------------

Here's a graph showing the approximations of odd degree up to $9$
between $t=0$ and $t=2\pi$

Approximations of different orders get bad in different ways: end up too
high or too low. Is there a pattern?

Anything else to observe?

Try some!
---------

Find formulas for $T_n$ as a sum (with $\sum$, some limits, etc.)
for the following functions:

-   $f(x)=\cos(x)$ near $b=\pi$
-   $f(x)=e^x$ near $b=0$
-   Challenge: $$f(x)=\begin{cases} e^{-1/x^2} &\mbox{if } x\neq
    0\\ 0&\mbox{if } x=0 \end{cases}$$ near $b=0$.

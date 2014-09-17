Stupid Taylor tricks
====================

Warm up problem
---------------

Find an infinite series expansion for the integral
$\int_1^te^{-x^4}dt$. For which $t$ does it converge?

Answers?

Stupid Taylor tricks
--------------------

**Substitute powers**

If the Taylor series of $f(x)$ is $\sum a_nx^n$ then $f(x^m)$
has series $\sum a_nx^{mn}$ for $m\>0$.

Example:

$$\frac{1}{1-x^2}=1+x^2+x^4+\cdots = \sum_{n=0}^\infty
x^{2n}$$

Stupid Taylor tricks
--------------------

**Multiply by powers**

If the Taylor series of $f(x)$ is $\sum a_nx^n$ then $x^mf(x)$
has series $\sum a_nx^{n+m}$ for $m\>0$.

Example:

$$\frac{x^2}{1-x}=x^2+x^3+x^4+\cdots = \sum_{n=0}^\infty
x^{n+2}$$

Stupid Taylor tricks
--------------------

**Leverage derivatives**

If the Taylor series of $f(x)$ is $\sum_{n=0}^\infty a_nx^n$
then $f'(x)$ has series $\sum_{n=1}^\infty na_nx^{n-1}$.

Example:

$$\frac{1}{(1-x)^2}=1+2x+3x^2+4x^3+\cdots = \sum_{n=0}^\infty
(n+1)x^{n}$$

Try one!
--------

Find the Taylor series for

$$f(x)=\frac{x^4}{(1-x^2)^2}$$

Follow up:

-   Find the first four non-zero terms in the series.
-   Calculate $T_5$, the fifth Taylor polynomial for $f$ based at
    $0$.
-   What is $f^{(666)}(0)$?


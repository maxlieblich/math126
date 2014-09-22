Making new Taylor series from old
=================================

Warm up brain
-------------

Here's a problem to try, to get your brain in the slippery place that
lets us manipulate these series: find the Taylor expansion of
$\frac{1}{2-x}$ on the interval $[0,2]$.

Hint: let $y=\frac{1}{2}x$, so that the function becomes
$\frac{1}{2-2y}=\frac{1}{2}\frac{1}{1-y}$. Leverage what you know?

Operations with Taylor series
-----------------------------

-   **Addition**
    -   Given
    -   $f(x)=\sum a_n x^n$
    -   $g(x)=\sum b_n x^n$
    -   Assuming both converge on $[0,c]$
    -   Get: $f(x)+g(x)=\sum(a_n+b_n)x^n$ on the same interval
    -   Add like polynomials

Operations with Taylor series
-----------------------------

-   **Multiplication**
    -   Given
    -   $f(x)=\sum a_n x^n$
    -   $g(x)=\sum b_n x^n$
    -   Assuming both converge on $[0,c]$
    -   Get:
        $f(x)g(x)=\sum_{n=0}^\infty(\sum_{p+q=n}a_pb_q)x^n$
        on the same interval
    -   Multiply like polynomials

Operations with Taylor series
-----------------------------

-   **Differentiation**
    -   Given
    -   $f(x)=\sum a_n x^n$
    -   Assuming the series converges on $[0,c]$
    -   Get: $f'(x)=\sum_{n=1}^\infty na_nx^{n-1}$ on the
        **open** interval $(0,c)$
    -   Differentiate like polynomials

Operations with Taylor series
-----------------------------

-   **Antidifferentiation**
    -   Given
    -   $f(x)=\sum a_n x^n$
    -   Assuming the series converges on $[0,c]$
    -   Get: $\int f dx = \sum_{n=0}^\infty
        \frac{a_n}{n+1}x^{n+1}$ on the same interval
    -   Integrate like polynomials

Let's take a couple of these babies out for a spin.

Addition
--------

Find the Taylor series for the function

$$f(x)=\frac{1}{x^2-3x+2}$$

on the interval $[0,1]$. Thoughts?

Partial fractions:

$$\frac{1}{x^2-3x+1}=\frac{1}{(2-x)(1-x)}=\frac{1}{1-x}-\frac{1}{2-x}.$$

Independent Taylor expansions:
$\frac{1}{2-x}=\sum\frac{1}{2^{n+1}}x^n$; $\frac{1}{1-x}=\sum
x^n$.

Assemble: $f(x)=\sum x^n-\sum\frac{1}{2^{n+1}}x^n=\sum
(1-\frac{1}{2^{n+1}})x^n=\sum \frac{2^{n+1}-1}{2^{n+1}}x^n$.

Do one!
-------

Compute the Taylor series of $\sin(x)+\cos(x)$ near $x=0$.

Integration
-----------

Remember how integration is hard? If we have Taylor series at our
disposal, we can often give some sort of expression for the integral of
a function.

Example: calculate $\int_0^t\sin(x^2)dx$.

Well,
$$\sin(y)=\sum_{n=0}^\infty\frac{(-1)^n}{(2n+1)!}y^{2n+1},$$
so
$$\sin(x^2)=\sum_{n=0}^\infty\frac{(-1)^n}{(2n+1)!}x^{4n+2}$$
(substitute $x^2$ for $y$).

This converges everywhere.

Integration
-----------

Thus,
$$\begin{align}\int_0^t\sin(x^2)dx&=\int_0^t\sum_{n=0}^\infty\frac{(-1)^n}{(2n+1)!}x^{4n+2}dx\\
&=\sum_{n=0}^\infty\frac{(-1)^n}{(4n+3)(2n+1)!}x^{4n+3}\Bigr|_0^t\\
&=\sum_{n=0}^\infty\frac{(-1)^n}{(4n+3)(2n+1)!}t^{4n+3}.\end{align}$$

This may (does!) look inscrutable, but the point is that it is a formula
that we could use to compute that integral if we had to.

Try one!
--------

Find an infinite series expansion for the integral
$\int_1^te^{-x^4}dx$. For which $t$ does it converge?


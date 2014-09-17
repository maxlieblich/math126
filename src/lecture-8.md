Vector calculus: derivatives
============================

Question
--------

A fun-loving electron is traveling in a spiral path around the surface
of a torus.

-   The radius of the torus (i.e., the radius of the circle at the
    center of the tube) is $2$ and the diameter of the circular
    cross-section is $1$.
-   The electron starts at position $(1,0,0)$, travels at a constant
    angular velocity around the vertical axis of $1$ radian per
    second, and its path winds up and around the torus $4$ times
    before it returns to its starting position.

What is the position and velocity of the electron at time $t$?

Fun-loving electron in action
-----------------------------

It moves!
---------

Using the tools from last time, here is a parametric description of the
motion:

$$(x,y,z)=(\cos(t)(2-\cos(4t)),\sin(t)(2-\cos(4t)),\sin(4t))$$

In vector form:

$$\mathbf f(t)=\langle
\cos(t)(2-\cos(4t)),\sin(t)(2-\cos(4t)),\sin(4t)\rangle$$

What is the velocity? What *should* it be?

Velocity: derivative of position, right?
----------------------------------------

We should have that the velocity of the electron is $$\mathbf
v(t)=\mathbf f'(t).$$ But what is this?

Classical definition of the derivative still works for vector-valued
functions:

$$\mathbf f'(t)=\lim_{h\to 0}\frac{\mathbf f(t+h)-\mathbf
f(t)}{h}$$

As usual, the derivative of the position vector is the velocity vector.

Vector derivatives in practice
==============================

Calculating the derivative in practice
--------------------------------------

Given a vector function

$$\mathbf f(t)=\langle x(t),y(t),z(t)\rangle$$

the derivative is just

$$\mathbf f'(t)=\langle x'(t),y'(t),z'(t)\rangle,$$

the component-wise derivative.

The usual caveat applies: the derivative must exist for this to make
sense! I.e., this formula works when all three derivatives exist, and
when they don't neither does the derivative of $\mathbf f(t)$!

Practice
--------

Given the formula

$$\mathbf f(t)=\langle
\cos(t)(2-\cos(4t)),\sin(t)(2-\cos(4t)),\sin(4t)\rangle$$

for the motion of the electron on the torus,

-   calculate the velocity of the electron as a function of $t$
-   How does the speed vary over time?
-   (What is the “speed”, anyway? The magnitude of the velocity vector?
    That sounds right....)

Help the Piglet
---------------

The piglet of calculus tried the question on the previous slide and got
the following answer:

The derivative of $\mathbf f(t)=\langle
\cos(t)(2-\cos(4t)),\sin(t)(2-\cos(4t)),\sin(4t)\rangle$ is:

$$\frac{d\mathbf f}{dt}=\langle
-\sin(t)(2-\cos(4t))+4\cos(t)\sin(4t),
4\cos(t)\sin(4t),\sin(4t)\rangle$$

Every time the piglet enters the answer in webassign, it is marked
wrong. What mistakes did the piglet make?

The piglet
----------

Forgot to differentiate the third component!

-   Wrong: $\sin(4t)$
-   Right: $4\cos(4t)$

Used the product rule incorrectly in the second component (by just
taking the product of the derivatives)!

-   Wrong: $4\cos(t)\sin(4t)$
-   Right: $\cos(t)(2-\cos(4t))+4\sin(t)\sin(4t)$

Anything else?

Have you ever made mistakes like these?

Vector integration
==================

A new problem
-------------

A joey (baby kangaroo) is riding in her mother's pouch. She has a
smartphone with an accelerometer that continuously reports the
acceleration vector. Her friend wrote an app that calculates the
velocity at any moment in time $t$. She is too small to see out of the
pouch, but, like all infant kangaroos, she is interested in calculating
her position as a function of time. Sadly, her somewhat stupid friend
never figured out how to get the position before he started a new app
that mimics the hilarious sounds that giraffes make when embarrassed.

-   The joey records the velocity at time $t$ as $$\mathbf
    v(t)=\langle 1,t,\sin(t)\rangle$$
-   The joey starts at the point $(0,0,1)$
-   Where is the joey at time $t$?

Integrate!
----------

Just like one variable calculus: reconstruct position from velocity by
integrating.

-   Riemann sums: $\sum\mathbf v(t_i)\Delta(t)$
-   Practical: $$\int\langle x(t),y(t),z(t)\rangle
    dt=\left\langle\int x(t)dt,\int y(t)dt,\int
    z(t)dt\right\rangle.$$
-   Example: $$\int\langle 1,t,t^2\rangle dt=\langle
    a,b,c\rangle+\left\langle
    t,\frac{1}{2}t^2,\frac{1}{3}t^3\right\rangle$$
-   The constant of integration is now a vector!

Help the joey
-------------

Using vector integration, compute the path that the joey takes, starting
at $t=0$. Initial position: $(0,0,1)$, velocity $\langle
1,t,\sin(t)\rangle$. A looping animation (for $t=0$ to $t=15$ in
slo-mo):

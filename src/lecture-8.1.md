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

$$\mathbf{f}(t)=\langle
\cos(t)(2-\cos(4t)),\sin(t)(2-\cos(4t)),\sin(4t)\rangle$$

What is the velocity? What *should* it be?

Velocity: derivative of position, right?
----------------------------------------

We should have that the velocity of the electron is $$\mathbf{v}(t)=\mathbf{f}'(t).$$ But what is this?

Classical definition of the derivative still works for vector-valued
functions:

$$\mathbf{f}'(t)=\lim_{h\to 0}\frac{\mathbf{f}(t+h)-\mathbf{f}(t)}{h}$$

As usual, the derivative of the position vector is the velocity vector.

[![Powered by
MathJax](http://www.mathjax.org/badge.gif "Powered by MathJax")](http://www.mathjax.org/)
[![HTML5 Powered with CSS3 / Styling, Graphics, 3D & Effects,
Multimedia, and
Semantics](http://www.w3.org/html/logo/badge/html5-badge-h-css3-graphics-multimedia-semantics.png "HTML5 Powered with CSS3 / Styling, Graphics, 3D & Effects, Multimedia, and Semantics")](http://www.w3.org/html/logo/)


Tangential and normal acceleration
==================================

Question
--------

### The electron again

The electron is joined by a tiny rubber blob of length and width each
equal to $0.1$. Usual motion:

$$\mathbf{f}(t)=\langle
\cos(t)(2-\cos(4t)),\sin(t)(2-\cos(4t)),\sin(4t)\rangle$$

Headwind (resp. tiny monkey) causes rubber blob to change length (resp.
width) in proportion to the acceleration $a$ along the path (resp. the
acceleration $b$ normal to the path).

$$\Delta(\textrm{length})=-0.01a\qquad
\Delta(\textrm{width})=0.01b$$

-   What are the length and width of the rubber blob at time $t$?
-   More basic question: how can we describe the acceleration along the
    path or perpendicular to the path? What does it mean?

Examples
--------

### What is acceleration along and perpendicular to these paths?

-   $(t^{45},0,0)$
-   $(t^2-1,t^3-t,0)$
-   $(\cos(t),\sin(t),t)$

Examples
--------

### First: $(t^{45},0,0), -1\leq t\leq 1$ loop

Examples
--------

### First: $(t^{45},0,0)$

Motion on a string!

The acceleration in the direction of motion is just the vector
$\langle 1980 t^{43},0,0\rangle$. It always points in the direction
of the motion (including negative scalars, so could point in opposite
direction).

How is the sign change at $t=0$ reflected in the motion?

Examples
--------

### Second: $(t^2-1,t(t^2-1),0), -2\leq t\leq 2$ loop

acceleration

tangential component

normal component

Examples
--------

### Second: $(t^2-1,t(t^2-1),0)$, observations

-   What we call "turning" looks like increased magnitude of normal
    component of acceleration.
-   Tangential component of acceleration can be very negative for a
    while before things slow down!
-   What else?

Examples
--------

### Second: $(t^2-1,t(t^2-1),0)$

To calculate: find the unit tangent and normal vectors, then calculate
components of acceleration.

-   Unit tangent: $\mathbf{T}(t)=\frac{1}{\sqrt{9t^4-2t^2+1}}\langle 2t,3t^2-1,0\rangle$
-   Unit normal: $\mathbf{N}(t)=\frac{1}{\sqrt{9t^4-2t^2+1}}\langle 1-3t^2,2t,0\rangle$
-   Acceleration: $\mathbf{a}(t)=\langle 2,6t,0\rangle$
-   The components of $\mathbf{a}(t)$ in the directions of $\mathbf{T}(t)$ and $\mathbf{N}(t)$:
    -   $(\mathbf{a}(t)\cdot\mathbf{T}(t))\mathbf{T}(t)=\frac{18t^3-2t}{9t^4-2t^2+1}\langle
        2t,3t^2-1,0\rangle$
    -   $(\mathbf{a}(t)\cdot\mathbf{N}(t))\mathbf{N}(t)=\frac{6t^2+2}{9t^4-2t^2+1}\langle
        1-3t^2,2t,0\rangle$
-   Which component dominates for large $t$? How about for $t$ near
    $0$? Consistent with observations?

Examples
--------

### Do the third: the helix $(\cos(t),\sin(t),t)$

To calculate: find the unit tangent and normal vectors, then calculate
components of acceleration.

-   Unit tangent: $\mathbf{T}(t)=$
-   Unit normal: $\mathbf{N}(t)=$
-   Acceleration: $\mathbf{a}(t)=$
-   The components of $\mathbf{a}(t)$ in the directions of $\mathbf{T}(t)$ and $\mathbf{N}(t)$:
    -   $(\mathbf{a}(t)\cdot\mathbf{T}(t))\mathbf{T}(t)=$
    -   $(\mathbf{a}(t)\cdot\mathbf{N}(t))\mathbf{N}(t)=$

Examples
--------

### Do the third: the helix $(\cos(t),\sin(t),t)$

To calculate: find the unit tangent and normal vectors, then calculate
components of acceleration.

-   Unit tangent: $\mathbf{T}(t)=\frac{1}{\sqrt{2}}\langle
    -\sin(t),\cos(t),1\rangle$
-   Unit normal: $\mathbf{N}(t)=\langle
    -\cos(t),-\sin(t),0\rangle$
-   Acceleration: $\mathbf{a}(t)=\langle
    -\cos(t),-\sin(t),0\rangle$
-   The components of $\mathbf{a}(t)$ in the directions of $\mathbf{T}(t)$ and $\mathbf{N}(t)$:
    -   $(\mathbf{a}(t)\cdot\mathbf{T}(t))\mathbf{T}(t)=\mathbf{0}$
    -   $(\mathbf{a}(t)\cdot\mathbf{N}(t))\mathbf{N}(t)=\langle
        -\cos(t),-\sin(t),0\rangle$
-   Why does the acceleration have no tangential component?
-   (More troubling?) Why does the normal component have no
    $z$-component? How can the particle be climbing??

General theory
--------------

The procedure is always the same: find unit tangent and unit normal,
calculate components.

The book has a discussion of various formulas, deductions using
curvature, the product rule, etc.

The upshot: given a path $\mathbf{r}(t)$ with unit tangent $\mathbf{T}(t)$ and unit normal $\mathbf{N}(t)$, we can write the acceleration
$\mathbf{a}=a_T\mathbf{T}+a_N\mathbf{N}$ where

$$a_T=\frac{\mathbf{r}'(t)\cdot\mathbf{r}''(t)}{|\mathbf{r}'(t)|}\qquad\quad a_N=\frac{|\mathbf{r}'(t)\times\mathbf{r}''(t)|}{|\mathbf{r}'(t)|}$$

Do one: the electron/rubber blob $$\mathbf{f}(t)=\langle
\cos(t)(2-\cos(4t)),\sin(t)(2-\cos(4t)),\sin(4t)\rangle$$


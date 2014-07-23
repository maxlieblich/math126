Vectors: geometry
=================

Flaky definition
----------------

A vector is an object with two properties: direction and magnitude. For
example,

-   Displacement from a fixed point
-   Velocity
-   Acceleration
-   Force applied by angry customer

Special vector: $\mathbf 0$
------------------------------

There is one special vector: the $0$ vector, written $\mathbf 0$.

The vector $\mathbf 0$ has magnitude $0$ and "any" direction.

Example: the trivial displacement (go nowhere!).

Graphical representation
------------------------

Draw an arrow:

Graphical representation
------------------------

Important (yet confusing): two vectors are equivalent if they have the
same direction and magnitude. These are all equivalent:

Quick check
-----------

Which vectors are equivalent to others in this picture? (Number them 1
through 5 from left to right. For simplicity, they live in a plane.)

Graphical representation
------------------------

Thus, we will always represent vectors as arrows starting at the origin
$(0,0,0)$.

Cheerleading
------------

Does a vector have a position?

I can't hear you!

What does it have?

A vector only has

### DIRECTION {.red}

### MAGNITUDE {.red}

The magic of vectors
--------------------

### Vectors can be added and scaled.

The magic of vectors
--------------------

### Adding vectors graphically with the triangle rule

Draw the two vectors to be added using our representation that positions
the start at the origin.

The magic of vectors
--------------------

### Adding vectors graphically with the triangle rule

Translate the second one so that it starts at the end of the first one.

The magic of vectors
--------------------

### Adding vectors graphically with the triangle rule

Connect the start of the first with the end of the translated second. We
end up with purple as red plus blue

The magic of vectors
--------------------

### Check yourself before you wreck yourself

What is the sum of the displacement vector connecting points $p_1$
and $p_2$ and the displacement vector connecting points $p_2$ and
$p_3$?

Fun {.question}
---

-   Let $A,B,C,D$ be the vertices of a square. Choose a specific
    example if you want. Compute the sum of vectors
    $$\vec{AB}+\vec{BC}+\vec{CD}+\vec{DA}.$$
-   Let $A_1,A_2,A_3,A_4,A_5,A_6$ be points. Compute the sum
    $$\vec{A_1A_2}+\vec{A_2A_3}+\vec{A_3A_4}+\vec{A_4A_5}+\vec{A_5A_6}+\vec{A_6A_1}.$$

 {#comingNext}

Vectors: components
===================

Numbers breed vectors
---------------------

### We can also describe vectors using numbers.

The vector connecting $A=(0,0,0)$ to $B=(a,b,c)$ is written as

$$\mathbf{v}=\langle a, b, c\rangle$$

This uses the standard representation of vectors from before: force them
to start at $(0,0,0)$.

The length of $\mathbf v=\langle a, b, c\rangle$ is

$$|\mathbf v| = \sqrt{a^2+b^2+c^2}$$

Numbers breed vectors
---------------------

### Any vector is made of three coordinates like that:

Using this notation, the vector connecting the point $A=(a,b,c)$ to
the point $B=(a',b',c')$

$$\vec{AB}=\langle a'-a,b'-b,c'-c\rangle.$$

Note: you must always subtract the coordinates in the same order!

Brain massage {.question}
-------------

-   Calculate the length of the vector connecting the point $(0,2,4)$
    to the point $(1,-1,1)$.
-   Consider the vectors $\langle 1,0,0\rangle$ and $\langle
    0,1,0\rangle$. Find $a,b,c$ such that $$\langle
    1,0,0\rangle+\langle 0,1,0\rangle=\langle a,b,c\rangle.$$ Try
    this for another pair of vectors if you finish early. Rinse and
    repeat.

Numbers breed vectors
---------------------

### Addition and scaling using numbers:

$$\langle a,b,c\rangle +\langle a',b',c'\rangle=\langle a+a',
b+b', c+c'\rangle$$

$$\langle 0,3,4\rangle+\langle 1,-1,0\rangle=\langle
1,2,4\rangle$$

* * * * *

$$\gamma\langle a,b,c\rangle=\langle\gamma a,\gamma b,\gamma
c\rangle$$

$$3\langle 1,1,2\rangle=\langle 3,3,6\rangle$$

Use it or lose it {.question}
-----------------

-   Do the points

    $$(1,2,3), (2,3,4),(37, 38, 40)$$

    lie on a single line in $\mathbf R^3$?

-   Find the line containing the largest number of the following points

    $$(1,0,1), (0,2,0), (1,2,3), (2,2,4), (3,2,5).$$

### Criterion {.purple}

-   Two non-zero vectors $\mathbf v$ and $\mathbf w$ have the same
    or opposite direction if $$\mathbf v=c\mathbf w$$ for some
    non-zero number $c$.
-   Why is this true?
-   Does this help with the problem?


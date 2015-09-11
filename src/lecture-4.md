Cross products
==============

Today we'll learn about the other way to combine vectors: the cross product. The cross product eats two vectors and returns a **vector**, unlike the dot product, which returns a scalar (number).

### Warm up

**Question:** two vectors span a parallelogram.

-   What is the area of the parallelogram?
-   What is a unit vector perpendicular to the parallelogram?

![](media/lecture4_pic1.png)


**Example:** how about the parallelogram spanned by the two vectors
$\langle 4,0\rangle$ and $\langle 3,4\rangle$ in the
$xy$-plane?

Here's picture:

![](media/lecture4_pic1.png)

We can slice and dice to get a rectangle:

![](media/lecture4_pic2.png)


We know how to compute this area: length times height. The area is thus $4\cdot 4=16$.

How can we generalize this?

**Fun exercise**: use the dot product and projections to do this in general. Do it.

### Enter the cross product

While you can use the dot product to solve this problem (do the fun exercise above!), there is a way to make a *single vector* encoding *both*
the perpendicular direction and area of the parallelogram.

Secret sauce: the cross product

#### Definition

The cross product of two vectors

$$\mathbf{a}=\langle a_1,a_2,a_3\rangle\textrm{, }\mathbf{b}=\langle b_1,b_2,b_3\rangle$$

is the vector

$$ \mathbf{a}\times\mathbf{b}= \langle a_2b_3-a_3b_2,
a_3b_1-a_1b_3, a_1b_2-a_2b_1\rangle. $$

**Note**: unlike the dot product, this *is* a vector!

### Computing with a determinant

This is a slight abuse of notation, but we have

$$\mathbf{a}\times\mathbf{b}=\left|\begin{array}{ccc} \mathbf{i} &
\mathbf{j} & \mathbf{k}\\ a_1 & a_2 & a_3\\ b_1 & b_2 &
b_3\end{array}\right|$$

Read about this in a textbook or the internet. Let's briefly review the formula.

$$ \begin{align} \mathbf{a} \times\mathbf{b}&=\left|\begin{array}{ccc} \mathbf{i} & \mathbf{j} & \mathbf{k}\\
a_1 & a_2 & a_3\\ b_1 & b_2 &
b_3\end{array}\right|\\&\\&=\mathbf{i}\left|\begin{array}{cc}a_2 & a_3\\ b_2 &
b_3\end{array}\right|- \mathbf{j}\left|\begin{array}{cc}a_1 &
a_3\\ b_1 & b_3\end{array}\right|+ \mathbf{k}\left|\begin{array}{cc}a_1 & a_2\\ b_1 &
b_2\end{array}\right|\\ &=\mathbf{i}(a_2b_3-a_3b_2)-\mathbf{j}(a_1b_3-a_3b_1)\\ &\quad\quad\quad+\mathbf{k}(a_1b_2-a_2b_1) \end{align}$$

#### An example

$$\begin{align} \langle 1,1,0\rangle\times&\langle
0,1,1\rangle\\ =&\left|\begin{array}{ccc} \mathbf{i} & \mathbf{j} &
\mathbf{k}\\ 1 & 1 & 0\\ 0 & 1 & 1\end{array}\right|\\
=&\mathbf{i}\left|\begin{array}{cc}1 & 0\\ 1 &
1\end{array}\right|- \mathbf{j}\left|\begin{array}{cc}1 & 0\\ 0 &
1\end{array}\right|+ \mathbf{k}\left|\begin{array}{cc}1 & 1\\ 0 &
1\end{array}\right|\\ =&\mathbf{i}-\mathbf{j}+\mathbf{k}=\langle
1,-1,1\rangle\\ \end{align}$$

### Brain squeeze

Compute these cross products and draw the resulting vectors:

-   $\langle 1,2,3\rangle\times\langle 3,6,9\rangle$
-   $\mathbf{i}\times\mathbf{i}$
-   $\mathbf{i}\times\mathbf{j}$
-   $\mathbf{j}\times\mathbf{i}$
-   $\mathbf{j}\times \mathbf{k}$
-   $\mathbf{k}\times \mathbf{i}$

## Geometry

Just as saw with the dot product, in addition to the simple formula for computing the cross product (that we just saw) there is a compact related formula that helps us understand the geometry associated to the cross product.

### Sweet Sweet Theorem for $\times$

Given two vectors $\mathbf{a}$ and $\mathbf{b}$ with angle
$\theta$

-   the vector $\mathbf{a}\times\mathbf{b}$ is $\perp$ to both
    $\mathbf{a}$ and $\mathbf{b}$;
-   the list $\mathbf{a},\mathbf{b},\mathbf{a}\times\mathbf{b}$
    satisfies the right-hand rule;
-   we have $|\mathbf{a}\times\mathbf{b}|=|\mathbf{a}||\mathbf{b}|\sin(\theta)$;
-   $|\mathbf{a}\times\mathbf{b}|$ equals the area of the
    parallelogram spanned by $\mathbf{a}$ and $\mathbf{b}$.

This formula ties the cross product to *area* and *orientation*. The magnitude of the cross product computes an area, and the direction encodes the path you walk around the parallelogram by the order you've chosen when you write down the cross product.

### Do one

Find the area of the parallelogram spanned by $\langle 4,0,0\rangle$ and $\langle 3,4,0\rangle$

Compute the cross product!

-   Can you predict the direction of the cross product vector without
    calculating anything?
-   Can you predict the magnitude of the cross product without
    calculating anything?

Here it is:

$\langle 4,0,0\rangle\times\langle 3,4,0\rangle=\langle
0,0,16\rangle$

Phew!

Hmmm.... Maybe drawing a picture of this (the parallelogram and the
cross product) would help you cement this in your mind.

### Exploratory probe

Suppose you model a surface with a computer: you can't do continuous or
smooth things, so the surface is modeled as having a ton of faces (like
the facets of a demonic gem). These faces might be described with
coordinates in $\mathbf{R}^3$. How can you find the normal vector to
one of the faces?

How many ways are there to make a normal vector? Is it unique? Can you
use them to distinguish "inside" from "outside"?

Use the internet to find out if these things come up outside of math
class!

### Videos
[Video chunk 4-1](http://www.math.washington.edu/~lieblich/Math126/video/4-1.mp4)
[Video chunk 4-2](http://www.math.washington.edu/~lieblich/Math126/video/4-2.mp4)

### Content Contributors
@maxlieblich

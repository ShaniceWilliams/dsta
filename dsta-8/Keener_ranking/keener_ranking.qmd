---
lang: en
author: DSTA
title: "Keener's method"
---

<!-- -------------------- -->
# Summary of previous methods

## Summary of Massey

![Massey's method](./imgs/massey-3.png) ![Massey's method](./imgs/massey-4.png)

Ratings are the solution $\mathbf{r}$ of $\overline{M}\mathbf{r} = \mathbf{p}$

. . .

__The data that drives ratings is point difference.__

<!-- ------------------------- -->
# Keener's method

## Stipulations, 1

One's *strength* should be measured relatively to their opponents', i.e., team *i* might be strong against team *j* but weak against *k* and so on:

$s_i = \sum_{j=1}^{m} s_{ij}$

where $s_{ii} = 0$ (you cannot beat yourself)

## Stipulations, 2

For each season, *rating* will be a quantity set to 1 for each league:

$\sum_{i=1}^{m} r_{i}=1$

So, rating can be easily represented by a pie chart. One's rating improvement can only come as others' worsens.

Later, ratings will determine rankings and winning probabilities.

## Stipulations, 3

K. believes that strengh and rating should be connected by a scaling factor $\lambda$, the same for each team in the league:

$s_i = \lambda r_i$

. . .

So, in vector notation:

$\mathbf{s} = \lambda \mathbf{r}$

At the moment we know neither of the three... let's start with strenght.

## The input data

K. does not commit to a specific way to gauge strength:

$a_{ij}$ = the statistic produced by team $i$ when playing $j$

Whatever the stats please let $a_{ij}$ be strictly non-negative.

## Example Stat A

Consider wins/ties:

$$a_{ij} = W_{ij} + \frac{T_{ij}}{2}$$

## Example Stat B

Points scored against:

$a_{ij} = S_{ij}$

Points is considered a *crude* measure of strength.

Avoid high-scoring matches to have a disproportionate effect by means of relative scoring:

$$a_{ij} = \frac{S_{ij}}{S_{ij} + S_{ji}}
$$

## Laplace correction

$$a_{ij} = \frac{S_{ij} + 1}{S_{ij} + S_{ji} + 2}
$$

. . .

if $S_{ij} \approx S_{ji}$ and both are large then $a_{ij} \approx \frac{1}{2}$ (Good or bad?)

## Skewing

- slow down long-term convergence to $\frac{1}{2}$  

- sterilise the effect of exteme scores

![Skew func.](./imgs/skew-example.png)

. . .

$$h(x) = \frac{1}{2} + \textrm{sgn}\{x-(1/2)\}\sqrt{|2x -1|}/2$$

additionally, $a_{ij} \leftarrow \frac{a_{ij}}{n_i}$ to balance no. of games.

## Strength is

revealed by performance but tempered by the strength of the opponent themselves.

__Relative str. of *i* when playing against *j:*__

$$s_{ij} = a_{ij}\cdot r_j$$

. . .

__Cumulative (called 'absolute') str. of team *i:*__

$$s_i = \sum_{j=1}^{m} s_{ij}$$

-----

$$
\mathbf{s} = 
\begin{pmatrix}
\sum_{j=1}^{m} s_{1j}\\
\sum_{j=1}^{m} s_{2j}\\
\vdots\\
\sum_{j=1}^{m} s_{mj}
\end{pmatrix}
$$

-----

$$
\mathbf{s} = 
\begin{pmatrix}
\sum_{j=1}^{m} s_{1j}\\
\sum_{j=1}^{m} s_{2j}\\
\vdots\\
\sum_{j=1}^{m} s_{mj}
\end{pmatrix} =
\begin{pmatrix}
a_{11} & a_{12} & \cdots & a_{1m} \\
a_{21} & a_{22} & \cdots & a_{2m} \\
\vdots & \vdots & \ddots & \vdots \\
a_{m1} & a_{m2} & \cdots & a_{mm}
\end{pmatrix} 
\begin{pmatrix}
r_{1}\\
r_{2}\\
\vdots\\
r_{m}
\end{pmatrix}
$$

-----

$$
\mathbf{s} = 
\begin{pmatrix}
\sum_{j=1}^{m} s_{1j}\\
\sum_{j=1}^{m} s_{2j}\\
\vdots\\
\sum_{j=1}^{m} s_{mj}
\end{pmatrix} =
\begin{pmatrix}
a_{11} & a_{12} & \cdots & a_{1m} \\
a_{21} & a_{22} & \cdots & a_{2m} \\
\vdots & \vdots & \ddots & \vdots \\
a_{m1} & a_{m2} & \cdots & a_{mm}
\end{pmatrix} 
\begin{pmatrix}
r_{1}\\
r_{2}\\
\vdots\\
r_{m}
\end{pmatrix} =
A \mathbf{r}
$$

. . .

So, the *strength vector* $\mathbf{s}$ that collects all cumulative strengths is $\mathbf{s} = A \mathbf{r}$
where $\mathbf{r}^T = \{r_1, \dots r_m\}$ is the rating vector.

The argument has a certain circularity...

## Finally

Since rating should be proportional to strength:

$$\mathbf{s} = \lambda \mathbf{r}$$

. . .

$$A \mathbf{r} = \lambda \mathbf{r}$$

So, rating really is an e-vector of A, and $\lambda$ an e-value.

## Observations

We would like a positive $\lambda$ 

also the values in $\mathbf{r}$ should be positive

. . .

In general, a *reasonable* solution is __not__ guaranteed:

- which eigenvalue (among up to m) to choose?

- even for positive $\lambda$s the relative e-vector could contain negative or even complex numbers!

<!-- ---------------------------------- -->
# The Perron-Frobenius theorem

## Non-negativity  

Perron-Frobenius focus on matrices that contain only non-negative values:

$A = [a_{ij}] \ge 0$

This is easily the case when $a_{ij}$ is a statistic on winning or scoring etc.

. . .

## Irreducibility  

P-F request that each pair $i,j$ is *connected:*

- simply, $a_{ij} > 0$ (i.e., teams have played before)

- or there is a non-negative path of *p* intermediate "steps" $k_1, \dots k_p$:

$$
a_{ik_1}> 0, a_{k_1 k_2}> 0, \dots a_{k_p j}> 0
$$

-----

Irreducibility corresponds to requiring that each teams has played common opponents in the past, even indirectly, e.g.:

$a_{\textrm{Burnley},\textrm{Nice}}= 0$

but since 

$$a_{\textrm{Burnley},\textrm{Arsenal}} > 0, a_{\textrm{Arsenal},\textrm{PSG}}> 0,  a_{\textrm{PSG}, \textrm{Nice}}> 0
$$

a tournament containing both Burnley and Nice is suitable. 

I. may not hold at the beginning of a tournament and must be checked, but 
it's __not prohibitive.__

## Good news

If A is non-negative and irreducible, then  

- the dominant e-value is real and strictly positive: our $\lambda!$

- except for positive multiples, there's only one non-negative e-vector $\mathbf{x}$ for A: (almost) our $\mathbf{r}!$

- the final $\mathbf{r}$ is obtained by normalizing $\mathbf{x}$: $\mathbf{r} = \mathbf{x}/\sum_j x_j$

- individual ratings $r_i$ will be in (0,1) and will sum to 1.

## Formal statement

![Perron-Frobenius](./imgs/perron-frobenius.png)

## Observations

- the conditions are strict but not impossible
  
- a strong memory effect makes Keener's ratings represent long-term tendencies  
- today, random walks/Montecarlo methods approximate Keener's rating without the need to extract e-pairs of large matrices.

- [[Keener, SIAM Review 35:1, March 1993]](https://www.jstor.org/stable/2132526) is credited with seeding the ideas behind Google's PageRank.

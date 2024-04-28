---
author: DSTA
title: "Markov Chains for Rating"
lang: en
---


## DSTA

Ch. 6 of Langville-Meyer's textbook is dedicated to Markov chains in sport prediction

We learn a new key concept of Data Science

<!-- ---------------- -->
# Notation

## A Stochastic Matrix S

describes the probab. of a *transition* of some sort between places or states etc.

$s_{ij} = Pr[\textrm{the system goes from i to j}]$

As a result:

- each $s_{ij}$ is $\leq1$

- each row sums to 1.

![S](./imgs/S.png)

-----

![S](./imgs/S.png)

## Notation of the chapter

![Notation(./imgs/notation.png)

<!-- ---------------- -->
# The Markov method

## The fairwheather fan

switches their allegiance to the winning team __of the moment.__  

If they support $i$, what is the prob. that they switch to $j$?

![S](./imgs/S.png)

How did we obtain this matrix?

-----

Input: the win-loss data:

![V](./imgs/V.png)

-----

Rows normalised to 1:

![N](./imgs/N.png)

The Miami row sums to 0: not stochastic!

-----

As with PageRank, substitue all $\mathbf{0}^T$ rows with $\frac{1}{n}\mathbf{1}^T$

![S](./imgs/S.png)

-----

Now the fairwheather fan takes a long, random walk along this *Markov graph:*

![Fair wheather fan](./imgs/61-fair_wheather_random_walk.png)

-----

We record the number of times the random walker passess each vertex.

After a while, the proportion of visits to each node stabiles.

. . .  

The vector $\mathbf{r}$ with the frequencies is a *stationary vector*

$\mathbf{r}$ corresponds to the dominant e-vector of the Markov-chain matrix!

![Losees rating](./imgs/t61-lossess_rating.png)

<!-- ------------- -->
# How to create the Base Matrix

## With Points differential

![V](./imgs/V2.png)

-----

![S](./imgs/S2.png)

-----

![Losees rating](./imgs/t62-points_differential_ratings.png)

## Winners/losers with points

![S](./imgs/S3.png)

-----

![S3](./imgs/S3.png)

-----

![Losees rating](./imgs/t63winslosses.png)

## With yardage

![Yardage](./imgs/yardage.png)

-----

![V4](./imgs/V4.png)

-----

![S4](./imgs/S4.png)

-----

![Yardage](./imgs/t65-yardage.png)

## With turnover

![S5](./imgs/S5.png)

## With possession

![S6](./imgs/S6.png)

## With linear combinations of features

$$\mathbf{S} = \alpha_1 \mathbf{S_{points}} + \alpha_2 \mathbf{S_{yard.}} + \alpha_3 \mathbf{S_{turn.}} + \alpha_4 \mathbf{S_{poss.}}$$

If weights are all non-negative and sum to 1, also $\mathbf{S}$ will be stocastic.

Weights are assigned by experts or...

could be learned by an outer ML system running on historical data.

-----

By default, let's set all 4 $\alpha$ weights to $\frac{1}{4}$:

![S7](./imgs/S7.png)

(rating compression starts manifesting)

<!-- -------------------------- -->
# Issues at the extremes

## Handling undefeated teams

![Undefeated](./imgs/undefeated-1.png)

-----

![Undefeated](./imgs/undefeated-2.png)

A random walker soon get stuck with Miami!

-----

Assign a probability to escape:

$\mathbf{\overline{S}} = \beta \mathbf{S} + \frac{(1-\beta)}{n} \mathbf{1}$ (1 everywhere)

. . .  

PageRank: $\beta = 0.85$

NFL: $\beta = 0.6$

NCAA: $\beta = 0.5$

-----

![Undefeated](./imgs/undefeated-3.png)

A better example: modeling the 'Back' button of the browser when we visit a dead-end page.

<!-- -------------- -->
# Summary of the method

## The algorithm

![Markov method](./imgs/markov-method.png)

## Comparison with Massey's

The point-differential M. chain:

![Markov identical](./imgs/f62-markov-identical.png)

-----

Massey graph for the same season

![Massey identical](./imgs/f63-massey-identical.png)

## Further applications

Let's hire fairwheater fans to do random walks:

by accumulation and stabilisation of the frequencies we will find out the dominant e-vector of $\mathbf{S}$ *without engaging in matrix operations.*

. . .

A bit of trivia:

The Mathematics genalogy project:

[Markov](https://mathgenealogy.org/id.php?id=13982) begot [Shanin](https://mathgenealogy.org/id.php?id=106671), Shanin begot [Gelfond](https://mathgenealogy.org/id.php?id=79318), Gelfond begot [me](https://mathgenealogy.org/id.php?id=74862), I begot Han and Prifti who ...

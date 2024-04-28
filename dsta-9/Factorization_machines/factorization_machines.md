---
author: DSTA
title: "Factorization Machines"
lang: en
---

<!-- --------------- -->
# Factorization Machines

## Genesis

Invented by [Steffen Rendle](https://scholar.google.com/citations?user=yR-ugIoAAAAJ), now Google Research:

* [2010 IEEE International Conference on Data Mining](https://www.csie.ntu.edu.tw/~b97053/paper/Rendle2010FM.pdf)

* [ACM Transactions on Intelligent Systems and Technology (TIST) 3 (3), 57](https://dl.acm.org/citation.cfm?id=2168771)

## Problem statement

__Instance:__ 

* a collection (dataset) $\mathbf{D}$ of $m$ numerical datapoints (points in $\mathbb{R}^n$)

* a classification system $C = \{c_1, c_2, \dots c_k\}$

. . .

__Solution:__  classification function $\gamma: \mathbf{X} \rightarrow C$

__Measure:__ misclassification

. . .

[PF] "classification predicts whether something will happen, whereas regr. predicts how much something will happen."

## Supervised version

![Activity Matrix](./imgs/fm-dataset-example.png)

. . .

Estimate the rating for the *new* user/film combination $\mathbf{x_i}$  

. . .

We face *sparsity.*

-----

$\mathbf{D}= \{(\mathbf{x}^{(1)}, y^{(1)}), (\mathbf{x}^{(2)}, y^{(2)}), \dots \}$

Find rating estimate function  $Y: \mathbb{R}^n \rightarrow T$ s.t.

. . .

* $T=\mathbb{R}$ for regression,  

* $T=\{+, -\}$ for classification.

$\mathbf{\hat{D}}= \{(\mathbf{x}^{(m+1)}, Y(y^{(m+1)}), (\mathbf{x}^{(m+2)}, Y(y^{(m+2)}), \dots \}$

Note: Rendle uses different letters; here *n=dimensions($\mathbf{D}$)*)

## Alt. scenario: constraints

$\mathbf{D}= \{\mathbf{x}^{(a)}, \mathbf{x}^{(b)}\dots \}$

re-arrange the row s.t. $\mathbf{x}^{(a)}$ *maps* higher than $\mathbf{x}^{(b)}$ and so on.

Ideal for Top-k searchs and recommendations

<!-- ---------------- -->
# The Model

## Intuition

extend linear regression to capture synergetic effects between variables:

introduce a minimal quadratic effect  $x_i x_j$

-----

fill the table by looking at values on the same row or column of the target cell

## General estimation

$$\hat{y}(\mathbf{x}) := w_0 + \sum_{i=1}^{n} w_i x_i
$$

an initial (fixed) bias + linear regression.

-----

To look at quadratic interactions, fix $d=2:$

$$\hat{y}(\mathbf{x}) := w_0 + \sum_{i=1}^{n} w_i x_i + \sum_{i=1}^{n}\sum_{j=i+1}^{n} w_{ij}x_i x_j
$$

. . .

* lots of training to find out all $n^2$ coefficients $w_{ij}$

* the w's may not even be significant (too close to 0)

* computing even a single prediction costs $\Theta(n^2)$

<!-- ---------------------- -->
# A simpler model

## In practice

1. fix d=2 and a small integer k (e.g., \# of *genres*)

2. build a model of how the $n$ dimensions relate to the $k$ *genres:* a $V_{n\times k}$ matrix

. . .

$$W =  V \cdot V^T \ \Rightarrow
w_{ij} = \mathbf{v}^T_i\cdot \mathbf{v}_j = <\mathbf{v}_i, \mathbf{v}_j>
$$

__Key point:__ $W$ contains $\frac{n^2}{2}$ estimates; $V$ only has $n\cdot k$.

-----

$$\hat{y}(\mathbf{x}) := w_0 + \sum_{i=1}^{n} w_i x_i + \sum_{i=1}^{n}\sum_{j=i+1}^{n} <\mathbf{v}_i, \mathbf{v}_j>x_i x_j
$$

Where the inner/dot product is

$$
<\mathbf{v}_i, \mathbf{v}_j> = \mathbf{v}^T_i\cdot \mathbf{v}_j = \sum_{f=1}^{k} v_{if} v_{jf}
$$

## [Rendle, 2010]

$\hat{w}_{i,j} := <\mathbf{v}_i, \mathbf{v}_j>$ *models the interaction between the i-th and j-th variable.*  

*Instead of using an own model parameter $w_{i,j}\in \mathbb{R}$ for each interaction, the FM models the interaction by factorizing it.*  

*We will see later on, that this is the key point which allows high quality parameter
estimates of higher-order interactions ($d \ge 2$) under
sparsity.*

<!-- ------------------- -->
# Computational costs

## Th: cost is linear in *n*

$$\hat{y}(\mathbf{x}) := w_0 + \sum_{i=1}^{n} w_i x_i + \sum_{i=1}^{n}\sum_{j=i+1}^{n} <\mathbf{v}_i, \mathbf{v}_j>x_i x_j
$$

where

$$
<\mathbf{v}_i, \mathbf{v}_j> = \mathbf{v}^T_i\cdot \mathbf{v}_j = \sum_{f=1}^{k} v_{if} v_{jf}
$$

-----

How can this be computed in $\Theta(kn)=\Theta(n)$ iteration?

$$\sum_{i=1}^{n}\sum_{j=i+1}^{n} <\mathbf{v}_i, \mathbf{v}_j>x_i x_j$$

. . .

Insight: $i$ and $j$ never appear *together:* their iteration can be separated.

. . .

Idea: iterate over $k$ outside, push $i$ and $j$ iterations inside.

<!-- ------------ -->
# Implementations

## The LibFM source

[libfm.org](http://libfm.org/) is the repository for the 'official' C++ implementation of FMs, which ended in 2014.  

## FMs in Python  

[PyFM](https://pythonawesome.com/factorization-machines-in-python/)

provides a new environment for running FMs within Python.

```bash
pip install git+https://github.com/coreylynch/pyFM
```

. . .

```python
# Build and train a Factorization Machine
myfm = pylibfm.FM(num_factors=10,
                  num_iter=100,
                  task="regression",
                  ...)

myfm.fit(X_train,y_train)
...
```

## 1-Hot econding

```python
from pyfm import pylibfm
from sklearn.feature_extraction import DictVectorizer
import numpy as np

train = [
    {"user": "1", "item": "5", "age": 19},
    {"user": "2", "item": "43", "age": 33},
    ...
]
```

four users, four items: 8 columns

. . .

```python
v = DictVectorizer()
X = v.fit_transform(train)
print(X.toarray())
[[ 19.   0.   0.   0.   1.   1.   0.   0.   0.]
 [ 33.   0.   0.   1.   0.   0.   1.   0.   0.]
 ...
]
```

-----

What is the estimated appreciation of user 1, aged 24 now, for item 10 once he or she buys it?

```python
y = np.repeat(1.0, X.shape[0])

fm = pylibfm.FM()

fm.fit(X, y)

fm.predict(v.transform({"user": "1", "item": "10", "age": 24}))
```

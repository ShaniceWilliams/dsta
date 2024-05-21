---
title: "Classification: the Iris dataset"
lang: en
author: DSTA 
format:
  revealjs: 
    theme: solarized
    css: ../../styles/dsta_slides.css
    slide-number: true
    slide-level: 2
    # title-slide-attributes:
      # data-background-image: ../../styles/bbk-logo.svg
    code-fold: false
    echo: true
    # smaller: true
    scrollable: true
  html:
    toc: true
    code-fold: false
    anchor-sections: true
    other-links:
      - text: Class page
        href: https://ale66.github.io/dsta/
jupyter: python3
---

# Flower Classification and the Birth of Data Science

## Classifying iris flowers

[[Fisher, 1936]](https://onlinelibrary.wiley.com/doi/abs/10.1111/j.1469-1809.1936.tb02137.x)

Can flower samples be assigned to their proper sub-family purely on the basis of quantitative observation?

* Linear discriminant classification

* high-quality, annotated dataset

technique and data are interwined!

-----

2. (was 1) Classification and class probability

-----

**Instance:**

* n datapoints, each having over d-1 numerical dimensions $\mathcal{D_1,} \dots \mathcal{D_{d-1}}$

* an expert classification function over k categories

. . .

**Solution:**

a linear combination $\mathcal{D_1} \times \mathcal{D_2} \times \dots \mathcal{D_{d-1}}\rightarrow \mathcal{D_d}$

that __respects__ the given classification.

. . .

**Measure:** *agreement* with the given classification.

## The Iris dataset

n=150 samples manually assigned by Fisher.

d=5 dimensions, four measurements (in cm) and the classification

k=3 classes: Setosa, Versicolour and Virginica, 50 instances each, all available from [scikit-learn](https://scikit-learn.org/stable/auto_examples/datasets/plot_iris_dataset.html)

```bash
pip install scikit-learn
```

```python
from sklearn import datasets

iris = datasets.load_iris()

print(iris['data'])

print(iris['target'])
```

## Frequency histogram

![](./imgs/iris-freqency-histograms.png)

-----

A linear classifier corresponds to to a line drawn on the data display which creates two classification areas; more than one line is possible.

Whereas Setosa can be linearly separated, e.g., *petal_lenght <2* in the third column, the other two classes can't be perfectly separated.

## Quantify agreement?

**Q:** Can we accept a linear combination that gives the correct answer only 19 times over 20?

**A:** It depends on the application.

-----

Given two putative classifiers, which is the best?

. . .

Proposed answer:

At the same level of *precision,* (fraction of cases for which the classifier agrees with the expert classification)

prefer the one that *errs* less on the clear-cut cases.

## Idea: Subset selection

ignore the less informative dimensions

## Idea: dimension reduction

Take a 2D scatterplot and map it to a line: does it improve visual classification?

![](./imgs/projecting_2_to_1.png)

## Idea: shrinkage

find a predictor where all predictors are used, but some are given less weight.

## Study plan

This section, with the follow-up lab experience, is self-contained.

If you want more background you may read the PDF excerpt from the advanced [Zaki-Meira textbook](https://dataminingbook.info/), which is available for download.

## The birth of the new science of data

Fisher did not practice Statistics per se as he didn't try to estimate the distribution of tiny flowers in Canada, nor did he estimate measurement errors.

Rather, he asked whether classification could become somehow __automatic__, without the need to actually *see* the flower.

![](./imgs/miles_davies_birth_of_the_cool.png)

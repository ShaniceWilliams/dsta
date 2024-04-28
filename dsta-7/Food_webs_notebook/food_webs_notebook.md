---
author: AH 
title: "Food Webs Notebook"
lang: en
---


# Data Science and Complex Networks

## Basic concepts

---

## Outline

- notebooks are an advanced mechanism for software distribution and integration

- they execute inside the default container of web browsers

- we are isolated from the python implementation (away from the actual execution)

---

- The Jupyther `.ipynb` format is standard
  
- Markdown cells are used for comments and explanations

- to run the cells, J. requires a callable Python __kernel__ 

- a notbook is a JSON file, with JavaScript execution

```js
  "cell_type" : "code",
  "execution_count": 1, # integer or null
  "metadata" : {
      "collapsed" : True, # whether the output of the cell is collapsed
      "autoscroll": False, # any of true, false or "auto"
  },
  "source" : ["your code goes here"],
  "outputs": [{
      # list of output dicts (described below)
      "output_type": "stream",
      ...
  }],
  }
```

---

### Jupiter Notebooks

Detailed installation instructions are at the [Jupyter project website](https://jupyter.org/install)

Installation is similar to a Python module but it runs stand-alone and interacts via browser

It requires a Python 'core' to run in the background, similar to VS Code (but less coding support)

### Online Jupyter Notebooks

All notebooks are also available online on Google Colab

A Google account is required

---

### Jupyter to learn Network analysis

- start the Jupyter Notebook server, e.g.,

```bash
pip install jupyter

jupyter notebook
```

Python 3 notebooks are available from this module repo

Original Python 2 notebooks are available at the [textbook repo](github.com/datascienceandcomplexnetworks/book_code)

---

### Jupyter to learn Network analysis, II

Currently VS Code supports Jupyter with a [dedicated extension](https://marketplace.visualstudio.com/items?itemName=ms-toolsai.jupyter)

Also, a cell block in a plain Python files can be split up into cells that can be run separately, Jupyuter-style.

Use ``# %%`` at the beginning of a line to delimit cells; the cell buttons will appear.

Conventional top-to-bottom execution is preserved.

---

## Plan for the lab

- study the "Food web" notebook associated to Chapter 1 of Caldarelli-Chessa's textbook.

- append your code in the cell below the "Q" questions.

- test 'what if' questions by changing the code cells: double-click on the cell opens it up for editing.

- a solution is available, but please read it only after you have tried to solve the problem.

- We will repeat the experience next week with C-C's Trade Networks notebook.

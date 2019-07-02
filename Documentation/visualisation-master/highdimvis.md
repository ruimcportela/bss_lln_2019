---
title: 'Visualisation of high-dimensional data'
author: "Laurent Gatto"
output:
  rmdshower::shower_presentation:
    theme: material
    self_contained: true
    ratio: 16x10
---

## Visualisation of high-dimensional data 

```
Laurent Gatto                      Computational Biology
https://lgatto.github.io           de Duve Institute, UCLouvain
laurent.gatto@uclouvain.be         @lgatt0
```
Slides: http://bit.ly/highdimvis  
Source: https://github.com/lgatto/visualisation  

![CC-BY](./figs/cc1.jpg)





## Introduction 

* Unsupervised machine learning (clustering): make use of the data to
  identify patterns of interest. 
* Supervised machine learning (classification and regression): use
  prior knowledge (such as known labels about a subset of the data) to
  infer new information (labels) for the unlabelled or new data.

## From data



|          | Sample 1 | Sample 2 | Sample 3 | ... | group |
|:---------|:--------:|:--------:|:--------:|:---:|:-----:|
|Protein 1 |   8.12   |   7.54   |  14.54   | ... |   A   |
|Protein 2 |  10.55   |  11.46   |  11.17   | ... |       |
|Protein 3 |   7.49   |  12.21   |   8.14   | ... |   B   |
|Protein 4 |  14.79   |  11.73   |   3.36   | ... |   A   |
|...       |  10.99   |   9.08   |  13.37   | ... |       |

## To visualisation, annotation and results

![plot of chunk introvis](figure/introvis-1.png)

## Content

* Data 
* Hierarchical clustering
* Dimentionality reduction: PCA
* Dimentionality reduction: t-SNE


## Proteomics examples

Sample-level visualisations using data from
[Mulvey *et al.* (2015)](https://www.ncbi.nlm.nih.gov/pubmed/26059426)
*Dynamic Proteomic Profiling of Extra-Embryonic Endoderm
Differentiation in Mouse Embryonic Stem Cells.*

Protein-level visualisations using data from
[Christoforou *et al.* (2016)](https://www.ncbi.nlm.nih.gov/pubmed/26754106)
*A draft map of the mouse pluripotent stem cell spatial proteome.*

## Hierarchical clustering

Hierarchical clustering methods start by calculating all pairwise
distances between all features (or samples) and then clusters/groups
these based on these similarities. There are various distances
measures and clustering algorithms that can be used.

Plots prepared with `dist` and `hclust` from the `stats` package and
`mrkHClust` from
[`pRoloc`](https://bioconductor.org/packages/devel/bioc/html/pRoloc.html).

## {.fullpage}

![plot of chunk hclust](figure/hclust-1.png)

## Dimensionality reduction

When the data span over many dimensions (more than 2 or 3, up to
thousands), it becomes impossible to easily visualise it in its
entirety. *Dimensionality reduction* techniques such as **PCA** or
**t-SNE** will transform the data into a new space that summarise
properties of the whole data set along a reduced number of
dimensions. These are then used to visualise the data along these
informative dimensions or perform calculations more efficiently.


## Principal Component Analysis

Principal Component Analysis (PCA) is a technique that transforms the
original n-dimentional data into a new data space. Along these new
dimensions, called principal components, the data expresses most of
its variability along the first PC, then second, .... These new
dimensions are *linear combinations* of the orignal data.

Figures produces with `plot2D` function from the
[`pRoloc`](https://bioconductor.org/packages/devel/bioc/html/pRoloc.html)
package.

## {.fullpage}

![plot of chunk pcaex](figure/pcaex-1.png)

## { .fullpage }

![plot of chunk pcaprot](figure/pcaprot-1.png)


## t-Distributed Stochastic Neighbour Embedding

t-Distributed Stochastic Neighbour Embedding (t-SNE) is a *non-linear*
dimensionality reduction techique, i.e. that different regions of the
data space will be subjected to different transformations. t-SNE will
compress small distances, thus bringing close neighbours together, and
will ignore large distances.

Figures produces with `plot2D` function from the
[`pRoloc`](https://bioconductor.org/packages/devel/bioc/html/pRoloc.html)
package.

## { .fullpage }

![plot of chunk tsneex](figure/tsneex-1.png)


## Parameter tuning

t-SNE (as well as many other methods, in particular classification
algorithms) has two important parameters that can substantially
influence the clustering of the data

- **Perplexity**: balances global and local aspects of the data.
- **Iterations**: number of iterations before the clustering is
  stopped.

It is important to adapt these for different data.

## { .fullpage }




![plot of chunk tsnesplots](figure/tsnesplots-1.png)

## License

This material is made available under the
[Creative Commons Attribution license](https://creativecommons.org/licenses/by/4.0/).

You are free to **share** - copy and redistribute the material in any
medium or format, and **adapt** - remix, transform, and build upon the
material for any purpose, even commercially it.
**Attribution** You must give appropriate credit, provide a link to
the license, and indicate if changes were made. You may do so in any
reasonable manner, but not in any way that suggests the licensor
endorses you or your use.


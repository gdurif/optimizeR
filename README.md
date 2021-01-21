# OptimizeR

**A non exhaustive tour of optimization-related tools for machine learning and statistics in R**

January 22nd, 2021, "State of the R" workshop (https://stateofther.github.io/)

## Contact

Ghislain Durif (https://gdurif.perso.math.cnrs.fr/)

## Abstract

The workshop will be divided into two parts. Here https://github.com/gdurif/optimizeR you can find the materials and preliminary requirements (will be updated soon). Both parts will include a presentation and programming tutorials.

The first part will focus on efficiently solving standard statistics or machine learning related optimization problems in R. We will talk about several R packages, in particular the following estimation and benchmark libraries:

- `SPAMS` (SPArse Modeling Software, http://spams-devel.gforge.inria.fr), an optimization toolbox that was developed to solve various sparse estimation problems, such as dictionary learning and matrix factorization (NMF, sparse PCA, ...), but also sparse decomposition problems with LARS, coordinate descent, OMP, SOMP, proximal methods, and structured sparse decomposition problems (l1/l2, l1/linf, sparse group lasso, tree-structured regularization, structured sparsity with overlapping groups,...).

- `BenchOpt` (https://benchopt.github.io/), a package to simplify, to make more transparent and more reproducible the comparisons of optimization algorithms. It is written in Python but it is available with many programming languages. So far it has been tested with Python, R, Julia and compiled binaries written in C/C++ available via a terminal command. `BenchOpt` is used through a command line tools and you can easily add your own solvers. Ultimately the purpose is to be able to run and replicate an optimization benchmark in the most simple and fair way when designing and programming algorithms as well as when reviewing existing methods.

During the second part, we will focus on `KeOps` (https://www.kernel-operations.io), a library to run seamless Kernel Operations on GPU (but not only), with possible auto-differentiation and without memory overflows. It provides routines to compute generic reductions of large 2d arrays whose entries are given by a mathematical formula. Using a C++/CUDA-based implementation with GPU support, it combines a tiled reduction scheme with an automatic differentiation engine. Relying on online map-reduce schemes, it is perfectly suited to the scalable computation of kernel dot products and the associated gradients, even when the full kernel matrix does not fit into the GPU memory.

`KeOps` is all about breaking through this memory bottleneck and making GPU power available for seamless standard mathematical routine computations. As of mid-2020, this effort has been mostly restricted to the operations needed to implement Convolutional Neural Networks: linear algebra routines and convolutions on grids, images and volumes. KeOps provides GPU support without the cost of developing a specific CUDA implementation of your custom mathematical operators.

To ensure its verstility, KeOps can be used through Matlab, Python (NumPy or PyTorch) and R backends (package RKeOps available on CRAN).

## Get the materials

```bash
git clone https://github.com/gdurif/optimizeR
```

Presentation and tutorial related files can be found in the corresponding sub-directories for each library, namely

- [`./benchopt`](./benchopt) for `BenchOpt`
- [`./keops`](./keops) for `KeOps`
- [`./spams`](./spams) for `SPAMS`

## Requirements for the presentation visualization

To visualize the presentation and the tutorial supports, you need the following `R` packages:
- `ggplot2`
- `knitr`
- `rmarkdown`
- `binb`

You can install these dependencies with the following `R` commands:
```R
pkg_list <- c("ggplot2", "knitr", "rmarkdown", "binb")
install.packages(pkg_list)
```

## Requirements for the tutorials

Please check the `requirements.md` files in each sub-directory (respectively [here](./benchopt/requirements.md) for `BenchOpt`, [here](./keops/requirements.md) for `KeOps` and [here](./spams/requirements.md) for `SPAMS`) for the installation requirements to use each library.

Please see this [file](./setup_R_environment.md) if you prefer to **avoid messing with your R environment** when installing the packages required for the tutorials.

> **Note concerning the OS**: all codes and commands presented in this repository are specific to a Linux environment (and have only been tested on such system). Most of them should work in a MacOS environment. However, if you are using Windows, it is recommended to use the Windows Subsystem for Linux (WSL, see [here](https://docs.microsoft.com/fr-fr/windows/wsl/about)) or an Unix emulator such as Cygwin (see [here](https://www.cygwin.com/)). In addition, most of the libraries presented here are not available for Windows at the moment.

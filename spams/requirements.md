# Requirements to use `SPAMS` in R

Please see this [file](../setup_R_environment.md) if you prefer to **avoid messing with your R environment** when installing the packages required for the tutorials.

> **Note concerning the OS**: all codes and commands presented here are specific to a Linux environment (and have only been tested on such system). Most of them should work in a MacOS environment.


## Requirements

* an implementation of BLAS and LAPACK to perform linear algebra operations

`R` is automatically configured at installation to use the system libraries implementing BLAS and LAPACK (or its own implementation if not available on the system), you can check which version you are using with:
```R
sessionInfo()
```
(section "Matrix products: default" in the output)

You should **not be concerned** with this dependency, except if:
- it is missing on your system (c.f. `sessionInfo()`)
- you are concerned with computation performance on large datasets.

To change the BLAS and LAPACK libraries used by `R`, you should first install the _linear algebra operations_ libraries that you want to use (e.g. OpenBlas, Atlas, MKL) and then completely re-install `R`.

> **Note**: the Intel Math Kernel Library (MKL) is recommended to get the best performance with SPAMS and is available with the Anaconda Python distribution (See [here](https://docs.anaconda.com/anaconda/install/) and [here](https://docs.anaconda.com/mkl-optimizations/)). `R` can be installed within Anaconda (see [here](https://docs.anaconda.com/anaconda/user-guide/tasks/using-r-language/)).

**Disclaimer**: SPAMS (including the SPAMS R package) is not functional on Windows, it was only tested on Linux and MacOS.

---

## Installation from source

> **Note**: SPAMS is **not** available on CRAN

1. You need to download the latest version of the source package (i.e. `spams-R-v2.6-2017-03-22.tar.gz`) from the official website [here](http://spams-devel.gforge.inria.fr/downloads.html).

2. You need to extract its contents (it will produce a directory named `spams-R` and containing the package source):
```bash
tar -zxvf spams-R-v2.6-2017-03-22.tar.gz
```

3. You need to install the package source from the directory `spams-R/spams`.

   - You can use the `devtools` package from R (edit the path):
```R
devtools::install("path/to/spams-R/spams", args = "--html")
```

   - You can install also install it from a shell command line (edit the path):
```bash
R CMD INSTALL --html path/to/spams-R/spams
```

> **Note**: you may see numerous warnings during the source compilation process, but they should be harmless to use SPAMS.

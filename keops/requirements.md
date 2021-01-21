# Requirements to use `KeOps` in R

Please see this [file](../setup_R_environment.md) if you prefer to **avoid messing with your R environment** when installing the packages required for the tutorials.

> **Note concerning the OS**: all codes and commands presented here are specific to a Linux environment (and have only been tested on such system). Most of them should work in a MacOS environment.

## Requirements

* R (tested with R >= 3.5)
* Cmake (>=3.10)
* C++ compiler (g++ >=7 or clang) for CPU computing or CUDA compiler (nvcc >=10) and CUDA libs for GPU computing

**Disclaimer**: KeOps (including RKeOps) is not functional on Windows, it was only tested on Linux and MacOS.

**Important**: RKeOps codes for CPU or GPU computing are identical (a global option allows to switch), then you can indifferently develop and use RKeOps codes on systems with or without GPUs (the only difference will be the potential computation performance). 

---

## Installation from CRAN

> **Note:** RKeOps is avaible on CRAN but only for UNIX environment (GNU/Linux and MacOS) and not for Windows.

```R
install.packages("rkeops")
```

## Get sources and install from local repository

You will need the `devtools` R package, please see the [next section](#potential-issue-with-devtools) for troubleshooting concerning `devtools`.

* Get KeOps sources (bash command)
```bash
git clone --recurse-submodules="keops/lib/sequences" https://github.com/getkeops/keops
# or
git clone https://github.com/getkeops/keops
cd keops
git submodule update --init -- keops/lib/sequences
# other submodules are not necessary for RKeOps
```

* Install dependencies
```R
pkg_list <- c(
    "devtools", "openssl", "knitr", "Rcpp", "RcppEigen", "rmarkdown", 
    "roxygen2", "stringr", "testthat"
)
install.packages(pkg_list)
```

* Install from local source in R (edit the path to the `keops` repository directory, it can be relative)
```R
devtools::install("path/to/keops/rkeops")
```

---

## Potential issue with devtools

You may encounter some issue when installing devtools, please check the official 
[devtools page](https://github.com/r-lib/devtools).

Following `devtools` recommendations, make sure you have a working development environment.

- Mac: Install Xcode from the Mac App Store.
- Linux: Install a compiler and various development libraries (details vary across different flavors of Linux).

For Ubuntu users [here](https://www.digitalocean.com/community/tutorials/how-to-install-r-packages-using-devtools-on-ubuntu-18-04) is a guide to install devtools requirement (users of other Linux distributions may still find it useful).

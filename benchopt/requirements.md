# Requirements to use `BenchOpt` library

> **Note concerning the OS**: all codes and commands presented here are specific to a Linux environment (and have only been tested on such system). Most of them should work in a MacOS environment.

`BenchOpt` is available as a command line tool or through a Python API, and is implemented as a Python package.

## Prepare your system

- To use `BenchOpt`, you need to install a Python distribution on your system (if not already installed):
   * either the one provided for your system (check this [webpage](https://realpython.com/installing-python/) for detailed installation instructions)
   * or the Anaconda (or Miniconda) Python distribution (check this [webpage](https://docs.anaconda.com/anaconda/install/) for detailed installation instructions).

**Important:** to be able to use all functionalities of `BenchOpt`, it is recommended to install Anaconda (or Miniconda) Python distribution, because `BenchOpt` requires the `conda` tool (see https://docs.conda.io/projects/conda/en/latest/user-guide/install/) to manage third-party dependencies, e.g. optimization algorithm implemented in their own library.

**Important:** the latest version of `BenchOpt` requires Python version >= 3.7

> **NOTE**: Python version 2 is not maintained anymore, it is recommended to install and use the latest Python version 3.

- You also need the `pip` Python module. If using Python >=3.4, it should be directly available on your system. You can either directly call the command `pip` (run `pip --version` to check) or use it as a Python module (run `python -m pip --version` to check). If not available, please check this [webpage](https://pip.pypa.io/en/stable/installing/).

> **NOTE**: you might have to update `pip` with `pip install -U pip` for `BenchOpt` to run.

- To avoid messing with your system, it is convenient (but optional) to install `BenchOpt` inside a Python virtual environment or inside a Conda environment (it you are using Anaconda). See below for a short guide regarding [Python virtual environment](#using-python-virtual-environment) or [Conda environment](#using-conda-environment).

**Important**: We recommend to use a dedicated Conda environment to install and run `BenchOpt` because it is still in active development and thus it can be subject to bugs and to frequent modifications/changes.

---

## Installing BenchOpt

### Installation with `pip`

**Note:** at the moment (January 2021), the latest version of `BenchOpt` is not available on PyPI server yet (and the previous release does not correspond to the current version of the doc), thus you should **disregard** this section and see how to install `BenchOpt` from source in the [next section](#installation-from-sources). Hopefully, the latest versio will soon be available to be installed with `pip`.

Run the following command to install `BenchOpt`:
```bash
pip install benchopt
```

Run `benchopt -h` to check that the installation is good.

### Installation from sources

Get `benchopt` sources from Github:
```bash
git clone https://github.com/benchopt/benchOpt
cd benchOpt
python setup.py install
```

Run `benchopt -h` to check that the installation is good.

> **Note**: `BenchOpt` sources are available as a git submodules inside the directory [./benchopt/tutorial](./benchopt/tutorial). To use it, you first need to clone this repository, then activate subdirectories (c.f. code chunk below). It can also be noted that all standard benchmarks for `BenchOpt` are also available as git submodules in the same directory.

```bash
git clone https://github.com/gdurif/optimizeR
cd optimizeR
git submodule init
git submodule update
cd benchopt/tutorial/benchOpt
```

---

## Specific requirements for this tutorial

In addition to the instructions detailed above to use `benchopt`, you will need the R package `biglasso` to follow the tutorial.

It can be installed in R with the following command:
```R
install.packages("biglasso")
```

---

## Appendix

### Using Python virtual environment

* Create a Python virtual environment:
```bash
# replace `<name_of_the_environment>` by a name of your choice
# edit the path at your convenience
python3 -m venv /path/to/<name_of_the_environment>
```

* Activate the Python virtual environment (**should be done before every (re)installation/use of the package**):
```bash
# replace `<name_of_the_environment>` by the name you chose
# edit the path accordingly
source /path/to/<name_of_the_environment>/bin/activate
```

### Using Conda environment

* You should install Anaconda or Miniconda Python distribution (c.f. [previously](#prepare-your-system)). To check if it is already available on your system, run:
```bash
conda list
```

* Create a Conda environment:
```bash
# replace `<name_of_the_environment>` by a name of your choice
conda create -n <name_of_the_environment>
```

* Activate the Conda environment (**should be done before every (re)installation/use of the package**):
```bash
# replace `<name_of_the_environment>` by the name you chose
conda activate <name_of_the_environment>
```

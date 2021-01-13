# Requirements to use `benchopt` library

`benchopt` is available as a command line tool or through a Python API, and is implemented as a Python package.

## Prepare your system

- To use it, you should install a Python distribution, either the one provided for your system (check this [webpage](https://realpython.com/installing-python/) for detailed installation instructions), or the Anaconda Python distribution (check this [webpage](https://docs.anaconda.com/anaconda/install/) for detailed installation instructions).

**Important:** the latest version of `benchopt` requires Python version >= 3.7

> **NOTE**: Python version 2 is not maintained anymore, it is recommended to install and use the latest Python version 3.

**Important:** to be able to use all functionalities of `benchopt`, it is recommended to install Anaconda (or Miniconda) Python distribution, because `benchopt` requires `conda` to manage solver dependencies (see https://docs.conda.io/projects/conda/en/latest/user-guide/install/).

- You also need the `pip` module. If using Python >=3.4, it should be directly available on your system. You can either directly call the command `pip` (run `pip --version` to check) or use it as a Python module (run `python -m pip --version` to check). If not available, please check this [webpage](https://pip.pypa.io/en/stable/installing/).

> **NOTE**: you might have to update `pip` with `pip install -U pip` for `benchopt` to run.

- To avoid messing with your system, it is convenient (but optional) to install `benchopt` inside a Python virtual environment or inside a Conda environment (it you are using Anaconda). See below for a short guide regarding [Python virtual environment](#using-python-virtual-environment) or [Conda environment](#using-conda-environment).

---

## Installing benchopt

### Installation with `pip`

**Note:** at the moment (January 2021), the latest version of `benchopt` is not available on PyPI server (and the previous release does not correspond to the current version of the doc), thus you should **disregard** this section and see how to install `benchopt` from source in the [next section](#installation-from-sources).

Run the following command to install `benchopt`:
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

---

## Appendix

### Using Python virtual environment

* Create Python virtual environment (**should be done only once**):
```bash
# edit path at your convenience
python3 -m venv /path/to/pyenv
```

* Activate the Python virtual environment (**should be done before every (re)installation/use of the package**):
```bash
# edit path accordingly
source /path/to/pyenv/bin/activate
```

### Using Conda environment

* You should install Anaconda or Miniconda Python distribution. To check if it is available, run:
```bash
conda list
```

* Create a Conda environment (**should be done only once**):
```bash
# replace `<name_of_the_environment>` by a name of your choice
conda create -n <name_of_the_environment>
```

* Activate the Conda environment (**should be done before every (re)installation/use of the package**):
```bash
# replace `<name_of_the_environment>` by the name you chose
conda activate <name_of_the_environment>
```

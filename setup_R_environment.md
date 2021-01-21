# Setting up R environment

> **Note**: the recommendations here are mainly valid for Unix environment (Linux and MacOs) and were not tested on Windows.

## Renviron

To avoid messing with your local `R` configuration when following the tutorials, it is recommended to **install all required packages in a dedicated library directory**.

To do so, it is recommended (among other possibilities that are less safe) to define a file named `.Renviron` with the following contents:
```
R_LIBS=/path/to/your/R/lib
R_LIBS_USER=/path/to/your/R/lib
```
You should edit the path to a (existing) directory of your choice (do not forget to create it before calling `R` if not existing) and you have to use an absolute path (e.g. `/path/to/optimizeR/.R_libs`) and not a relative one.

> **Note**: you can define any other environment variable in the `.Renviron` file.

The `.Renviron` file can be placed at different location, with the following order:
- if available, `R` will first try to read the `.Renviron` file in the current working directory
- if available, `R` will then try to read the `.Renviron` file in your home directory
- eventually, `R` will read a generic and default `.Renviron` configured for your system

> **Note for RStudio users**: in RStudio, the default working directory is the project root directory, thus a project-specific `.Renviron` file should be placed in the project root directory. RStudio should be restarted after creating or editing your `.Renviron` file.

> **Note for command line users**: you can configure the environment variable `R_ENVIRON_USER` containing the path to a specific `.Renviron` file that you want to use.

## Rprofile

You can also create an `.Rprofile` file containing `R` code that will be executed by `R` at startup, e.g. to define a CRAN repository to use when installing packages (example [here](./.Rprofile)).

Similarly to the `.Renviron` file, `R` will first try to use the `.Rprofile` file in the current working directory, then in your home directory.

> **Note for RStudio users**: in RStudio, the default working directory is the project root directory, thus a project-specific `.Rprofile` file should be placed in the project root directory, see the corresponding [file](./.Rprofile) in this project. RStudio should be restarted after creating or editing your `.Rprofile` file.

> **Note for command line users**: you can configure the environment variable `R_PROFILE_USER` containing the path to a specific `.Rprofile` that you want to use.


# tarmander

<!-- badges: start -->
<!-- badges: end -->

A microutil for switching between `targets` scripts.

## Installation

``` r
devtools::install_github("bmfazio/tarmander")
```

## Usage

Note: contrary to a standard `targets` project, this function explicitly ignores `_targets.R` scripts found in the root directory as the idea is to organize scripts by placing them in subfolders.

``` r
# Print active project
tarmander::tarmander
# Change active project
tarmander::tarmander()
```

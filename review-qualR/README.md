
<!-- README.md is generated from README.Rmd. Please edit that file -->

# `qualR` - package review

## **Reviewer:** [@beatrizmilz](https://github.com/beatrizmilz)

### Review Submitted: ….

<br>

This report contains documents associated with the review of
**rOpenSci** submitted package:

### **`qualR`: ropensci/software-review** issue [#474](https://github.com/ropensci/software-review/issues/474).

<br>

## Package info

**Description:**

A package to download information from CETESB QUALAR and MonitorAr
systems. It contains function to download different parameters, a set of
criteria pollutants and the most frequent meteorological parameters used
in air quality data analysis and air quality model evaluation.

**Author:** Mario Gavidia-Calderón <mario.calderon@iag.usp.br> \[aut,
cre\] (<https://orcid.org/0000-0002-7371-1116>), Maria de Fatima Andrade
<maria.andrade@iag.usp.br> \[ctb, ths\]
(<https://orcid.org/0000-0001-5351-8311>), Daniel Schuch
<d.schuch@northeastern.edu> \[aut, ctb\]
(<https://orcid.org/0000-0001-5977-4519>)

**repo url:** <https://github.com/quishqa/qualR>

**website url:** <https://quishqa.github.io/qualR/>

## Review info

#### See [reviewer guidelines](https://ropensci.github.io/dev_guide/reviewerguide.html) for further information on the rOpenSci review process.

**key review checks:**

-   Does the code comply with **general principles in the [Mozilla
    reviewing
    guide](https://mozillascience.github.io/codeReview/review.html)**?
-   Does the package **comply with the [ROpenSci packaging
    guide](https://ropensci.github.io/dev_guide/building.html)**?
-   Are there **improvements** that could be made to the **code style?**
-   Is there **code duplication** in the package that should be reduced?
-   Are there **user interface improvements** that could be made?
-   Are there **performance improvements** that could be made?
-   Is the
    [**documentation**](https://ropensci.github.io/dev_guide/building.html#documentation)
    (installation instructions/vignettes/examples/demos) **clear and
    sufficient**?

Please be respectful and kind to the authors in your reviews. The
rOpenSci [code of
conduct](https://ropensci.github.io/dev_guide/policies.html#code-of-conduct)
is mandatory for everyone involved in our review process.

### session info

``` r
sessionInfo()
```

    #> R version 4.1.2 (2021-11-01)
    #> Platform: x86_64-pc-linux-gnu (64-bit)
    #> Running under: Ubuntu 20.04.3 LTS
    #> 
    #> Matrix products: default
    #> BLAS:   /usr/lib/x86_64-linux-gnu/blas/libblas.so.3.9.0
    #> LAPACK: /usr/lib/x86_64-linux-gnu/lapack/liblapack.so.3.9.0
    #> 
    #> locale:
    #>  [1] LC_CTYPE=pt_BR.UTF-8       LC_NUMERIC=C              
    #>  [3] LC_TIME=pt_BR.UTF-8        LC_COLLATE=pt_BR.UTF-8    
    #>  [5] LC_MONETARY=pt_BR.UTF-8    LC_MESSAGES=pt_BR.UTF-8   
    #>  [7] LC_PAPER=pt_BR.UTF-8       LC_NAME=C                 
    #>  [9] LC_ADDRESS=C               LC_TELEPHONE=C            
    #> [11] LC_MEASUREMENT=pt_BR.UTF-8 LC_IDENTIFICATION=C       
    #> 
    #> attached base packages:
    #> [1] stats     graphics  grDevices utils     datasets  methods   base     
    #> 
    #> other attached packages:
    #> [1] devtools_2.4.2 usethis_2.1.3  magrittr_2.0.1
    #> 
    #> loaded via a namespace (and not attached):
    #>  [1] rstudioapi_0.13   knitr_1.36        pkgload_1.2.3     R6_2.5.1         
    #>  [5] rlang_0.4.12      fastmap_1.1.0     stringr_1.4.0     tools_4.1.2      
    #>  [9] pkgbuild_1.2.0    xfun_0.28         sessioninfo_1.2.1 cli_3.1.0        
    #> [13] withr_2.4.2       remotes_2.4.1     htmltools_0.5.2   ellipsis_0.3.2   
    #> [17] rprojroot_2.0.2   yaml_2.2.1        digest_0.6.28     lifecycle_1.0.1  
    #> [21] crayon_1.4.2      processx_3.5.2    purrr_0.3.4       callr_3.7.0      
    #> [25] ps_1.6.0          fs_1.5.0          testthat_3.1.0    memoise_2.0.0    
    #> [29] glue_1.5.0        cachem_1.0.6      evaluate_0.14     rmarkdown_2.11   
    #> [33] stringi_1.7.5     compiler_4.1.2    desc_1.4.0        prettyunits_1.1.1

``` r
pkg_dir <- "/home/bea/GitHub/ropensci_reviews/qualR"
pkg_dir
```

    #> [1] "/home/bea/GitHub/ropensci_reviews/qualR"

## Test installation

### test local `qualR` install:

``` r
install(pkg_dir, dependencies = T, build_vignettes = T)
```

``` r
remove.packages("qualR")
```

#### **comments:**

The local installation worked. ✨

------------------------------------------------------------------------

### test install of `qualR` from GitHub with:

``` r
devtools::install_github("quishqa/qualR", dependencies = T, build_vignettes = T)
```

#### **comments:**

The installation via GitHub worked. ✨

## Check package integrity

### run checks on `qualR` source:

``` r
devtools::check(pkg_dir)
```

**Check results:**

    ── R CMD check results ─────────────────────────────── qualR 0.9.5 ────
    Duration: 1m 54s

    > checking R/sysdata.rda ... OK
       WARNING
      ‘qpdf’ is needed for checks on size reduction of PDFs

    > checking top-level files ... NOTE
      Non-standard files/directories found at top level:
        ‘CONTRIBUTING.md’ ‘LICENSE.md’ ‘README.Rmd’ ‘_pkgdown.yml’
        ‘appveyor.yml’ ‘codecov.yml’ ‘codemeta.json’ ‘data-raw’ ‘docs’
        ‘paper.bib’ ‘paper.md’ ‘pin_nox_lock20.png’ ‘rj_centro_2019.png’
        ‘usp_o3_aug21.png’

    0 errors ✓ | 1 warning x | 1 note x

#### **comments:**

The check returned 1 note and 1 warning.

About the warning:

The warning of qpdf is related to an external program. In this
Stackoverflow answer there is an explanation for it:
<https://stackoverflow.com/a/44649267>

About the note:

There are some files that are not needed to the package be build, so it
needs to be ignored on `.Rbuildignore` . One way to do that is to use
`usethis::use_build_ignore("relative_path_to_the_file)`. But I do not
recommend to use this function to all the files that the Check listed.
There are some files that would be better located in other directories,
not in the root of the package (such as the images and the files related
to the paper being written about the package). In this link, there is
more information about the `.Rbuildignore` file:
<https://r-pkgs.org/package-structure-state.html#rbuildignore>  
Ex:

    > usethis::use_build_ignore("CONTRIBUTING.md")
    ✓ Setting active project to '/home/bea/GitHub/ropensci_reviews/qualR'
    ✓ Adding '^CONTRIBUTING\\.md$' to '.Rbuildignore'

------------------------------------------------------------------------

### run tests on `qualR` source:

``` r
devtools::test(pkg_dir)
```

**Tests results:**

    ══ Results ════════════════════════════════════════════════════════════
    Duration: 71.1 s

    [ FAIL 0 | WARN 0 | SKIP 0 | PASS 8 ]

#### **comments:**

All the tests passed. There are only a few tests. I recommend the
authors to write more expectations with `expect_*()`.

------------------------------------------------------------------------

### check `qualR` for goodpractice:

``` r
goodpractice::gp(pkg_dir)
```

    ── GP qualR ───────────────────────────────────────────────────────────

    It is good practice to

      ✖ avoid calling setwd(), it changes the global
        environment. If you need it, consider using on.exit() to
        restore the working directory.

        tests/testthat/test-CetesbRetrieveParam.R:4:11
        tests/testthat/test-CetesbRetrieveParam.R:9:3
        tests/testthat/test-MonitorArRetrieve.R:4:11
        tests/testthat/test-MonitorArRetrieve.R:7:3

      ✖ fix this R CMD check NOTE: Note: found 40 marked
        UTF-8 strings
      ✖ fix this R CMD check WARNING: LaTeX errors when
        creating PDF version. This typically indicates Rd
        problems.
      ✖ fix this R CMD check ERROR: Re-running with no
        redirection of stdout/stderr. Hmm ... looks like a package
        Warning in texi2dvi(file = file, pdf = TRUE, clean =
        clean, quiet = quiet, : texi2dvi script/program not
        available, using emulation Error in texi2dvi(file = file,
        pdf = TRUE, clean = clean, quiet = quiet, : pdflatex is
        not available Warning in texi2dvi(file = file, pdf = TRUE,
        clean = clean, quiet = quiet, : texi2dvi script/program
        not available, using emulation Error in texi2dvi(file =
        file, pdf = TRUE, clean = clean, quiet = quiet, : pdflatex
        is not available Error in running tools::texi2pdf() You
        may want to clean up by 'rm -Rf
        /tmp/RtmpNm3vzd/Rd2pdf3bab53f279cd'

#### **comments:**

<!-- record comments on goodpractice here -->

------------------------------------------------------------------------

## Check package metadata files

### inspect

-   #### [README](https://github.com/quishqa/qualR)

-   #### [DESCRIPTION](https://github.com/quishqa/qualR/blob/master/DESCRIPTION)

-   #### [NAMESPACE](https://github.com/quishqa/qualR/blob/master/NAMESPACE)

### spell check

``` r
devtools::spell_check(pkg_dir)
```

#### **comments:**

<!-- record comments on metadata files here -->

------------------------------------------------------------------------

## Check documentation

online documentation: **<https://quishqa.github.io/qualR/>**

-   Is the
    [documentation](https://ropensci.github.io/dev_guide/building.html#documentation)
    (installation instructions/vignettes/examples/demos) clear and
    sufficient?

### test `qualR` function help files:

``` r
help(package = "qualR")
```

#### **comments:**

<!-- record comments on help files here -->

------------------------------------------------------------------------

### test `qualR` vignettes:

``` r
vignette(package = "qualR")
```

#### **comments:**

<!-- record comments on vignettes here -->

------------------------------------------------------------------------

## Test functionality:

-   Are there **user interface improvements** that could be made?
-   Are there **performance improvements** that could be made?

``` r
library("qualR")
```

``` r
exports <-ls("package:qualR")
exports
```

<!-- experiment with package functions -->

#### **comments:**

<!-- record comments on package experimentation here -->

------------------------------------------------------------------------

## Inspect code:

-   Does the package **comply with the [ROpenSci packaging
    guide](https://ropensci.github.io/dev_guide/building.html)**?
    -   good [function & variable
        naming?](https://ropensci.github.io/dev_guide/building.html#function-and-argument-naming)
    -   good [dependency
        management](https://ropensci.github.io/dev_guide/building.html#package-dependencies)?
-   Are there **improvements** that could be made to the [**code
    style?**](https://ropensci.github.io/dev_guide/building.html#code-style)
-   Is there **code duplication** in the package that should be reduced?

``` r
pkgreviewr::pkgreview_print_source("qualR")
```

**\* might not be suitable for large packages with many exported
functions**

<br> <br>

#### **comments:**

<!-- record comments on package source code here -->

## Review test suite:

See guidance on
[testing](https://ropensci.github.io/dev_guide/building.html#testing)
for further details.

### test coverage

``` r
covr::package_coverage(pkg_dir)
```

### inspect [tests](https://github.com/quishqa/qualR/blob/master/tests/testthat)

#### **comments:**

<!-- record comments on testing suite here -->

------------------------------------------------------------------------

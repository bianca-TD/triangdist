
<!-- README.md is generated from README.Rmd. Please edit that file -->

# triangdist

-El objetivo de triangdist es proporcionar las funciones esenciales para
trabajar con la distribución triangular: densidad (`dtriang`),
distribución acumulada (`ptriang`), cuantiles (`qtriang`) y generación
de números aleatorios (`rtriang`).

## Instalación

Puedes instalar la versión de desarrollo de triangdist desde
GitHub(<https://github.com/>) con:

``` r
# install.packages("pak")
pak::pak("bianca-TD/triangdist")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(triangdist)
## basic example code
# 1. Aqui, calculamos la densidad:
dtriang(x = 5, min = 0, max = 10, mode = 5)
#> [1] 0.2

# 2. Así, calculariamos la probabilidad acumulada hasta el punto medio:
ptriang(q = 5, min = 0, max = 10, mode = 5)
#> [1] 0.5

# 3. Y así, generariamos 5 números aleatorios basados en la distribución
set.seed(123)
rtriang(n = 5, min = 0, max = 10, mode = 5)
#> [1] 3.791949 6.746580 4.522040 7.581503 8.274707
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.

# Variance partitioning coefficient for a 2-level empty negative binomial model

This repository contains a custom function to calculate the VPC for a 2-level unconditional (empty)
negative binomial model.

This is meant to be used with the results of an unconditional (empty) 2-level negative binomial model.

A 2-level negative binomial arises when the outcome of interest is a count variable with overdispersion and observations are nested in hierarchical units.

A typical example of such a setting would be the number of days in which pupils are absent from school. Overdispersion refers to the situation when the variance of a count variable is larger than its mean, so it does not conform to the underlying assumption of a Poisson distribution. Underdispersion is also possible, but overdispersion is far more common.

The function *vpc_neg_binom* can use a "glmerMod" object or you can input the parameters directly.

You can download the function and call it in R by typing: **source("vpc_neg_binom.R")**

The function uses the following parameters:

**x** is a "glmerMod" object

**beta** is the intercept (in the log-scale)

**u** is the level-2 variance

**alpha** is the overdispersion parameter (reciprocal of theta, which is what the "glmerMod" object reports)

The formula implemented is the one described in Leckie et al. (2020) [1] (**equation 16**).

***

This repository also contains the code for a shinyapp to calculate the VPC by inputting
the parameter values directly.

The shinyapp is here: https://patricio-troncoso.shinyapps.io/vpc_nb2_app/

The underlying code of the app is here: https://raw.githubusercontent.com/patroncos/vpc_neg_binom/main/app.R

***

**References:**

[1]: Leckie, G., Browne, W. J., Goldstein, H., Merlo, J., & Austin, P. C. (2020). Partitioning variation in multilevel models for count data. Psychological Methods, 25(6), 787–801. https://doi.org/10.1037/met0000265

To cite this tool:

Troncoso, P. (2021). "vpc_neg_binom": R function for the variance partitioning coefficient of a 2-level empty negative binomial model. https://github.com/patroncos/vpc_neg_binom

***

**Disclaimer**: This online tool comes with no warranty. Results should be used at the user's discretion. This is distributed under the conditions of GNU General Public License v3.0.

***

Latest update: 16/06/2021

Future updates may allow the inclusion of covariates.
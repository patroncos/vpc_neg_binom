# vpc_neg_binom

This is a custom function to calculate the VPC for a 2-level unconditional (empty)
negative binomial model.

The function can use a "glmerMod" object or you can input the parameters directly.

You can download the function and call it in R by typing *source("vpc_neg_binom.R")*

The function uses the following parameters:

'x' is an "glmerMod" object
'beta' is the intercept (in the log-scale)
'u' is the level-2 variance
'alpha' is the overdispersion parameter (reciprocal of theta, which is what the "glmerMod" object reports)

The formula implemented is the one described in Leckie et al. (2020).

Leckie, G., Browne, W. J., Goldstein, H., Merlo, J., & Austin, P. C. (2020). Partitioning variation in multilevel models for count data. Psychological Methods, 25(6), 787–801. https://doi.org/10.1037/met0000265

This repository also contains the code for a shinyapp to calculate the VPC by inputting
the parameter values directly.

The shinyapp is here: https://patricio-troncoso.shinyapps.io/vpc_nb2_app/
The underlying code of the app is here: https://raw.githubusercontent.com/patroncos/vpc_neg_binom/main/app.R
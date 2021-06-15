vpc_nb <- function(x=NULL, alpha=NULL, beta=NULL, u=NULL) {
  if (is(x, "glmerMod")) {
    alpha <- 1/(getME(x, "glmer.nb.theta"))
    beta <- x@beta
    u <- as.numeric(VarCorr(x, comp="Variance"))
    lev2var <- (exp(beta +(u/2)))^2*(exp(u)-1)
    lev1var <- exp(beta +u/2)+((exp(beta +u/2))^2*exp(u)*alpha)
    vpc_nb <- lev2var/(lev2var+lev1var)
    return(print(paste("VPC/ICC =", round(vpc_nb, digits = 3))))
  }
  else  {
    alpha <- alpha
    beta <- beta
    u <- u
    lev2var <- (exp(beta +(u/2)))^2*(exp(u)-1)
    lev1var <- exp(beta +u/2)+((exp(beta +u/2))^2*exp(u)*alpha)
    vpc_nb <- lev2var/(lev2var+lev1var)
    return(print(paste("VPC/ICC =", round(vpc_nb, digits = 3))))
  }
}
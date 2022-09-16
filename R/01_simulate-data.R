## script to simulate time series data for testing dynamic aggregation


#### dependencies ####

library(magrittr)
library(rstan)


#### control parameters ####

set.seed(666)

## number of time series
nn <- 10

## length of time series
tt <- 30

## number of clusters/groups
kk <- 3

## group membership
## first ts gets assigned to first group
Z1 <- c(1, rep(0, kk - 1))
## set other groups
ZZ <- cbind(Z1,
            rmultinom(nn - 1, size = 1, prob = rep(1, kk))) %>%
  t()
rownames(ZZ) <- NULL


#### data simulation ####

## process errors (IID)
ww <- MASS::mvrnorm(n = tt, mu = rep(00, kk), Sigma = diag(kk)) %>%
  t()

## observation errors
vv <- MASS::mvrnorm(n = tt, mu = rep(00, nn), Sigma = diag(nn)) %>%
  t()

## multivariate random walks
## initialize states
xx <- ww

for(i in 2:tt) {
  xx[,i] <- xx[,i - 1] + ww[, i]
}

plot.ts(t(xx))

## observed ts
yy <- ZZ %*% xx + vv

plot.ts(t(yy))


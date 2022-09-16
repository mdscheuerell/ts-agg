## script to simulate time series data for testing dynamic aggregation


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
ZZ <- rbind(Z1,
            t(rmultinom(nn - 1, size = 1, prob = rep(1, kk))) )

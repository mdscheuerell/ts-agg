data {
  // number of observed time series
  int<lower=0> n_ts;
  // length of time series
  int<lower=0> tt;
  // number of states (groups)
  int<lower=0> kk;
  // number of observed values
  int<lower=0> n_obs;
  // number of missing values
  int<lower=0> n_mis;
}

parameters {
  // states
  matrix[kk, tt] xx;
  // group ID's
  array[nn] row_vector[kk] ZZ;
  // process SD
  real<lower=0> SD_proc;
  // observation SD
  real<lower=0> SD_obs;
  // missing data
  array[n_mis] real y_mis;
}

model {
  y_obs ~ normal(mu, sigma);
  y_mis ~ normal(mu, sigma);
}


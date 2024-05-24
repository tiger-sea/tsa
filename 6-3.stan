data {
    int n_sample;
    array[n_sample] real y;
}

parameters {
    real mu_zero;
    array[n_sample] real mu;
    real<lower=0> s_w;
    real<lower=0> s_v;
}

model {
    mu[1] ~ normal(mu_zero, sqrt(s_w));

    for(i in 2:n_sample) {
        mu[i] ~ normal(mu[i-1], sqrt(s_w));
    }

    for(i in 1:n_sample) {
        y[i] ~ normal(mu[i], sqrt(s_v));
    }
}

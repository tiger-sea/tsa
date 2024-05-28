data {
    int n_sample; // number of samples (data)
    array[n_sample] real y; // samples (data)
}

parameters {
    real mu_zero; // initial state
    array[n_sample] real mu; // state
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

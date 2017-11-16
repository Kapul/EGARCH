function [coefs, forecast] = estim_egarch(y, p, q)
l = @(a) builtin('_paren', -likelihood_egarch(y, a, p, q), 1);
coefs = fminunc(l, [log(var(y)), zeros(1,p+q)]);
[~, f] = likelihood_egarch(y, coefs, p, q);
forecast = f';
end
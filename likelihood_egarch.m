function [l, forecast] = likelihood_egarch(y, a, p, q)
h = [log(var(y))*ones(p,1); ones(q,1)];
c = a(1);
alpha = a(2:p+1);
beta = a(p+2:end);
for t = 1:length(y)
    ls2 = c + alpha*h(1:p) + beta*h(p+1:end);
    s2 = exp(ls2);
    z(t) = y(t)/sqrt(s2);
    h(2:p) = h(1:p-1);
    h(p+2:end) = h(p+1:end-1);
    h(1) = ls2;
    h(p+1) = abs(z(t));
    l(t) = log(normpdf(y(t),0,sqrt(s2)));
    forecast(t) = sqrt(s2);
end
l = mean(l);
end
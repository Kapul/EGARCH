clear
clc
load VWindustry.mat
vwret4=VWRETURN(Industry==4);
vwret8=VWRETURN(Industry==8);
e4=vwret4-mean(vwret4);
e8=vwret8-mean(vwret8);
[c4,f4]=estim_egarch(e4,1,1);
[c8,f8]=estim_egarch(e8,1,1);
%%
l=round(length(e4)/2);
s{1}=e4(1:l);
s{2}=e4(l+1:end);
for p=1:2;
    for q=1:2;ans-
        for i=1:2;
            [c{i,p,q},f{i,p,q}]=estim_egarch(s{i},p,q);
            [l, ~] = likelihood_egarch(s{i}, c{i,p,q}, p, q);
            aic{i,p,q} = -2*l*length(s{i}) + 2*(p+q+1);
        end
    end
end

        
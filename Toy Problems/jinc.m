function out = jinc(in);

t = abs(in);
out = besselj(1,pi*t) ./ (2*t + (t==0));

list = find(t==0);
out(list) = ones(size(list));


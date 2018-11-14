function [y] = SoftThresh(x,lambda)

% vector form code
y = (abs(x) > lambda).*(x.*(abs(x)-lambda)./(abs(x)+eps));

% element wise code
% for i = 1:length(x)
%     if abs(x(i)) <= lambda
%         y(i) = x(i)*(abs(x(i))-lambda)/abs(x(i));
%     else
%         y(i) = 0;
%     end
% end

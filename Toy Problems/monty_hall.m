% Monty Hall Simulations 
%
% by Krishna Nayak, 19 Nov 2013

numtrials = 10^4;

staybetter = 0;
switchbetter = 0;

for k= 1:numtrials
    door = ceil(rand()*3);
    pick = ceil(rand()*3);
    if (door == pick) staybetter = staybetter+1;
    else switchbetter = switchbetter+1;
    end
end

disp(sprintf('Switching is better %.3f percent of the time',100*switchbetter/numtrials));


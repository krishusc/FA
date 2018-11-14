% Script that explores the Birthday Paradox

%%
% CARDS (in class activity)
%
% Pick a random card from each of N decks.  
% What are the chances of having at least one duplicate?
%
% P(N=1) = 0
% P(N=53) = 1

range = 1:52;
p = 0;

for n=range
    p(n) = 1 - ( prod((52-n+1):52) / 52^n );
end

plot(range, p, '-b', 'LineWidth', 3);
xlabel('Number of Decks');
ylabel('Probability of at least one duplicate');
grid on;

%%
% BIRTHDAY PARADOX
%
% N people in a room  
% What are the chances of having at least pair of people with the same birthday?
%
% P(N=1) = 0
% P(N=366) = 1

range = 1:50;
p = 0;

for n=range
    p(n) = 1 - ( prod((365-n+1):365) / 365^n );
end

plot(range, p, '-b', 'LineWidth', 3);
axis([1 50 0 1]);
xlabel('Number of People');
ylabel('Probability of at least one shared birthday');
grid on;

%%
% My GAME (pick three numbers each from 1 to 9, 9^3 possibilities)
%
% N people playing the game  
% What are the chances of having at least one pair of people with the same choice
%
% P(N=1) = 0
% P(N=9^3+1) = 1

possibilities = 9^3;
range = 1:60;
p = 0;

for n=range
    p(n) = 1 - ( prod((possibilities-n+1):possibilities) / possibilities^n );
end

plot(range, p, '-b', 'LineWidth', 3);
xlabel('Number of Entries');
ylabel('Probability of at least one shared entry');
grid on;
figure(gcf);

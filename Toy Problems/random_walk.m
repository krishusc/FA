% 2D Random Walk Simulation
% 
% Using complex numbers (for convenience)

timesteps = 1000;
axismax = 100;
sdeachstep = 1;

% shift at each timestep
delta = sdeachstep * (randn(timesteps,1) + j*randn(timesteps,1));
% position is a cumulative sum of shifts
walk = [0;cumsum(delta)];
% plot it out
plot(real(walk),imag(walk),'b-'); grid on;
% consistent axis (so that we can press play repeatedly)
axis(axismax*[-1,1,-1,1]);
grid on;

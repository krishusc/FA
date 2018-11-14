
lambda = 1;
x = linspace(-5,5,256);

Y = linspace(-5,5,128);
Opt = Y*0;
for n=1:128
    Cost = 0.5*abs(x-Y(n)).^2 + lambda*abs(x);
    idx = min(find(Cost==min(Cost)));
    Opt(n) = x(idx);
    figure(100), plot(Y(1:n), Y(1:n),'LineWidth',3), hold on,
    plot(Y(1:n),Opt(1:n),'r','LineWidth',3);
    plot(x, Cost/10,'k','LineWidth',3,'Color',[0.5,0.5,0.5]); plot(Opt(n),Cost(idx)/10,'X','MarkerSize',20);
   hold off ;    
   axis([-5.1,5.1,-5.1,5.1]);
   legend('y','x','(0.5*|x-y|^2+\lambda |x|)/10','Optimum','Location','SouthEast')
   title('argmin 0.5 |x-y|^2 + \lambda |x|')
   pause(0.2);drawnow;
end

    

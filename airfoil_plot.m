function airfoil_plot(x, zhi, zlo)
%This function plots the shape of the airfoil given zhi, zlo, and x
figure(1)
hold on 
plot(x,zhi)
plot(x,zlo)
grid on
title('Airfoil Plot')
xlabel('x/c')
ylabel('z/c')
xlim([0,1])
ylim([-0.5,0.5])
hold off 
end
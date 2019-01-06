function C_M_CG_vs_cl(cmcg, cl) 
%this function will plot our coefficient of moment about the center of
%gravity vs the coefficient of lift, giving us our static margin
figure(8)
plot(cl, cmcg)
title('Static Margin')
grid on
xlabel('C_l')
ylabel('C_m_CG')
end
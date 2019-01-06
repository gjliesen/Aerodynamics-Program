function clw = wing_lift_curve(zlAOA, a)
%This function calculates the coefficient of lift of the wing at each point
%of angle of attack using the zero lift angle attack of the airfoil and the
%lift slope correction factor 
aoa = -6:0.2:10; 
clw = a * ((aoa*(pi/180)) - zlAOA); %calculates wing lift coefficient 
figure(3)
plot(aoa, clw)
grid on
title('Wing Lift Curve')
xlabel('Angle of Attack (deg)')
ylabel('C_L')
end
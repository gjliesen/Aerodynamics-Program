function clt = tail_lift_curve(a, toa)
%This function calculates and plots the lift of the tail vs AOA using the
%lift slope correction factor and the tail offset angle
aoa = -6:0.2:10; 
clt = a * ((aoa*(pi/180)) + (toa*(pi/180))); % calculating lift coeficcient 
figure(2)
plot(aoa, clt)
grid on
title('Tail Lift Curve')
xlabel('Angle of Attack (deg)')
ylabel('C_L')
end
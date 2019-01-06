function Cl_vs_Cd(Cl_total, Cd_total)
%This function calculates and plots Cl/Cd vs AOA using the Total Cl and Total
%CD 
AOA = -6:0.2:10; %defines angle of attack
LD = (length(Cl_total)); %preallocates memory 
i = 1; 
while i <= length(Cl_total) %Division loop to find L/D ratio
LD(i) = (Cl_total(i)) / (Cd_total(i));
i = i + 1; 
end
figure(5)
plot(Cd_total, Cl_total) %Plot
title('Coefficient of Lift vs Drag Curve')
grid on
ylabel('C_L')
xlabel('C_D')
figure(6)
plot(AOA, LD)
title('Lift to Drag Ratio vs Angle of Attack')
grid on
xlabel('Angle of Attack(Deg)')
ylabel('L/D')
end

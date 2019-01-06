function cmcg = C_M_CG_vs_AOA_curve(C_L_w, C_L_t, q, mclz, x, S_w, S_t, x_cg, x_t, mac, Bwing, tr, cr, qcs, tc, C_D_w, C_D_t)
%This function calculates the CmCG vs the angle of attack given coefficient
%of lift of the wing and tail, the dynamcic pressure, the area of the wing
%and tail, the mean camber line, the center of gravity, and the locations
%of the tail and wing
h = length(x);

aoa_deg = -6:0.2:10; %defines angle of attacks 

L_w = q * S_w * C_L_w; %lift of wing
L_t = q * S_t * C_L_t; %lift of tail

i = 1; 
theta_star = zeros(h,1); %initialize matrix for theta_star
while i <= h %loop through matrix to fill theta_star array 
    theta_star(i) = acos(1 - (2 * x(i))); 
    i = i + 1; 
end

%variable definitions 
constant = 2/pi ; 
i=2;
A1_total = 0; 
A2_total = 0; 
while i <= h %these loops find the total A1 and A2 to be used in the x_cp formula
 slope = ((mclz(i) - mclz(i-1))/(x(i) - x(i-1)));
 A1 = constant * slope * (sin(theta_star(i)) - sin(theta_star(i-1))); 
 A1_total = A1 + A1_total; %accumulating A1
 A2 = constant * slope * ((sin(theta_star(i)) * cos(theta_star(i))) - (sin(theta_star(i-1)) * cos(theta_star(i-1))));
 A2_total = A2 + A2_total; %accumulating A2
 i = i + 1;
end
cmc = (pi / 4)* (A2_total - A1_total); %q s mac 
couple = cmc * q * S_w * mac; %calculates couple moment at aerodynamic center 
ymac = (Bwing / 6) * ((1 + (2 * tr))/(1 + tr)); %calculates aerdoynamic center location 
qcs_rad = qcs * (pi / 180); %convert quarter chord from degrees to radians 
xac = (cr / 4) + ymac * tan(qcs_rad); %xac = aerodynamic center location 

M_t = L_t * (x_cg - (x_t + (tc/4))); %moment about the CG in relation to the tail

M_w = L_w * (x_cg - xac); %moment about CG in relations to the wing

D_w = C_D_w * q * S_w; %moment about CG due to wing drag  

D_t = C_D_t * q * S_t; %moment about CG due to tail drag 

M_total = couple + M_w .* cos(aoa_deg .* (pi/180)) + M_t .* cos(aoa_deg .* (pi/180)) + (D_w .* (x_cg - xac) .* sin(aoa_deg .* (pi/180))) +  (D_t .* (x_cg - x_t + (tc/4) .* sin(aoa_deg .* (pi/180)))); %calculates total moment 

cmcg = M_total /(S_w * mac * q); %non-dimensionalizes the cmcg 

%Drag wing * xcg -xac * sin(alfa)
%negative value (Drag tail * xcg - xta * sin(alfa))
%Clalfa = 2alfa 
%Alfa zero lift 
%C moment at quarter chord  
figure(7)
plot(aoa_deg, cmcg)
title('Coefficient of moment vs Angle of Attack') %plotting C_M_CG vs AOA
grid on
xlabel('Angle of Attack(deg)')
ylabel('C_M_C_G')
end
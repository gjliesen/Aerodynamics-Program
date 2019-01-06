function [CD_wing CD_tail] = CD_vs_AOA(we, clw, war, w_re, wthickr, te, clt, warea, qcs, rmt, t_re, tarea, tqcs, tar) %#ok<NCOMMA>
%this function calculates the coefficients of drag over the wing, tail, and over the
%whole airfoil, and plots this value vs angle of attack. This function also
%returns the C_D_wing and C_D_tail.


AOA = -6:0.2:10; %angle of attack in degrees
C_f_w = (.455 / (log10(w_re)^2.58)) - (1700 / w_re); %skin friction coefficents for both sides of the wing and tail
C_f_t = (.455 / (log10(t_re)^2.58)) - (1700 / t_re);

wCDi = (clw).^2 / (we * pi * war); %coefficient of wing induced drag
tCDi = (clt).^2 / (te * pi * tar); %coefficient of tail induced drag
S_wet_w = 2 * (1 + (0.2 * wthickr)) * warea; %finding wetted area of wing
S_wet_t = 2 * (1 + (0.2 * rmt)) * tarea; %finding wetted area of tail
Kw = 5.46 * (wthickr)^2 + (1.55 - sin(qcs))*(wthickr)+1; %wing form factor
Kt = 5.46 * (rmt)^2 + (1.55 - sin(tqcs))*(rmt)+1; %tail form factor
wCDo= (Kw * C_f_w * S_wet_w) / warea; %coefficient of wing form drag
tCDo = (Kt * C_f_t * S_wet_t) / tarea; %coefficient of tail form drag
CD_wing = wCDo + wCDi; %total wing drag
CD_tail = tCDi + tCDo; %total tail drag
 
CD_total = wCDo + tCDo + wCDi + tCDi; %total drag
figure(4)
plot(AOA, CD_total); %plotting total drag vs angle of attack
grid on; 
title('Coefficient of Drag vs. Angle of Attack ')
xlabel('Angle of Attack (deg)')
ylabel('C_D')
end
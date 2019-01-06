%Project 2 AEM 313 - This program runs a number of functions and plots to
%determine information about a given UAV design flying at 5000m and 50m/s 
%Members: Andrew Burjek, David Rice, Gregory Liesen, William Cunzeman, William
%Patton

%Declare Constants 
R = 287; %m^2/(s^2*K)
y = 1.4; %cp/cv
b = 0.0065; %K/m
Po = 101325; %pa
To = 288.15; %K
C1 = 1.458e-6; %kg/m*s
C2 = 110.4; %K 
g = 9.81; %m/s^2
%is there a set number of pannels 
%Read in data from file 

close all
data_array=load('airfoil.txt'); % reads (loads) the data as an array
n=size(data_array); % determines the number of rows and cols
pts = n(1); % sets pts equal to number of rows
x = data_array(:,1); % sets x equal to the first column of data
zhi = data_array(:,2); % sets zhi equal to the second column of data
zlo = data_array(:,3); % sets zlo equal to the third column of data

close all
data_array = load('wing.txt'); % reads (loads) the data as an array
rc = data_array(1,1); % root chord
rws = data_array(2,1); % relative wing span
tr = data_array(3,1); % taper ratio
qcs = data_array(4,1); % quarter-chord sweep
rCG = data_array(5,1); % relative CG

close all
data_array = load('tail.txt'); % reads (loads) the data as an array
rtc = data_array(1,1); % relative tail chord
rts = data_array(2,1); % relative tail span
ttr = data_array(3,1); % tail taper ratio
tqcs = data_array(4,1); % tail quarter-chord sweep(degrees)
rmt = data_array(5,1); % relative maximum thickness
rlt = data_array(6,1); % relative location of tail 
toa = data_array(7,1); % tail offset angle

close all
data_array=load('conditions.txt'); % reads (loads) the data as an array
U = data_array(1,1); % flight speed
z = data_array(2,1); % altitude 

atc = rtc * rc; %atc = actual tail chord

%Function Calls 
T = temp(z, To, b); % T = temperature 
p = pressure(z, To, b, g, R, T, Po); % p = pressure 
rho = density(p , T, R); %rho = density 
M = Mach(U, T, R, y); %M = mach number 
q = dynamicpressure(U, rho); %q = dynamic pressure 
visc = viscosity(T, C1, C2); %visc = viscosity 
wmac = mean_aerodynamic_chord(rc, tr); %wmac = wing mean aerodynamic chord
tmac = mean_aerodynamic_chord(atc, ttr); %tmac = tail mean aerodynamic chord 
w_re = reynolds(wmac, visc, rho, U); %w_re =  wing reynolds number 
t_re = reynolds(tmac, visc, rho, U); %t_re = wing reynolds number 
airfoil_plot(x, zhi, zlo); %plots airfoil
tratio = thickness_ratio(zhi, zlo); %tratio = wing thickness ratio 
mcl = camber(zhi, zlo); %airflil mean camber line
Bwing = span(rc, rws); %Bwing = wing span
Btail = span(atc, rts); %Btail = tail span
warea = area(rc, tr, Bwing); %warea = wing area
tarea = area(atc, ttr, Btail); %tarea = tail area
war = aspectratio(warea, Bwing); %war = wing aspect ratio 
tar = aspectratio(tarea, Btail); %tar = tail aspect ratio 
wtau = liftslopecorrection(war, tr); %wtau = wing lift slope correction factor 
ttau = liftslopecorrection(tar, ttr); %ttau = tail lift slope correction factor
zlAOA = zeroliftangle(mcl, x); %zlAOA = zero lift angle of attack 
cslopewing = d_correction_slope(wtau, war); %cslopewing = 3D corrected slope for wing 'a'
cslopetail = d_correction_slope(ttau, tar); %cslopetail = 3D corrected slope for wing 't'
clt = tail_lift_curve(cslopetail, toa); %clt = coefficient of lift of tail 
clw = wing_lift_curve(zlAOA, cslopewing); %clw = coefficient of lift of wing 
Cl_total = clt + clw; %cl_total = total coefficient of lift  
we = spanwise_efficiency_factor(war, tr); %we = wing spanwise efficiency factor
te = spanwise_efficiency_factor(tar, ttr); %te = tail spanwise efficiency factor
[CD_wing CD_tail] = CD_vs_AOA(we, clw, war, w_re, tratio, te, clt, warea, qcs, rmt, t_re, tarea, tqcs, tar); %#ok<NCOMMA> %CD_wing = wing coefficient of drag, CD_tail = tail coefficient of drag
Cd_total = CD_wing + CD_tail; %Calculates total coeficcient of drag 
Cl_vs_Cd(Cl_total, Cd_total); %L/D vs AOA is in this function as well but it's messed up for some reason
cmcg = C_M_CG_vs_AOA_curve(clw, clt, q, mcl, x, warea, tarea, rCG, rlt, wmac, Bwing, tr, rc, qcs, atc, CD_wing, CD_tail); %Plots coeficcient of moment about center of gravity vs angle of attack 
C_M_CG_vs_cl(cmcg, Cl_total); %Plots moment about center of gravity vs coeficcient of lift 

%Print statements
fprintf(' Atmospheric Pressure: %g \n ', p) 
fprintf('Flight Mach Number:  %g \n ', M)   
fprintf('Wing Aspect Ratio: %g \n ', war)
fprintf('Tail Aspect Ratio: %g \n ', tar)
fprintf('Wing Mean Aerodynamic Chord: %g \n', wmac)
fprintf(' Wing Reynolds Number: %g \n ', w_re)
fprintf('Wing Zero Lift Angle of Attack: %g \n ', zlAOA)
fprintf('Wing Spanwise Effciency Factor: %g \n ', we)
outofrange(M, w_re, tratio, mcl, qcs, tqcs, war, tar); 










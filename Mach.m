function M = Mach(U, T, R, y)
%this function calculates the speed of sound of air at a given altitude
%then calculates the mach number, with the given parameters 
a = sqrt(y * R * T); % a = speed of sound
M = U / a; %mach number calculation 
end
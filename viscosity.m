function visc = viscosity(T, C1, C2)
%this function calculates the viscosity of air at given altitude with the
%given parameters 
visc = C1 * ((T^1.5)/(T + C2)); 
end
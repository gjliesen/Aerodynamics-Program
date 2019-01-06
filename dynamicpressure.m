function q = dynamicpressure(U, rho)
%given the free stream speed and density this function will calculate the dynamic pressure
q = 0.5 * rho * (U^2); 
end

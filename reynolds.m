function re = reynolds(mac, visc, rho, U)
%this function calculates the reynolds number with the given paramters
re = (mac * rho * U)/(visc); 
end
function mac = mean_aerodynamic_chord(rc, tr)
%this function calculates the mean aerodynamic chord using the given
%parameters
mac = (2/3)*rc*((tr^2 + tr + 1)/(tr + 1));
end
function mcl = camber(zhi,zlo)
%this function finds point of max camber by finding zmid from the given the airfoil parameters 
i = 1; 
h = length(zhi);
mcl = (h);
while i <= h %finding point of maximum for camber ratio
    test = (zhi(i,1) + zlo(i,1))/2;
    mcl(i,1) = test; 
    i = i + 1; %iterates down column
end
end
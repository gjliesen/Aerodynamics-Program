function tratio = thickness_ratio(zhi, zlo)
%this function uses airfoil characteristics to calculate the thickness
%ratio of the airfoil
i = 1; 
tratio = 0;
while i <= length(zhi) %finding point of maximum thickness for thickness ratio
    test = (zhi(i,1) - zlo(i,1));
    if test > tratio
        tratio = test;
    end
    i = i + 1; %iterates down column
end
end
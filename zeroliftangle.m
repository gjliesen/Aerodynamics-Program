function zlAOA = zeroliftangle(mcl, x)
%use mean camber line and x to find slope then find Theta*, then
%integrate over all the panels 
h = length(mcl); 
i = 2; 
zlAOA = 0; 
t1 = 0;
while i <= h
    slope = (mcl(i,1) - mcl(i-1,1))/(x(i,1) - x(i-1,1));
    t2 = acos(1-(2*(x(i,1)))); 
    z1 = (1 / pi) * slope * (t2 - (sin(t2)) - (t1 - sin(t1))); 
    zlAOA = zlAOA + z1; 
    t1 = t2; 
    i = i + 1; 
end
end

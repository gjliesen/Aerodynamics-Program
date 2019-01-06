function p = pressure(z, To, B, g, R, T, Po) 
%This function calculates pressure given the following parameters
%it also varies it's calculation based off the given altitude
if z < 11000 %altitude below 11km
    p = Po * (1 - ((B*z)/(To)))^(g/(R*B)); %stratosphere pressure calculation 
else %altitude above 11km
    p11 = Po * (1 - ((B*11000)/(To)))^(g/(R*B)); %troposphere pressure calculation 
    p = p11 * e^((g*(11000-z))/ R*T);
end
end 
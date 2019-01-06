function T = temp(z, To, B)
%This functon calculates the temperature based off a given altitude
if z <= 11000 %stratosphere 
    T = To - (B * z); %stratosphere temp calculatin
elseif z > 11000 && z < 20000 %troposphere 
    T = To - (B * 11000); %Troposphere temperature calculation 
else %DO NOT DESIGN TO THIS HEIGHT
    disp('Error Altitude Too High'); 
    T = To;
end
end
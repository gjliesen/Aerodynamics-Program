function a = area(cr, tr, B)
%Given the root chord, taper ratio, and span, this function calculates the area of the wing and tail 
ct = cr * tr; %ct = tip chord 

a = (0.5 * (cr + ct) * B); %calculates reference area, rs)
end
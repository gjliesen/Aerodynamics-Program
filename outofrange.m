function outofrange(M, re, tratio, zmid, qcs, tqcs, war, tar)
%This function checks if any of the values are out of range, includeing
%mach number, thickness ratio, camber, reynolds number, sweep angle, and
%aspect ratio
if M > 0.3
    disp('Incompressible Limit Warning'); 
end

if re < 200000
    disp('Low Reynolds Warning'); 
end

if tratio > .15
        disp('Airfoil Thickness Warning'); 
end
i = 1; 
while i <= length(zmid)
    if zmid(i) > .1
        disp('Airfoil Cambr Warning'); 
    end
    i = i+1;
end

if war < 4 || tar < 4
    disp('Wing or Tail AR warning'); 
end
if qcs > 30 || tqcs > 30
    disp('Wing or Tail Sweep Warning!'); 
end
end 
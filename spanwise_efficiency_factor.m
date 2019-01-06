function e = spanwise_efficiency_factor(AR, TR)
%This function interpolates from the table below using the aspect ratio and
%taper ratio 
eff = [0.882, 0.907, 0.937, 0.972, 0.990;
0.909, 0.929, 0.952, 0.979, 0.993; 
0.938, 0.953, 0.969, 0.987, 0.995;
0.960, 0.970, 0.980, 0.992, 0.997;
0.942, 0.950, 0.962, 0.980, 0.991;
0.783, 0.797, 0.820, 0.865, 0.913];
y = [1; .8; .6; .4; .2; 0]; %define y axis
x = [16, 12, 8, 4, 2]; %define x axis
e = interp2(x, y, eff, AR, TR); %interpolate  
end 
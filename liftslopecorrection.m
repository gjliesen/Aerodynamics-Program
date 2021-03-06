function tau = liftslopecorrection(AR, TR)
%this function interpolates from the given Glauert correction factor table 
%and returns the lift-slope correction factor
t = [0.2956, 0.2511, 0.1952, 0.1195, 0.0682;
0.2252, 0.1908, 0.1478, 0.0901, 0.0513;
0.1527, 0.1288, 0.0991, 0.0598, 0.0338;
0.0933, 0.0789, 0.0610, 0.0369, 0.0208;
0.0939, 0.0846, 0.0715, 0.0500, 0.0318;
0.3236, 0.3091, 0.2850, 0.2343, 0.1778];
y = [1; .8; .6; .4; .2; 0]; 
x = [16, 12, 8, 4, 2]; 
tau = interp2(x, y, t, AR, TR);  
end

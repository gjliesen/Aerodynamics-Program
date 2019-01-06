function slopeA = d_correction_slope(tau, AR)
%This function calculates the correction factor for a wing using Glauert
%corrective factor and aspect ratio
slopeA = (2 * pi) / (1 + (2/AR) * (1 + tau)); 
end
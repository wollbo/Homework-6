function [space, angle] = extractPolar(state1, state2)

space = sqrt(state1^2 + state2^2);
angle = atan(state2/state1);



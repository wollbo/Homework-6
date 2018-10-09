function R = generateCovariance(state1, state2, covMatrix, sigma1, sigma2, space)

L = size(covMatrix,1)/2;


R(L,L) = sigma1*(state1/space)^2 + sigma2*state2^2;
R(L,2*L) = (sigma1/space^2 - sigma2)*state1*state2;
R(2*L,L) = R(L,2*L);
R(2*L,2*L) = sigma1*(state2/space)^2 + sigma2*state1^2;


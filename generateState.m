function newState = generateState(state, R, transMatrix)

L = size(R,1)

% (r + e_r) * cos (phi + e_phi)

mu = zeros(L, 1)

noise = mvnrnd(mu, R)
newState = transMatrix*state + noise'
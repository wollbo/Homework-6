function [xVec, yVec] = initData(model)

% model = 0 - case a), model = 1 - case b)
% updateCov = 0 - fixed covariance matrices, updateCov = 1 - time varying
% covariance matrices in Kalman




if model == 1
    [x0, R1, R2, N, T, F, H, sigmaR, sigmaV, sigmaT, sigmaP] = initStateAndMatrices(model);
else
    [x0, R1, R2, N, T, F, H] = initStateAndMatrices(model);
end

x = x0;
xVec = zeros(N, 4);
yVec = zeros(N, 2);
R1Vec = zeros(N, 4, 4);
R2Vec = zeros(N, 2, 2);

R10 = R1;
R20 = R2;

for i = 1:N
    % generate y_k
    % generate x_k+1
    
    x = generateState(x, R1, F);
    y = generateState(x, R2, H);
    
    % save (x,y), R1, R2
    xVec(i,:) = x;
    yVec(i,:) = y;
    R1Vec(i,:,:) = R1;
    R2Vec(i,:,:) = R2;
    % update R1, R2
    [r, ~] = extractPolar(x(1), x(3));
    [v, ~] = extractPolar(x(2), x(4));
    if model == 1
        R1 = generateCovariance(x(2), x(4), R1, sigmaV, sigmaT, v);
        R2 = generateCovariance(x(1), x(3), R2, sigmaR, sigmaP, r);
    end
end

    
    


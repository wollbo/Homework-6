%%% Plot 1c) %%%



sign = 1
if sign == 1
    [x0, R1, R2, N, T, F, H, sigmaR, sigmaV, sigmaT, sigmaP] = initStateAndMatrices(sign);
else
    [x0, R1, R2, N, T, F, H] = initStateAndMatrices(sign);
end

x = x0;
xVec = zeros(N, 4);
yVec = zeros(N, 2);
for i = 1:N
    % generate y_k
    % generate x_k+1
    y = generateState(x, R2, H);
    x = generateState(x, R1, F);
    % save (x,y)
    xVec(i,:) = x;
    yVec(i,:) = y;
    % update R1, R2
    [r, ~] = extractPolar(x(1), x(3));
    [v, ~] = extractPolar(x(2), x(4));
    R1 = generateCovariance(x(2), x(4), R1, sigmaV, sigmaT, v);
    R2 = generateCovariance(x(1), x(3), R2, sigmaR, sigmaP, r);
    
end

plot(xVec(:,1),xVec(:,3), yVec(:,1), yVec(:,2))
legend('True State', 'Measurement')
    
    
    


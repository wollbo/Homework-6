function [xVec, xhatAll] = kalmanImplement(model, updateCov, P0, x0)

% VARNING
if model == 1
    [x0, R1, R2, N, T, F, H, sigmaR, sigmaV, sigmaT, sigmaP] = initStateAndMatrices(model);
else
    [x0, R1, R2, N, T, F, H] = initStateAndMatrices(model);
end

[xVec, yVec] = initData(model);

yk = yVec';
Pkm1plus = P0;
xhatkm1plus = x0;

% Perfekta R - R1k = R1vec


R1k = zeros(N, 4, 4);
R2k = zeros(N, 2, 2);


for k = 1:N
    
    if updateCov == 1
        % generate new covMatrix from xhat
        [v, ~] = extractPolar(xhatkm1plus(2), xhatkm1plus(4));
        R1k(k,:,:) = generateCovariance(xhatkm1plus(2), xhatkm1plus(4), R1k(k,:,:), sigmaV, sigmaT, v);
    
        [r, ~] = extractPolar(xhatkm1plus(1), xhatkm1plus(3));
        R2k(k,:,:) = generateCovariance(xhatkm1plus(1), xhatkm1plus(3), R2k(k,:,:), sigmaR, sigmaP, r);
    else
        R1k(k,:,:) = 0.1*eye(4);
        R2k(k,:,:) = 5*eye(2);
    end
    Pkminus = F * Pkm1plus * F.' + squeeze(R1k(k,:,:));
    xhatkminus = F * xhatkm1plus;
    
    Rek = H * Pkminus * H.' + squeeze(R2k(k,:,:));
    Kk = Pkminus * H.' / Rek;
    
    ek = yk(:,k) - H * xhatkminus;
    xhatkplus = xhatkminus + Kk * ek;
    
    Pkplus = (eye(size(xhatkminus, 1)) - Kk * H) * Pkminus;
    
    %Save data
    xhatAll(k, :) = xhatkplus;
    
    %k <= k+1
    xhatkm1plus = xhatkplus;
    Pkm1plus = Pkplus;
end


%plot(xVec(:,1),xVec(:,3), xhatAll(:,1), xhatAll(:,3), yk(1,:), yk(2,:), 'Linewidth', 2)
%legend('True State', 'Filtered Estimate', 'Measured State')
%plotTrajectory(xVec(:,1),xVec(:,3), yVec(1,:), yVec(2,:), sign)
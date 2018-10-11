function [xVec, xhatAll] = kalmanStationary(P0, x0)

[~, R1, R2, N, T, F, H] = initStateAndMatrices(0);
[xVec, yVec] = initData(0);

yk = yVec';
Pkm1plus = P0;
xhatkm1plus = x0;

[P,L,K] = dare(F',H',R1,R2);

P = P';
K = K';

for k = 1:N
    
    xhatkminus = F * xhatkm1plus;
    
    ek = yk(:,k) - H * xhatkminus;
    xhatkplus = xhatkminus + K * ek;
    
    xhatAll(k, :) = xhatkplus;
    
    % k -> k+1
    xhatkm1plus = xhatkplus;
end








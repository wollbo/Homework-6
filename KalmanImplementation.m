%%% KalmanImplementation %%%

%PlotConstant

yk = yVec';
Pkm1plus = 1000*eye(4);
xhatkm1plus = [10 1 20 2]';

R1k = R1Vec;
R2k = R2Vec;

for k = 1:N
    
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

plot(xVec(:,1),xVec(:,3), xhatAll(:,1), xhatAll(:,3), yk(1,:), yk(2,:))
legend('True State', 'Filtered Estimate', 'Measured State')
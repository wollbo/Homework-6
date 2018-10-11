%%% Problem2a %%%

%%% AverageErrorLoop %%%

lim = 10000; % number of runs
N = 100; % length of each run
errorVec = zeros(N,lim);
model = 0; % real model a) or b)
updateCov = 0; % covariance for the filter - update 1 or constant 0
P0 = 1000*eye(4); % init P0
x0 = [10 1 20 2]'; % init x0

meanError = zeros(N,2);


for i = 1:lim
    [sVec, shatAll] = kalmanStationary(P0, x0);
    errorVec(:,i) = vecnorm(sVec'-shatAll');
    i;
end

errorVec = squeeze(errorVec);
meanError(:,1) = mean(errorVec, 2);

errorVec = zeros(N,lim);
for j = 1:lim
    [xVec, xhatAll] = kalmanImplement(model, updateCov, P0, x0);
    errorVec(:,j) = vecnorm(xVec'-xhatAll');
    j;
end

meanError(:,2) = mean(squeeze(errorVec), 2);

%%

fig = figure('Name', 'HomeworkFigures/DifferenceInError2a)_lim=' + string(lim))

plot(meanError(:,1), 'Linewidth', 2)
hold on
plot(meanError(:,2), 'Linewidth', 2)
box off
grid on
legend('Stationary Filter', 'Constant Covariance')
printToPdf(fig)
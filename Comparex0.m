%%% Comparex0 %%%
lim = 1000; % number of runs
N = 100; % length of each run
errorVec = zeros(N,lim);
model = 1; % b)
updateCov = 0; % update covariance or no THIS SHOULD BE CHANGED in b)
P0 = 10*eye(4); % init P0
x0 = [10 1 20 2]'; % init x0

testVec = [10^-2 10^-1 10^0 5 20];

for i = 1:length(testVec)
for j = 1:lim
    xm = x0;
    xm(1) = xm(1)*testVec(i);
    xm(3) = xm(3)*testVec(i);
    [xVec, xhatAll] = kalmanImplement(model, updateCov, P0, xm);
    errorVec(:,j) = vecnorm(xVec'-xhatAll');
    j;
end
meanError(:,i) = mean(errorVec, 2);
end

%%
close all
fig = figure('Name', 'HomeworkFigures/DifferenceInx02b)_model=' + string(updateCov) + '_lim=' + string(lim) + '_P0=' + string(P0(1,1)))

for i =1:length(testVec)
    plot(meanError(:,i), 'Linewidth', 2)
    hold on
end
box off
grid on
legend('x0 amp = ' + string(testVec))
printToPdf(fig)

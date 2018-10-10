%%% AverageErrorLoop %%%

lim = 1000; % number of runs
N = 100; % length of each run
errorVec = zeros(N,1,lim);


for j = 1:lim
    KalmanImplementation;
    errorVec(:,:,j) = vecnorm(xVec'-xhatAll');
    j
end

errorVec = squeeze(errorVec);
meanError = mean(errorVec, 2);

%%
close all
fig = figure('Name', 'HomeworkFigures/AverageErrorOverTime');

plot(meanError, 'Linewidth', 2)
hold on
plot(errorVec(:,506), 'Linewidth', 2)
box off
grid on
legend('Average Estimation Error', 'Estimation Error')

printToPdf(fig)
%plotEstimationErrorOverTime(xVec', xhatAll')

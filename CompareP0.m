%%% CompareP0 %%%

lim = 1000; % number of runs
N = 100; % length of each run
errorVec = zeros(N,lim);
model = 1; % b)
updateCov = 0; % 
P0 = 10000*eye(4); % init P0
x0 = [10 1 20 2]'; % init x0

testVec = [10^-4 10^-2 10^0 10^2 10^4];

for i = 1:length(testVec)
for j = 1:lim
    [xVec, xhatAll] = kalmanImplement(model, updateCov, testVec(i)*eye(4), x0);
    errorVec(:,j) = vecnorm(xVec'-xhatAll');
    j;
end
meanError(:,i) = mean(errorVec, 2);
end

%%
close all
fig = figure('Name', 'HomeworkFigures/DifferenceInP02b)_model=' + string(updateCov) + '_lim=' + string(lim))

for i =1:length(testVec)
    plot(meanError(:,i), 'Linewidth', 2)
    hold on
end
box off
grid on
legend('P0 = ' + string(testVec), 'Location', 'southeast')
printToPdf(fig)

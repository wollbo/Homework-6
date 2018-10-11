%%% CompareP0a) %%%

lim = 1000; % number of runs
N = 100; % length of each run
errorVec = zeros(N,lim);
model = 0; %rename constantCov
updateCov = 0;
P0 = 1*eye(4); % init P0
x0 = [10 1 20 2]'; % init x0

testVec = [10^-4 10^-2 10^0 10^2 10^4];
meanError = zeros(N,length(testVec),2);
for m = 1:length(testVec)
for i = 1:lim
    [sVec, shatAll] = kalmanStationary(P0, x0);
    errorVec(:,i) = vecnorm(sVec'-shatAll');
    i;
end

errorVec = squeeze(errorVec);
meanError(:,m,1) = mean(errorVec, 2);

errorVec = zeros(N,lim);
for j = 1:lim
    [xVec, xhatAll] = kalmanImplement(model, updateCov, P0, x0);
    errorVec(:,j) = vecnorm(xVec'-xhatAll');
    j;
end

meanError(:,m,2) = mean(squeeze(errorVec), 2);
end

%%

statOrConst = 2 % 1 or 2, 1 means stat, 2 means const

close all
fig = figure('Name', 'HomeworkFigures/DifferenceInP02a)_model=' + string(model) + '_lim=' + string(lim) + '_x01=' + string(x0(1)) + '_x03=' + string(x0(3)) + '_statOrConst=' + string(statOrConst))

for i =1:length(testVec)
    plot(meanError(:,i,statOrConst), 'Linewidth', 2)
    hold on
end
box off
grid on
legend('P0 = ' + string(testVec), 'Location', 'southeast')
printToPdf(fig)

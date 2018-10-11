%%% Comparex0a %%%
lim = 1000; % number of runs
N = 100; % length of each run
errorVec = zeros(N,lim);
model = 0;
updateCov = 0;
P0 = 1000*eye(4); % init P0 default 1000
x0 = [10 1 20 2]'; % init x0

testVec = [10^-2 10^-1 10^0 2 5];
meanError = zeros(N,length(testVec),2);
for m = 1:length(testVec)
for i = 1:lim
    xm = x0;
    xm(1) = xm(1)*testVec(m);
    xm(3) = xm(3)*testVec(m);
    [sVec, shatAll] = kalmanStationary(P0, xm);
    errorVec(:,i) = vecnorm(sVec'-shatAll');
    i;
end

errorVec = squeeze(errorVec);
meanError(:,m,1) = mean(errorVec, 2);

errorVec = zeros(N,lim);
for j = 1:lim
    
    xm = x0;
    xm(1) = xm(1)*testVec(m);
    xm(3) = xm(3)*testVec(m);
    [xVec, xhatAll] = kalmanImplement(model, updateCov, P0, xm);
    errorVec(:,j) = vecnorm(xVec'-xhatAll');
    j;
end

meanError(:,m,2) = mean(squeeze(errorVec), 2);
end


%%
close all
statOrConst = 2
fig = figure('Name', 'HomeworkFigures/DifferenceInx02a)_model=' + string(covVarying) + '_lim=' + string(lim) + '_P0=' + string(P0(1,1)) + '_statOrConst=' + string(statOrConst))

for i =1:length(testVec)
    plot(meanError(:,i,statOrConst), 'Linewidth', 2)
    hold on
end
box off
grid on
legend('P0 = ' + string(testVec), 'Location', 'northeast')
printToPdf(fig)

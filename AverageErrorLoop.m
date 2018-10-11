%%% AverageErrorLoop %%%

lim = 10000; % number of runs
N = 100; % length of each run
errorVec = zeros(N,lim);
model = 1; % real model a) or b)
updateCov = 1; % covariance for the filter - update 1 or constant 0
P0 = 1000*eye(4); % init P0
x0 = [10 1 20 2]'; % init x0

meanError = zeros(N,2);
for ii = 0:1

for j = 1:lim
    [xVec, xhatAll] = kalmanImplement(1, ii, P0, x0);
    errorVec(:,j) = vecnorm(xVec'-xhatAll');
    j
end

errorVec = squeeze(errorVec);
meanError(:,ii+1) = mean(errorVec, 2);
end
%%
Problem2b
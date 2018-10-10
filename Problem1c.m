%%% Problem1c %%%

model = 1 % a 0 eller b 2
fig = figure('Name', 'HomeworkFigures/AverageErrorOverTimeb)varCov')
[xVec, yVec] = initData(model)
plotTrajectory(xVec(:,1), xVec(:,3), yVec(:,1), yVec(:,2), model)

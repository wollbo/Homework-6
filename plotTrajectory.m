function plotTrajectory(trueTraj1, trueTraj2, measTraj1, measTraj2, cases)

if cases == 1
    fig = figure('Name', 'HomeworkFigures/trajectoryVarying');
else
    fig = figure('Name', 'HomeworkFigures/trajectoryConstant');
end

plot(trueTraj1, trueTraj2, measTraj1, measTraj2, 'Linewidth', 2);


box off
grid on
legend('True Trajectory', 'Measured Trajectory')

%printToPdf(fig);
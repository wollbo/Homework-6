function plotEstimationErrorOverTime(estPos, truePos)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

fig = figure('Name', 'HomeworkFigures/estimationErrorOverTime');

norms = vecnorm(estPos - truePos);
plot(norms, 'Linewidth', 2);

%set(gca, 'YScale', 'log')
box off
grid on
legend('Estimation Error')

printToPdf(fig);
end
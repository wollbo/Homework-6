%%% Problem2b) %%%

fig = figure('Name', 'HomeworkFigures/DifferenceInError2b)lim=_' + string(lim))

plot(meanError(:,2), 'Linewidth', 2)
hold on
plot(meanError(:,1), 'Linewidth', 2)
box off
grid on
legend('Updating Covariance', 'Constant Covariance')
printToPdf(fig)
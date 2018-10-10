%%% Problem2b) %%%

fig = figure('Name', 'HomeworkFigures/DifferenceInError2b)')

plot(meanError(:,1), 'Linewidth', 2)
hold on
plot(meanError(:,2), 'Linewidth', 2)
box off
grid on
legend('Constant Covariance', 'Updating Covariance')
%printToPdf(fig)
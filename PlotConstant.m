%%% PlotConstant %%%


sign = 0
[x0, R1, R2, N, T] = initStateAndMatrices(sign);

%%

x = x0
systemPair = zeros(N, 2)
for i = 1:N
    % generate x
    x = generateState(x, R1)
    % generate y
    y = generateState(y, R2)
    % save (x,y)
    systemPair(i,:) = (x,y)
end

plot(systemPair(:,1), systemPair(:,2))
    
    
    


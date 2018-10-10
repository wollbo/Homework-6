function [x, R1, R2, N, T, F, H, sigmaR, sigmaV, sigmaT, sigmaP] = initStateAndMatrices(option1)

x = [10, 1, 20, 2]';

N = 100;

T = 1;

F = [1 T 0 0,
    0 1 0 0,
    0 0 1 T,
    0 0 0 1];

H = [1 0 0 0,
    0 0 1 0];

R1 = zeros(4);
R2 = zeros(2);

[r, phi] = extractPolar(x(1), x(2));

[v, theta] = extractPolar(x(3), x(4));



if option1 == 1
    
    sigmaV = 0.01;
    sigmaT = 0.01;
    sigmaR = 1;
    sigmaP = 0.1;
    
    R1(2,2) = sigmaV*(x(2)/v)^2 + sigmaT*x(4)^2;
    R1(2,4) = (sigmaV/v^2 - sigmaT)*x(2)*x(4);
    R1(4,2) = R1(2,4);
    R1(4,4) = sigmaV*(x(4)/v)^2 + sigmaT*x(2)^2;
    
    R2(1,1) = sigmaR*(x(1)/r)^2 + sigmaP*x(3)^2;
    R2(1,2) = (sigmaR/r^2-sigmaP)*x(1)*x(3);
    R2(2,1) = R2(1,2);
    R2(2,2) = sigmaR*(x(3)/r)^2 + sigmaP*x(1)^2;
    


else
    
    R1 = 0.1*eye(4);
    R2 = 5*eye(2);
    
end


end


%% initial guess at tFinal
tFinal = 2.75; 
%% tau goes from 0 to 1
tau = 0:0.02:1;

%% initial x 
x0 = 4.9;

%% initial y
y0 = 1.66;

%% initial guess at control time history
theta0 = ones(length(tau),1)*(255/57.3);

%% initial guess at final time
theta0(end+1) = tFinal;

%% lower bound on control
lB = ones(length(tau),1)*(-2*pi);

%% upper bound on control
uB = ones(length(tau),1)*pi*2;

%% lower bound on final time
lB(end+1) = 1;

%% upper bound on final time
uB(end+1) = 30;

options = optimset('Display','iter','TolCon',1e-4,'Algorithm','interior-point','PlotFcns','optimplotx','MaxFunEvals',4500);

[thetaFinal, cost] = fmincon('zermeloCost', theta0,[],[],[],[],[],[],'zermeloConstraint',options);

%% optimized final time
tFinal = thetaFinal(end);

%% Optimal time history with optimal control and final time
[tOut,yOut] = sim('zermelo',1,[],[tau' thetaFinal(1:end-1)]);

%% phase plane plot
figure
plot(yOut(:,1),yOut(:,2));
title('phase plane plot');
grid;
xlabel('x');
ylabel('y');

%% plot of optimal control as a function of actual time
figure
plot(tau*tFinal, thetaFinal(1:end-1)*57.3);
xlabel('Final Time');
ylabel('Final Theta in deg');
grid;
s = sprintf('Final Time = %5.3f seconds', tFinal);
title(s)

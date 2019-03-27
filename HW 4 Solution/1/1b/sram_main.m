tfinal = 40 / 100;
tau = 0:0.02:1;

CL=ones(length(tau),1)*(-0.2);
CL(end+1) = tfinal;

lb=ones(length(tau),1)*(-pi);
ub=ones(length(tau),1)*pi;
lb(end+1)=0.01;
ub(end+1)=1;

options = optimset('Display','iter','TolCon',1e-3,'Algorithm','interior-point','PlotFcns','optimplotx','MaxFunEvals',2500);

[CL_final, cost] = fmincon('sram_cost', CL,[],[],[],[],lb,ub,'sram_constraint',options);

tfinal=CL_final(end);
[tout,yout]=sim('SRAM',1,[],[tau' CL_final(1:end-1)]);
figure
plot(yout(:,1)/6076,yout(:,2));grid;xlabel('X, nm');ylabel('h');
figure
plot(tau*CL_final(end)*100,CL_final(1:end-1));xlabel('Time, sec');ylabel('Final CL');grid
figure
plot(tau*CL_final(end)*100,yout(:,4));xlabel('Time, sec');ylabel('Velocity, ft/sec');grid
plot(tau*CL_final(end)*100,yout(:,3)*57.3);xlabel('Time, sec');ylabel('Flight path angle in degrees');grid

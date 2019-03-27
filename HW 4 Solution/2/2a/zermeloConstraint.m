function [cineq, ceq] = zermeloConstraint(p)

cineq = [];
assignin('base','tFinal', p(end));
tau = [0:0.02:1]';
u = [p(1:end-1)];

[tOut,yOut] = sim('zermelo',1,[],[tau u]);

ceq(1) = yOut(end,1);
ceq(2) = yOut(end,2);
end
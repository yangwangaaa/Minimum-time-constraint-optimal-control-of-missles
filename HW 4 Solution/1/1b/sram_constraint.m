function [cineq, ceq] = sram_constraint(p)

cineq = [];
assignin('base', 'tfinal', p(end));

tau=[0:0.02:1]';
u=[p(1:end-1)];

[tout,yout]=sim('SRAM',1,[],[tau u]);

ceq(1) = (yout(end,1) - 72*6076) / 500000;
ceq(2) = yout(end,2) / 100000;

end
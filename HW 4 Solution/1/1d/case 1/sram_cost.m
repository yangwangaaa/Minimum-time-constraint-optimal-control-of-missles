function y = sram_cost(p)

assignin('base', 'tfinal', p(end));

tau=[0:0.02:1]';
u=[p(1:end-1)];

[tout,yout]=sim('SRAM',1,[],[tau u]);

y = p(end);
end
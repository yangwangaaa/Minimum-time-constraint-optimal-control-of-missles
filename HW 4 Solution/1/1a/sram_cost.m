function y = sram_cost(p)

assignin('base', 'tfinal', p(end));

tau=[0:0.02:1]';
u=[p(1:end-1)];

[tout,yout]=sim('SRAM',1,[],[tau u]);

y = 0.0 - yout(end,4) / 11000; % maximum final velocity
end
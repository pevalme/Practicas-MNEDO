% Constantes
T = 20;
mu = 0.1;
M = 200;
incX = 2*pi/M;
vectorEspacio = -pi:incX:pi;
vectorEspacio(end) = [];

% Dato inicial.
u0 = sin(vectorEspacio);

[t,y] = ode45(@f, 0:2:T, u0);
figure(1); hold all;
for index=1:length(t)
	plot(vectorEspacio,y(index,:)),hold on;
end

[t,y] = ode23s(@f, 0:2:T, u0);
legend_strs = cell(length(t),1);
for index=1:length(t)
	plot(vectorEspacio,y(index,:)),hold on;
	legend_strs{index} = ['t=',num2str(t(index))];
end

[t,y] = ode23d(@f, 0:2:T, u0);
legend_strs = cell(length(t),1)
for index=1:length(t)
	plot(vectorEspacio,y(index,:)),hold on;
	legend_strs{index} = ['t=',num2str(t(index))];
end

legend(legend_strs, 'Location', 'northeast');
% Inicializamos nuestro problema de valor inicial
u0 = [2: 3];
t0 = 0;
tf = 1;
N = 50;

% Empleamos el método de Euler
[u,t] = euler(@f, N, t0, tf, u0);

% Pintamos el resultado
figure(1); hold all;
plot(u(1,:),u(2,:)); hold all;

% Solución exacta
sol = result(t);
% Pintamos esta solución en la misma gráfica que
% el resultado de Euler para compararlas
figure(1); hold all;
plot(sol(1,:),sol(2,:)); hold all;

% Vamos a estudiar cómo se comporta el método de
% Euler.
for N=500:50:1000
	h((N-500)/50+1)=(tf-t0)/N;
	% Euler
	[u,t] = euler(@f, N, t0, tf, u0);
	sol = result(t);
	diferencia(1,(N-500)/50+1)=norm((u-sol),1);
end

pendiente(1)=mean(diff(log(diferencia(1,:)))./diff(log(h)));

figure(2); loglog(h,diferencia); title(['La pendiente es =', num2str(pendiente)]);
hold all;
loglog(h,h);

% La pendiente que obtenemos es justo el orden del método.
% Sabemos que e \leq ch para cierta constante c
% En general tendremos e \leq ch^p
% como en este caso hemos obtenido una pendiente 1 al graficar los logaritmos, es decir, que la función log(e) \leq pc\log(h). La pendiente en la fórmula sería p, y nos ha salido 1. ergo la pendiente es 1.


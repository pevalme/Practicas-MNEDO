% Inicializamos nuestro problema de valor inicial
u0 = [2: 3];
t0 = 0;
tf = 10;
N = 500;
r = 0.05

% Empleamos el método de Runge Kutta explícito.
[u,t] = trapecio(@f,tf,t0,N,u0,r);

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
% RK4.
% Representamos mediante gráficas doblemente logarítmicas
% las poligonales (1/k,error)
for N=500:50:1000
	h((N-500)/50+1)=(tf-t0)/N;
	% RK4
	[u,t] = trapecio(@f,tf,t0,N,u0,r);
	sol = result(t);
	diferencia(1,(N-500)/50+1)=norm((u-sol),1);
end

pendiente(1)=mean(diff(log(diferencia(1,:)))./diff(log(h)));

figure(2); loglog(h,diferencia); title(['La pendiente es =', num2str(pendiente)]);
hold all;

% La pendiente que obtenemos es justo el orden del método.
% Sabemos que e \leq ch para cierta constante c
% En general tendremos e \leq ch^p
% como en este caso hemos obtenido una pendiente 1 al graficar los logaritmos, es decir, que la función log(e) \leq pc\log(h). La pendiente en la fórmula sería p, y nos ha salido 1. ergo la pendiente es 1.


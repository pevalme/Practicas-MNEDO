% Inicializamos nuestro problema de valor inicial
u0 = [500,2,0];
t0 = 0;
tf = 10;
N = 500;

disp("Apartado a)");
% Empleamos el método de Euler
[u,t] = Euler(@f, N, t0, tf, u0);
disp("Euler=>[S,Z,R]="),disp(u(:,N)');

% Empleamos el método Adams-Moulton
[u,t] = AdamsMoulton(@f, tf, t0, N, u0);

disp("Adams-Moulton=>[S,Z,R]="),disp(u(:,N)');

disp("Apartado b)");

for t=(t0+1):tf
	[u,t] = AdamsMoulton(@f,t,t-1,N/(tf-t0),u0);
	u0 = u(:,N/(tf-t0))';
	u0 += [0,-u0(2)/2,u0(2)/2];
end

disp("Adams-Moulton => [S,Z,R]"),disp(u(:,N/(tf-t0))');

for t=(t0+1):tf
	[u,t] = Euler(@f,N/(tf-t0),t-1,t,u0);
	u0 = u(:,N/(tf-t0))';
	u0 += [0,-u0(2)/2,u0(2)/2];
end

disp("Euler => [S,Z,R]"),disp(u(:,N/(tf-t0))');
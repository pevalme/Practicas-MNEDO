% Inicializamos nuestro problema de valor inicial
u0 = [500,2,0];
t0 = 0;
tf = 10;
N = 500;

disp("Apartado a)");
% Empleamos el método de Euler
[u,t] = Euler(@f, N, t0, tf, u0);

figure(1); hold all;
title(['Euler']);
plot(t,u(1,:)); hold all;

figure(1); hold all;
plot(t,u(2,:)); hold all;

figure(1); hold all;
plot(t,u(3,:)); hold all;

disp("Euler=>[S,Z,R]="),disp(u(:,N)');

% Empleamos el método Adams-Moulton
[u,t] = AdamsMoulton(@f, tf, t0, N, u0);
t(end) = [];

figure(2); hold all;
title(['Adams Moulton']);
plot(t,u(1,:)); hold all;

figure(2); hold all;
plot(t,u(2,:)); hold all;

figure(2); hold all;
plot(t,u(3,:)); hold all;

disp("Adams-Moulton=>[S,Z,R]="),disp(u(:,N)');

disp("Apartado b)");

% Para no borrar el dato inicial:
uAux = u0;
for t=(t0+1):tf
	[u,t] = Euler(@f,N/(tf-t0),t-1,t,uAux);

	figure(4); hold all;
	title(['Euler matanza nocturna']);
	plot(t,u(1,:),'r'); hold all;

	figure(4); hold all;
	plot(t,u(2,:),'b'); hold all;

	figure(4); hold all;
	plot(t,u(3,:),'g'); hold all;

	uAux = u(:,N/(tf-t0))';
	uAux += [0,-uAux(2)/2,uAux(2)/2];
end

disp("Euler => [S,Z,R]"),disp(u(:,N/(tf-t0))');

% Para no borrar el dato inicial:
uAux = u0;
for t=(t0+1):tf
	[u,t] = AdamsMoulton(@f,t,t-1,N/(tf-t0),uAux);
	t(end) = [];
	figure(3); hold all;
	title(['Adams Moulton matanza nocturna']);
	plot(t,u(1,:),'r'); hold all;

	figure(3); hold all;
	plot(t,u(2,:),'b'); hold all;

	figure(3); hold all;
	plot(t,u(3,:),'g'); hold all;

	uAux = u(:,N/(tf-t0))';
	uAux += [0,-uAux(2)/2,uAux(2)/2];
end

disp("Adams-Moulton => [S,Z,R]"),disp(u(:,N/(tf-t0))');

disp("Comprobamos que el dato inicial sigue siendo: "),disp(u0);

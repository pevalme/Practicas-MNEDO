% Inicializamos nuestro problema de valor inicial
u0 = [500,2,0];
t0 = 0;
tf = 10;
N = 500;

% Empleamos el método de Euler
[u,t] = Euler(@f, N, t0, tf, u0);
disp("Euler=>[S,Z,R]="),disp(u(:,N)');

% Empleamos el método Adams-Moulton
[u,t] = AdamsMoulton(@f, tf, t0, N, u0);

disp("Adams-Moulton=>[S,Z,R]="),disp(u(:,N)');


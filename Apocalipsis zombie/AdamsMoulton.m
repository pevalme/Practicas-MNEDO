function [u,t]=AdamsMoulton(f,tf,t0,N,u0)
% 
% Esta función implementa el método numérico Adams-Moulton de dos pasos
% para resolver el problema de valor inicial:
%	u'=f(t,u)
%	u(0)=u0
%
% Argumentos:
%	f: Vector columna. Función que rige el sistema
%	N: numero de pasos en los que dividimos el intervalo de integración
%	t0: tiempo inicial
%	tf: tiempo final
%	u0: valor inicial

	% Calculamos la longitud del incremento en cada iteración
	h = (tf-t0)/N;
	t = [t0:h:tf];

	% Puesto que el método de Adams-Moulton es implícito, emplearemos el
	% método de Adams-Bashforth para predecir el valor de y_{n+2}

	s = length(u0);
	% Creamos una matriz con dos vectores columnas donde guardaremos los u_i
	% que vayamos calculando
	u = zeros(s,N);

	% Inicializamos k con el valor inicial:
	u(:,1) = u0;
	u(:,2) = u(:,1) + f(t0,u0); % Comprobar si esta es la forma correcta de calcular este valor.

	% Inicializamos la variable donde guardaremos la aproximación de k_{n+2} 
	% con ceros
	kApprox = zeros(s,1);

	for n=1:N-2
		% Para cada k_n debemos precedir k_{n+2}
		kApprox = u(:,n+1) + h/2*(3*f(t(n+1),u(:,n+1))-f(t(n),u(:,n)));
		% Trabajamos con el valor predico y obtenemos el valor que vamos a usar
		u(:,n+2) = u(:,n+1) + h/12*(5*f(t(n+2),kApprox)+8*f(t(n+1),u(:,n+1))-f(t(n),u(:,n)));
	end


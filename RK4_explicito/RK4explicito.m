function [u,t]=RK4explicito(f,tf,t0,N,u0,b,c,A)
%
% Esta función va a implementar un método Runge Kutta explícito para
% resolver el problema de valor inicial:
%	u'=f(t,u)
%	u(0)=u0
%
% Argumentos:
%	f: Vector columna. Función que rige el sistema
%	N: numero de pasos en los que dividimos el intervalo de integración
%	t0: tiempo inicial
%	tf: tiempo final
%	u0: valor inicial
%	b,c,A: parámetros del método Runge Kutta
%
% Variables de salida

	h = (tf-t0)/N;
	t=[t0:h:tf];

	% Como siempre esta declaración no es necesaria pero matlab
	% es más rápido si parte de una matiz ya creada.
	u=zeros(length(u0),length(t));
	u(:,1)=u0;

	s=length(b);
	k=zeros(length(u0),s);

	for n=1:N
		k(:,1)=f(t(n),u(:,n));
		for i=2:s
			% En la siguiente linea nos apoyamos en que el método es explícito
			% logrando así un ahorro en el número de operaciones.
			k(:,i)=f(t(n)+c(i)*h,u(:,n)+h*k(:,1:i-1)*transpose(A(i,1:i-1)));
		end
		u(:,n+1)=u(:,n)+h*k*b;
	end

end


function [u,t]=RK4implicito(f,tf,t0,N,u0,b,c,A,tol)
%
% Esta función va a implementar un método Runge Kutta implicito para
% resolver el problema de valor inicial:
%	u'=f(t,u)
%	u(0)=u0
% Argumentos:
%	f: Vector columna. Función que rige el sistema
%	N: numero de pasos en los que dividimos el intervalo de integración
%	t0: tiempo inicial
%	tf: tiempo final
%	u0: valor inicial
%	b,c,A: parámetros del método Runge Kutta
%   tol: tolerancia empleada para aproximar cada K_i por punto fijo

	h = (tf-t0)/N;
	t=[t0:h:tf];

	% Como siempre esta declaración no es necesaria pero matlab
	% es más rápido si parte de una matiz ya creada.
	u=zeros(length(u0),length(t));
	u(:,1)=u0;

	s=length(b); % Vemos cuantas K tendremos que generar
	k=zeros(length(u0),s);
	kAux=zeros(length(u0),s);

	for n=1:N
		% Para cada K debemos emplear el metodo de punto fijo para
		% encontrar el valor de K_i.

		% Definimos el K inicial sobre el que iterar.
		for i=1:s
			k(:,i)=f(t(n),u(:,n));
		end

		% Definimos un error inicial que nos asegure entrar en el bucle
		err=tol+1;
		while(err>tol*s)
			% Calculamos la primera iteracion de todas las K_i
			for i=1:s
				kAux(:,i)=f(t(n)+c(i)*h,u(:,n)+h*k*transpose(A(i,:)));		
			end

			% Vemos que diferencia hay entre las K_i de la iteracion anterior y 
			% las que acabamos de calcular:
			err=0;
			for i=1:s
				err+=norm(kAux(:,i)-k(:,i));
			end

			k(:,i)=kAux(:,i);

		endwhile
		u(:,n+1)=u(:,n)+h*k*b;
	end
end


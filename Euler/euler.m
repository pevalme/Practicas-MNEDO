function [u,t]=euler(f,N,t0,T,u0)
	% Esta función resuelve el problema de valor inicial:
	%
	% u(t0)=u0
	%
	% Variables de entrada
	% f: Vector columna. Función que rige el sistema EDO
	% N: Número de medidas que queremos hacer en el intervalo
	% a estudiar
	% t0: Tiempo inicial
	% T: Tiempo final en el que parar de iterar
	% u0: Valor de la función en t0

	% Definimos el paso
	h = (T-t0)/N;
	% Definimos u y t
	t = [t0:h:T];
	u=zeros(length(u0),length(t));
	% Identificamos el dato inicial
	u(:,1)=u0;
	% Calculamos sucesivas u_{n} empleando la relación de Euler
	for n=1:N
		u(:,n+1)=u(:,n)+h*f(t(n),u(:,n));
	end
end
function [u,t]=trapecio(f,tf,t0,N,u0,r)
%
% Esta función va a implementar un método del trapecio para
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
%	r: tolerancia
%
% Variables de salida

	h=(tf-t0)/N;
	t=[t0:h:tf];

	% Como siempre esta declaración no es necesaria pero matlab
	% es más rápido si parte de una matiz ya creada.
	u=zeros(length(u0),length(t));
	u(:,1)=u0;

	for n=1:N
		% Variable auxiliar donde guardaremos los valores necesarios
		% para aproximar u_n por el método del punto fijo.
		b1=zeros(length(u0),1);
		b0=u(:,n);
		err=r+1;
		while (err>r)
		  b1=u(:,n)+h/2*(f(t(n),u(:,n))+f(t(n+1),b0));
		  err=abs(b1-b0);
		  b0=b1;
		endwhile

		u(:,n+1)=u(:,n)+h/2*(f(t(n),u(:,n))+f(t(n+1),b1));
	end
end


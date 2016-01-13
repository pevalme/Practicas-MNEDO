function y=f(t,v)
% v,y son vectores columna de dimensión 3
% t es un escalar

	% Constantes
	mu = 0.1;
	M = 200;
	incX = 2*pi/M;

	% Inicializamos con 0s para que octave/matlab
	% trabaje más rápido.
	y = zeros(M,1);

	% Hacemos manualmente los dos primeros pasos
	y(1) = v(1)*(v(1+1)-v(M))/(2*incX)+mu*(v(1+2)-2*v(1)+v(M-1))/(4*incX*incX);
	y(2) = v(2)*(v(2+1)-v(2-1))/(2*incX)+mu*(v(2+2)-2*v(2)+v(M))/(4*incX*incX);

	for index=3:1:M-2
		y(index) = v(index)*(v(index+1)-v(index-1))/(2*incX)+mu*(v(index+2)-2*v(index)+v(index-2))/(4*incX*incX);
	end

	% Hacemos manualmente los dos últimos pasos
	y(M-1) = v(M-1)*(v(M-1+1)-v(M-1-1))/(2*incX)+mu*(v(1)-2*v(M-1)+v(M-1-2))/(4*incX*incX);
	y(M) = v(M)*(v(1)-v(M-1))/(2*incX)+mu*(v(2)-2*v(M)+v(M-2))/(4*incX*incX);

end

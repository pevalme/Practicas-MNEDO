function y=f(t,v)
% v,y son vectores columna de dimensión 3
% t es un escalar

	% a,b,c son parámetros escalares.
	a = 0.005;
	b = 0.0095;
	c = 0.0001;

	y = [-b*v(1)*v(2),b*v(1)*v(2)+c*v(3)-a*v(1)*v(2),a*v(1)*v(2)-c*v(2)]';
end

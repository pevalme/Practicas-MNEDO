function y=f(t,v)
	% v,y son vectores columna de dimensión 2
	% t es un escalar
	y = [-2,1;1,-2]*v + [2*sin(t);2*(cos(t)-sin(t))];
end

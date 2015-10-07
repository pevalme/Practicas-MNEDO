function uexact = result(t)
	% t es un vector.
	uexact(1,:) = 2*exp(-t) + sin(t);
	uexact(2,:) = 2*exp(-t) + cos(t);
end
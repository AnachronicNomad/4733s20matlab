pi=4*atan(sym(1))
syms x t k
f = sin(pi*x)^3
c = simplify(int(f*sin(k*pi*x),x,0,1))
c1 = int(f*sin(pi*x),x,0,1)
c3 = int(f*sin(3*pi*x),x,0,1)
u = simplify(c1*exp(-pi^2*x)*sin(pi*x)+c3*exp(-(3*pi)^2*x)*sin(3*pi*x))
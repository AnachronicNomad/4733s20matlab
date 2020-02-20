% solve3diag_test
n=6;
alpha=2*ones(n,1);
beta=-ones(n-1,1);
gamma=beta;
b=ones(n,1);

v=solve3diag2(alpha,beta,gamma,b);
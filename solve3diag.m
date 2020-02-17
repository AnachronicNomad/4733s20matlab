function v=solve3diag(alpha,beta,gamma,b)
%  x=solve3diag(alpha,beta,gamma,b)
% solve 3 diagonal system A*x=f
% A is matrix with diagnals alpha (main), beta (lower), gamma (upper)
n=length(alpha)
v=zeros(n,1); % pre-allodate as column 
dofull=1;
pr='Presss ENTER to continue >';
beta(n)=0;  % pad to same size
gamma(n)=0; % pad to same size
% demonstration of algorightm on full matrix
A=full(spdiags([beta,alpha,gamma],[-1,0,1],n,n))
 v=solve_gauss(A,b)
% efficient implementation, changes in place
c = gamma;  % c(i)=A(i,i+1) 
delta = alpha;  % delta(i)=A(i,i)  delta in the book
% no need to store the subdiagonal
end
function v=solve3diag(alpha,beta,gamma,b)
%  x=solve3diag(alpha,beta,gamma,b)
% solve 3 diagonal system A*x=f
% A is matrix with diagnals alpha (main), beta (lower), gamma (upper)
n=length(alpha)
v=zeros(n,1); % pre-allodate as column 
dofull=1;
pr='Presss ENTER to continue >';
beta(n)=0;  % pad to same size % need to start from 1 not 2!
gamma(n)=0; % pad to same size
% demonstration of algorightm on full matrix
A=full(spdiags([beta,alpha,gamma],[-1,0,1],n,n))
v=solve_gauss(A,b)
% efficient implementation, changes in place
c = gamma;          % c(i)=A(i,i+1) 
delta = alpha;      % delta(i)=A(i,i)  delta in the book
beta = [0;beta];    % beta(i)=A(i-1,i) same indexing as in the book
% no need to store    
for i=1:n-1
    % clc
    %    m        = A(i+1,i)/A(i,i)
     %    A(i+1,:) = A(i+1,:)-m*A(i,:)
    %    b(i+1)   = b(i+1) - m*b(i)  
    %    input(pr);
end
    % back substitution
    % v=zeros(n,1); % preallocate as column
    % v(n)=b(n)/A(n,n)
    % input(pr);
for i=n-1:-1:1
    %   clc, A, b
    %   v(i) = (b(i) - A(i,i+1)*v(i+1))/A(i,i)
    %    input(pr);
end
end
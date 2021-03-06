function v=solve3diag(alpha,beta,gamma,b)
%  x=solve3diag(alpha,beta,gamma,b)
% solve 3 diagonal system A*x=f
% A is matrix with diagnals alpha (main), beta (lower), gamma (upper)
n=length(alpha)
v=zeros(n,1); % pre-allodate as column 
dofull=1;
pr='Presss ENTER to continue >';
beta(n)=0;  % pad to same size % need to start from 1 not 2!
gamma(n)=-1; % pad to same size
% demonstration of algorightm on full matrix
A=full(spdiags([beta,alpha,gamma],[-1,0,1],n,n)) % FOR COMPARISON ONLY
v0=solve_gauss(A,b)
% efficient implementation, changes in place    ;
%                     gamma(i)=A(i,i+1) 
delta = alpha;      % delta(i)=A(i,i)  delta in the book
beta = [0;beta];    % beta(i)=A(i-1,i) same indexing as in the book
% no need to store    
for i=1:n-1
    % clc
        % m        = A(i+1,i)/A(i,i)
        m = beta(i+1)/delta(i)
    %    A(i+1,:) = A(i+1,:)-m*A(i,:)
         delta(i+1) = delta(i+1) - m*gamma(i);   
         b(i+1)   = b(i+1) - m*b(i)  
         % input(pr);
end
    % back substitution
    % v=zeros(n,1); % preallocate as column
    % v(n)=b(n)/A(n,n)
    v(n)=b(n)/delta(n)    % THIS IS THE LINE THAT WAS MISSING IN CLASS
    % input(pr);
for i=n-1:-1:1
    %   clc, A, b
    %   v(i) = (b(i) - A(i,i+1)*v(i+1))/A(i,i)
       v(i) = (b(i) - gamma(i)*v(i+1))/delta(i)
     %   input(pr);
end
err=norm(v-v0,inf)
end
function v=solve3diag(alpha,beta,gamma,b)
%  x=solve3diag(alpha,beta,gamma,b)
% solve 3 diagonal system A*x=f
% A is matrix with diagnals alpha (main), beta (lower), gamma (upper)
n=length(alpha)
v=zeros(n,1); % pre-allodate as column 
dofull=1;
pr='Presss ENTER to continue >';
if dofull
    % demonstration of algorightm on full matrix
    beta(n)=0;  % pad to same size
    gamma(n)=0; % pad to same size
    A=full(spdiags([beta,alpha,gamma],[-1,0,1],n,n))
    % elimination
    input(pr);
    for i=1:n-1
        m        = A(i+1,i)/A(i,i);
        A(i+1,:) = A(i+1,:)-m*A(i,:)
        b(i+1)   = b(i+1) - m*b(i)  
        input(pr);
    end
    % back substitution
    v(n)=b(n)/A(n,n)
    input(pr);
    for i=n-1:-1:1
        v(i) = (b(i) - A(i,i+1)*v(i+1))/A(i,i)
        input(pr);
    end
    err = norm(A*v - b,1)
end
% efficient implementation, changes in place
c = gamma;  % c(i)=A(i,i+1) 
d = alpha;  % d(i)=A(i,i)  delta in the book
% no need to store subdiagonal

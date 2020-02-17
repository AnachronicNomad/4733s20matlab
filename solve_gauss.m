function v=solve_gauss(A,b)
% v=elimination(A,b)
% solve system A*v=b by Gaussian elimination (teaching version)
    [n,n2]=size(A);
    if n ~= n2,
        error('matrix A must be square')
    end
    pr='Presss ENTER to continue >';
    clc,A,b,input(pr);
    for i=1:n-1
        clc
        m        = A(i+1,i)/A(i,i)
        A(i+1,:) = A(i+1,:)-m*A(i,:)
        b(i+1)   = b(i+1) - m*b(i)  
        input(pr);
    end
    % back substitution
    v=zeros(n,1); % preallocate as column
    v(n)=b(n)/A(n,n)
    input(pr);
    for i=n-1:-1:1
        clc, A, b
        v(i) = (b(i) - A(i,i+1)*v(i+1))/A(i,i)
        input(pr);
    end
    err = norm(A*v - b,1)
end
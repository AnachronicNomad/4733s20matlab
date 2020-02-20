function v=solve_gauss(A,b)
% v=elimination(A,b)
% solve system A*v=b by Gaussian elimination (teaching version)
    [n,n2]=size(A);
    if n ~= n2,
        error('matrix A must be square')
    end
    pr='Presss ENTER to continue >';
    % clc,A,b,input(pr);
    A0=A
    b0=b
    for i=1:n-1
        clc
        i 
        for j=i+1:n
            m      = A(j,i)/A(i,i)
            A(j,i:n) = A(j,i:n)-m*A(i,i:n) 
            b(j)     = b(j) - m*b(i)
        end
        input(pr);
    end
    % back substitution
    v=zeros(n,1); % preallocate as column
    v(n)=b(n)/A(n,n)
    % input(pr);
    for i=n-1:-1:1
        clc
        A, b
        v(i) = (b(i) - A(i,i+1:end)*v(i+1:end))/A(i,i)
        input(pr);
    end
    err = norm(A0*v - b0,1)
end
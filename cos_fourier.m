function c=cos_fourier(f,n)
% expand fuction f on [0,1] in fourier cosine series 
% in:
%   f  function handle
%   n  number of terms
% return:
%   c  fourier coefficients, c(k+1) stores coefficient k
for k=0:n
    c(k+1)=2*integral(@(x)f(x).*cos(k*pi*x),0,1);
end
% display
x=linspace(0,1,500);
y=c(1)*ones(size(x))/2;
for k=1:n
    y=y+c(k+1)*cos(k*pi*x);
    plot(x,y),title(['n=',num2str(n)])
    drawnow
    pause(0.1)
    % hold on
end
hold off
end
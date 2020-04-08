% fourier_x
% Write a computer program that computes the Nth partial sums of Fourier series. 
% Use the program to plot the function f(x) = x and the corresponding Fourier 
% sine and Fourier cosine series on the unit interval. Then use the program to 
% plot the series for x ∈ [−3, 3]. Please have your script fourier x.m make 
% the two pictures for N = 10, and note that as a script it should run without
% any arguments. As the exercise in the book asks, the first picture should
% contain the graphs of the function f, the partial sum of the sine series,
% and the partial sum of the cosine series over the unit interval, and the
% second picture the graphs of the same partial Fourier sums over the interval
% [−3, 3]. Hint: you can use the commands ”hold on” in Matlab to put multiple
% plots in a single picture, then ”hold off”

for k=1:10
    b(k)=2*integral(@(x)x.*sin(k*pi*x),0,1); % sine series coefficients
    c(k)=2*integral(@(x)x.*cos(k*pi*x),0,1); % cosine series coefficients
end
c0 = 2*integral(@(x)x,0,1); % cos zero term
disp('sine series coefficients'),b
disp('sine series coefficients'),c0,c

x=linspace(0,1,300);  % s points
f = x;
cos_sum = 0.5*c0;
sin_sum = zeros(size(x));
for k=1:10
    sin_sum = sin_sum + b(k)*sin(k*pi*x);
    cos_sum = cos_sum + c(k)*cos(k*pi*x);
end
plot(x,f,'b',x,sin_sum,'r',x,cos_sum,'k')
legend('f(x)=x','sine sum','cosine sum')
title('Fourier series approximation for N=10')

x=linspace(-3,3,300);  % s points
f = x;
cos_sum = 0.5*c0;
sin_sum = zeros(size(x));
for k=1:10
    sin_sum = sin_sum + b(k)*sin(k*pi*x);
    cos_sum = cos_sum + c(k)*cos(k*pi*x);
end
figure  % new figure
plot(x,f,'b',x,sin_sum,'r',x,cos_sum,'k')
legend('f(x)=x','sine sum','cosine sum')
title('Fourier series approximation for N=10')


id='Green''s function for the Poisson''s equation in 1D';
disp(id)
% Jan Mandel, February 2020
n=500;
g=[0:n]/n;
[x,y]=meshgrid(g,g);
green = @(x,y)x.*(1-y).*(y>x) + y.*(1-x).*(y<=x);
z = green(x,y);
mesh(x,y,z)
grid on
title(id)
xlabel x
ylabel y
zlabel G(x,y)
drawnow
%input('press enter to continue')
% plot some lines
hold on
for a=[1:4]/5
    x=[0,a];
    y=[a,a];
    z=green(x,y);
    plot3(x,y,z,'k');
end
for a=[1:4]/5
    y=[0,a];
    x=[a,a];
    z=green(x,y);
    plot3(x,y,z,'k');
end
hold off
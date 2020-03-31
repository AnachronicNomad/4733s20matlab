% stiff.m
% Program the forward Euler method and the backward Euler method
% (eq. 1.69 page 37) for the equation
% \[
% u\prime(t)=-20u,\quad u(t),u(0)=1,
% \]
% with $\Delta t=0.1$. For each $m=1$ to $10$,  print one line with the value of
% time $t_{m}=m\Delta t$, the exact solution at $t_{m}$, the approximate
% solution by the forward Euler method, its error (the difference from the exact
% solution), the approximate solution by the backward Euler method, and its
% error. Put your code in your github repository in the directory hw3 as a
% single script called stiff.m.
dt = 0.1;
uf = 1;   % initial value for forward euler at t=0
ub = 1;   % initial value for backward euler at t=0
t = 0;    % initial time
for m=1:10
    t = t + dt;  % advance time
    ue = exp(-20*t); % exact solution at t
    uf = uf + dt * (-20 * uf); % advance forward euler
    % ub = uf + dt * (-20 * ub); backward euler - solve for ub
    ub = ub / (1 + 20*dt) ;
    disp(['time ',num2str(t),' exact solution ',num2str(ue),...
        ' forward Euler ',num2str(uf),' error ',num2str(ue-uf),...
        ' backward Euler ',num2str(ub),' error ',num2str(ue-ub)])
end
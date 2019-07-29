%% Step 4: 1D Burger's Equation
clc
clear

syms t x u nu

phi = exp(-(x-4*t)^2/(4*nu*(t+1)))+exp(-(x-4*t-2*pi)^2/(4*nu*(t+1)));
delphi = diff(phi,x);
uphi = -2*nu*(delphi/phi)+4;
usyms = matlabFunction(uphi);

nx = 101;
nt = 100;
dx = (2*pi)/(nx-1);
nu=0.05;
dt=dx*nu;
t=0;

x = linspace(0,2*pi,nx);

u = usyms(nu,t,x);
figure(1)
% hold on

for n =1:nt
    u1=u;
    for i = 2:nx-1
        
        u(i) = u1(i)-u1(i)*(dt/dx)*(u(i)-u(i-1))+(nu*dt/(dx^2))*(u(i+1)-2*u(i)+u(i-1));
        
    end
    u(1) = u1(1)-u1(1)*(dt/dx)*(u(1)-u(nx-1))+(nu*dt/(dx^2))*(u(2)-2*u(1)+u(nx-1));
    u(nx)=u(1);
    plot(x,u)
    
    uactual = usyms(nu,t,x);
    hold on 
    plot(x,uactual)
    pause(0.1)
    hold off
    
    legend('Numerical','Analytical')
    
    t = n*dt;
end
% uactual = usyms(nu,nt*dt,x);
% plot(x,uactual)
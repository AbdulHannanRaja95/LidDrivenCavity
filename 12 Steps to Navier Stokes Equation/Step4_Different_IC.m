%% Step 4: 1D Burger's Equation
clc
clear
Lx=2;
nx = 41;
nt = 50;
dx = Lx/(nx-1);
nu=0.1;
dt=dx*nu;
t=0;

for i = 1:nx
    x(i) = (i-1)*dx;
end

u=ones(1,nx);


for i= 1:nx
    
    if x(i) >= 0.5 && x(i)<=1
        u(1,i)=2;
    end
    
end

for n =1:nt
    u1=u;
    for i = 2:nx-1
        
        u(i) = u1(i)-u1(i)*(dt/dx)*(u(i)-u(i-1))+(nu*dt/(dx^2))*(u(i+1)-2*u(i)+u(i-1));
        
    end
    u(1) = u1(1)-u1(1)*(dt/dx)*(u(1)-u(nx-1))+(nu*dt/(dx^2))*(u(2)-2*u(1)+u(nx-1));
    u(nx)=u(1);
    plot(x,u)
    pause(0.1)
    hold on
    
end

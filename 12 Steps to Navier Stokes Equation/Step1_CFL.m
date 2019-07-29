%% Step 1: 1D Linear Convection 

clc
clear all

Lx = 2;
nx = 121;
dx = Lx/(nx-1);

for i = 1:nx
    x(i) = (i-1)*dx;
end

nt = 50;
CFL_number = 1;
c  = 1;
dt = (CFL_number*dx)/c;


u=ones(1,nx);


for i= 1:nx
    
    if x(i) >= 0.5 && x(i)<=1
        u(1,i)=2;
    end
    
end

r = (c*dt)/dx;

for n = 1:nt
    u1=u;
    for i = 2:nx
        
        u(i) = u1(i) - r*(u1(i)-u1(i-1));
      
    end
    plot(linspace(0,2,nx),u)
    pause(0.2)
    
end

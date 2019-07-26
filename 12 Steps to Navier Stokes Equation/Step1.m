%% Step 1: 1D Linear Convection 

clc
clear all

Lx = 2;
nx = 41;
dx = Lx/(nx-1);

for i = 1:nx
    x(i) = (i-1)*dx;
end

nt = 30;
dt = 0.025;
c  = 1;

u=ones(1,nx);


for i= 1:nx
    
    if x(i) >= 0.45 && x(i)<=1
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

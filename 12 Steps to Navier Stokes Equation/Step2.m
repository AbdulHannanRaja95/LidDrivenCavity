%% Step 2: 1D Non-Linear Convection(Inviscid Burgers Equation) 

clc
clear all

Lx = 2;
nx = 51;
dx = Lx/(nx-1);

for i = 1:nx
    x(i) = (i-1)*dx;
end

nt = 30;
dt = 0.25;


u=ones(1,nx);


for i= 1:nx
    
    if x(i) >= 0.5 && x(i)<=1
        u(1,i)=2;
    end
    
end



for n = 1:nt
    u1=u;
    for i = 2:nx
        
        u(i) = u1(i) - u1(i)*(dt/dx)*(u1(i)-u1(i-1));
      
    end
    plot(linspace(0,2,nx),u)
    pause(0.2)
    
end

%% Step 3: 1D Diffusion
clc
clear all

Lx = 2;
nx = 151;
dx = Lx/(nx-1);

for i = 1:nx
    x(i) = (i-1)*dx;
end

nt = 120;
sigma = 0.2;
nue  =0.3;
dt = (sigma*dx^2)/nue;

u=ones(1,nx);


for i= 1:nx
    
    if x(i) >= 0.5 && x(i)<=1
        u(1,i)=2;
    end
    
end



for n = 1:nt
    u1=u;
    plot(linspace(0,2,nx),u)
    pause(0.2)
    for i = 2:nx-1
        
        u(i) = u1(i) + (nue*dt/dx^2)*(u1(i+1)-2*u1(i)+u1(i-1));
      
    end
    
    
end

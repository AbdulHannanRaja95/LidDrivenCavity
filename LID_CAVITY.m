clc
clear all

Lx = 1;
Ly = 1;

nx = 81;
ny = 81;

dx = Lx/(nx-1);
dy = Ly/(ny-1);

for i=1:nx
    for j=1:ny
        x(i,j) = (i-1)*dx;
        y(i,j) = (j-1)*dy;
    end
end

dt = 0.001;
t = 1;
 
u(1:nx,1:ny) = 0;
u(1:nx,ny)   = 1;
v(1:nx,1:ny) = 0;

p(1:nx,1:ny) = 0.5;
Re = 500;
b = 1/0.6;
er = 100;

tic

while(((er >= 1e-5) && (t <= 10000)))
    
    u1 = u; 
    v1 = v;
    p1 = p;
    for i=2:nx-1
        for j=2:ny-1
            p(i,j)= p1(i,j) - dt*b*(0.5/dx*(u(i+1,j)-u(i-1,j))+0.5/dy*(v(i,j+1)-v(i,j-1)));
        end
    end
    
    p(1,:) = p(2,:);
    p(nx,:) = p(nx-1,:);
    p(:,1) = p(:,2);
    p(:,ny) = p(:,ny-1);
    
   
    for i=2:nx-1
         for j=2:ny-1
            RHSu = 1/Re*(1/dx^2*(u1(i+1,j)-2*u1(i,j)+u1(i-1,j))+1/dy^2*(u1(i,j+1)-2*u1(i,j)+u1(i,j-1)))-(p(i+1,j)-p(i-1,j))/(2*dx);
            LHSu = 0.5/dx*(u1(i+1,j)^2-u1(i-1,j)^2)+0.5/dy*(u1(i,j+1)*v1(i,j+1)-u1(i,j-1)*v1(i,j-1));
            u(i,j) = u1(i,j) + dt*RHSu - dt*LHSu;
         end
    end
    for i=2:nx-1
        for j=2:ny-1
            
            RHSv = 1/Re*(1/dx^2*(v1(i+1,j)-2*v1(i,j)+v1(i-1,j))+1/dy^2*(v1(i,j+1)-2*v1(i,j)+v1(i,j-1)))-(p(i,j+1)-p(i,j-1))/(2*dy);
            LHSv = 0.5/dy*(v1(i,j+1)^2-v1(i,j-1)^2)+0.5/dx*(u1(i+1,j)*v1(i+1,j)-u1(i-1,j)*v1(i-1,j));
            v(i,j) = v1(i,j) + dt*RHSv - dt*LHSv;
        end
    end
    
  
    if(t==1)
        t = 2;
    else
        er = max(max((abs((p1-p)./p))));
        t = t+1;
        error(t) = er;
    end
    t
    er
end

t
er

toc

for i=1:nx-1
    for j=1:ny-1
        vor(i,j) = 1/dy*(u(i,j+1)-u(i,j)) - 1/dx*(v(i+1,j)-v(i,j));
    end
end
vor(nx,:) = vor(nx-1,:);
vor(:,ny) = vor(:,ny-1);



        
    
    
    
    
    
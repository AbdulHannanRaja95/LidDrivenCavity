clc
clear all

%%domain defintion
Lx = 1; %length in x-direction
Ly = 1; %length in y-direction
%%nodes definition
nx = 81; %nodes in x-direction
ny = 81; %nodes in y-direction
%%spacing
dx = Lx/(nx-1); %spacing in x-direction
dy = Ly/(ny-1); %spacing in y-direction

%%Coordinates generation for the domain
for i=1:nx 
    for j=1:ny
        x(i,j) = (i-1)*dx; %x-coordinate
        y(i,j) = (j-1)*dy; %y-coordinate
    end
end
dt = 0.001; %time step
t = 1; % initial iteration number

%%Boundary Conditions Specification/preallocation
u(1:nx,1:ny) = 0;  % initially u = 0 over the entire domain
u(1:nx,ny)   = 1;  % initially u = 1 over the right boundary...although it is false...
v(1:nx,1:ny) = 0;  % initially v = 0 over the entire domain

p(1:nx,1:ny) = 0.5; % initially pressure = 0.5 over the entire domain
Re = 500; %reynold number for this problem
b = 1/0.6; % artificial compressibility factor
er = 100; % initial error 

tic % timer starts for the computation 

%%Actual Computation of the velocity and pressure field distribution over the
%%entire domain



while(((er >= 1e-5) && (t <= 10000)))
    
    %u1,v1 and p1  are computed at different time from actual u,v and p.
    
    u1 = u;
    v1 = v;
    p1 = p; 
    % pressure calculation from continuity eqaution with artificial
    % compressibility factor incorporated
    for i=2:nx-1
        for j=2:ny-1
            p(i,j)=p1(i,j) - dt*b*(0.5/dx*(u(i+1,j)-u(i-1,j))+0.5/dy*(v(i,j+1)-v(i,j-1))); 
        end
    end
    
    p(1,:) = p(2,:);
    p(nx,:) = p(nx-1,:);
    p(:,1) = p(:,2);
    p(:,ny) = p(:,ny-1);
    % 
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
    
  
    if(t==1) % just to avoid the error calculation for the first time(p1=p) otherwise the error is going to be zero and loop condition gets violated. 
        t = 2;
    else
        er = max(max((abs((p1-p)./p)))); % since it is a matrix, so first max gives the row vector containing 
         %the maximum element of every column and second max gives the maximum elemetn from that row vector
        t = t+1; % incrementing iteration number
        error(t) = er; % storing error at each iteration
    end
    t
    er
end

t
er

toc % timer stops for the computation 

for i=1:nx-1 %to cater for forward difference scheme
    for j=1:ny-1 %to cater for forward difference scheme
        vor(i,j) = 1/dy*(u(i,j+1)-u(i,j)) - 1/dx*(v(i+1,j)-v(i,j));%loop starts from 1 that's why center diff is not used, forward difference is used
    end
end
vor(nx,:) = vor(nx-1,:);
vor(:,ny) = vor(:,ny-1);    

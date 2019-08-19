%% Step 5: Laplace Equation
clc
clear all

Lx = 2;
Ly = 1;
nx = 40;
ny = 40;
dx = Lx/(nx-1);
dy = Ly/(ny-1);

for i = 1:nx
   for j = 1:ny
        x(i,j) = (i-1)*dx;
        y(i,j) = (j-1)*dy;
   end
end

%% Initial Condition
p=zeros(nx,ny);
%% Boundary Condition

p(nx,:)=y(1,:);

surf(x,y,p)
%% Computation
it=1;
nit=1000;
while it<=nit
    p1=p;
    for i = 2:nx-1
        
        for j = 2:ny-1
            p(i,j) = ((dy^2)*(p1(i+1,j)+p1(i-1,j))+dx^2*(p1(i,j+1)+p1(i,j-1)))/(dx^2+dy^2)/2;
        end
        
    end
    p(2:nx-1,1)=p(2:nx-1,2);
    p(2:nx-1,ny)=p(2:nx-1,ny-1);
    it=it+1;
    surf(x,y,p)
%     pause(0.5)
end

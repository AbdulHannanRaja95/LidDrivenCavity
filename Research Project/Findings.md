# Findings

The code solves 2D incompressible non dimensional form of Navier Stokes Equations for Lid Driven Cavity Flow. The Navier Stokes Equation
are fundamental Partial Differential equation.The discretization Schemes are used to convert these partial differential eqautions into the
solvable algebraic equations.

# Numerical Solution of Navier Stokes Equation 

Our main aim is to find pressure and velocity field.The Numerical Solution of the Navier Stokes Equations can become very time and power 
consuming and that's why different techniques are tested to see which one is more effective in solution convergence and dealing with non
linearity. Now, the main problem with the numerical solution of these equations is the **non-existense of an explicit equation for
pressure term**. Different methods/schemes had been proposed in the past to deal with this problem. Generally it is perferable to solve
the equations in primitive variables(u,v,p). 

**Stream Function vorticity** is among one of the many approaches to deal with this problem. SIMPLE Algorithm is also used.  Pressure
poisson equation is also very effective method to find pressure however the approach/method used in this code is **ARTIFICIAL
COMPRESSIBILITY METHOD**. This method incorporates the use of artificial compressibility term in the continiuity equation. Every method
has its own advantages and disadvantages. For example, Stream Function Vorticity method is only applicable for 2D problems because stream
function is only defined for 2D. On the other hand, ACM only gives steady state solution because in case of steady fluid, the artifical
compressibility term eqauls to zero and in this way the continuity equation remains satisfied.

# Code Algortihm

The code starts with the definition of domain which is 1by1 square cavity covered by lid,number of computational points/nodes, spacing ,
coordinates along with the Boundary Conditions(BC) and some constants which are used in NS equations.

The code then solves the continuity equation for pressure calculation and then uses that pressure to compute the velocity component(u,v)
by solving the discretized Partial Differential Equation (Navier Stokes Eqaution) for x and y momentum.

The code then calculates the error for every iteration and checks it against the error condition.

Finally the code computes the vorticity by using fundamental vorticity equation using Forward difference scheme.

M-file conatining detail commenting of each and every line of code has already been uploaded.
Link is provided:[https://github.com/AbdulHannanRaja95/LidDrivenCavity/blob/LID_CAVITY_VERSION1.m/Research%20Project/LID_CAVITY.m]

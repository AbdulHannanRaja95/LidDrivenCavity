# Findings

The code solves 2D incompressible Navier Stokes Equations for visous fluids. The Navier Stokes Equation are used to solve Lid Driven
Cavity and the fluid behaviour is governed by the partial differential eqautions. The discretization Schemes are used to convert these
partial differential eqautions into the solvable algebraic equations. 

# Numerical Solution of Navier Stokes Equation 

Our main aim is to find pressure and velocity field.The Numerical Solution of the Navier Stokes Equations can become very time and power 
consuming and that's why different techniques are tested to see which one is more effective in solution convergence and dealing with non
linear. Now, the main problem with the numerical solution of these equations is the **non-existense of an explicit equation for pressure
term**. Different methods/schemes had been proposed in the past to deal with this problem. Generally it is perferable to solve the
equations in primitive variables(u,v,p). 

**Stream Function vorticity** is among one of the many approaches to deal with this problem. SIMPLE Algorithm is also used. The
approach/method used in this code is **ARTIFICIAL COMPRESSIBILITY METHOD**. This method incorporates the use of artificial compressibility
term in the continiuity equation. Every method has its own advantages and disadvantages. For example, Stream Function Vorticity method is
only applicable for 2D problems because stream function is only defined for 2D. On the other hand, ACM only gives steady state solution
because in case of steady fluid, the artifical compressibility term eqauls to zero and in this way the continuity equation remains
satisfied.


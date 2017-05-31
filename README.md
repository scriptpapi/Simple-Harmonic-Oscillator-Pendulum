# Simple-Harmonic-Oscillator-Pendulum
Numerical Simulation of a Simple Harmonic Oscillator Pendulum using three different numerical methods for comparison. 

This MATLAB script simulates a simple, undamped harmonic oscillator pendulum using three different numerical methods: Euler, Euler-Cromer, and Runge-Kutta method. It compares methods to each other and the analytical solution by calculating:
- Position Θ (Radian)
- Velocity Ω (Radian/s)
- Energy J (Joules)
- Error percentage % difference from the analytical solution
- The script also includes a phase plot for the all methods and the analytical solution

HarmonicOscillator.m is the main script where you run the simulation. Each numerical method function is seperated in a different .m file.

The simulation produces 5 figures:
 1. Comparing Angle vs Time of the three methods to the analytical solution.
 2. Comparing the Angular Velocity Vs Time calculation of the three methods.
 3. Comparing the Energy Vs Time calculation of the three methods.
 4. Comparing the error percentage (from the analytical solution) vs Time of the three methods.
 5. Phase plot comparing the three methods.


Reference Used: Computational Physics 2nd Edition - Nicholas J. Giordano and Hisao Nakanishi


%Runge-Kutta method function

function [Theta,Omega,Energy] = RungeKutta(dt, l, i_theta, i_omega, i_energy, g)
    Omega = i_omega - (i_theta + 0.5 * i_omega * dt) * dt;
    Theta = i_theta + (i_omega - 0.5 * i_theta * dt) * dt;
    Energy = i_energy + 0.5 * ( Omega^2 + Theta^2);
end
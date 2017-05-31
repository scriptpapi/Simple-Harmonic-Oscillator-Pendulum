%Euler method function

function [Theta,Omega,Energy] = Euler(dt, l, i_theta, i_omega, i_energy, g)
    Omega = i_omega - (g/l) * i_theta * dt;
    Theta = i_theta + i_omega * dt;
    Energy = i_energy + 0.5 * ( Omega^2 + Theta^2);
end
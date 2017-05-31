% Author: Nawaf k. Abdullah
% This script simulates the motion of a simple harmonic oscillator pendulum
% using three different numerical methods: Euler, Euler-Cromer, and Runge
% Kutta. It also compares the three methods.
% Reference: Computational Physics 2nd Edition - Nicholas J. Giordano and
% Hisao Nakanishi

%Variables
dt = input('Enter time increment > ');
tf = input('Enter final time > ');
l = input('Enter length > ');
iTheta = input('Enter intial theta > ');
iOmega = input('Enter intial omega > ');
iEnergy= input('Enter intial Energy > ');
iError = 0;

%Constant
g = 9.81;

%Arrays
time=0:dt:tf;
theta=zeros(3,length(time));
omega=zeros(3,length(time));
energy=zeros(3,length(time)); 
diff=zeros(3,length(time));

%Intializing arrays
theta(:,1)=iTheta;
omega(:,1)=iOmega;
energy(:,1)=iEnergy;
diff(:,1)=iError;

%Calling functions
for i=1:length(time)-1
    [theta(1,i+1),omega(1,i+1),energy(1,i+1)]=Euler(dt,l,theta(1,i),omega(1,i),energy(1,i),g);
    
    [theta(2,i+1),omega(2,i+1),energy(2,i+1)]=EulerCromer(dt,l,theta(2,i),omega(2,i),energy(2,i),g);
    
    [theta(3,i+1),omega(3,i+1),energy(3,i+1)]=RungeKutta(dt,l,theta(3,i),omega(3,i),energy(3,i),g);
end

%analytical solution for comparison
thetaAnalytical=theta(1,1)*sin(sqrt(g/l)*time+pi/2);

%Comparing methods theta vs time
figure(1)
plot(time, thetaAnalytical)
xlabel('Time (s)')
ylabel('Angle (Rad)')
title('Euler Method vs Euler-Cromer vs Runge Kutta')
hold on
plot(time, theta(1,:))
plot(time, theta(2,:))
plot(time, theta(3,:))
legend('Analytical','Euler','Euler-Cromer','Runge Kutta')
hold off

%Comparing methods omega vs time
figure(2)
plot(time, omega(1,:))
xlabel('Time (s)')
ylabel('Angular Velocity (Rad/s)')
title('Euler Method vs Euler-Cromer vs Runge Kutta')
hold on
plot(time, omega(2,:))
plot(time, omega(3,:))
legend('Euler','Euler-Cromer','Runge Kutta')
hold off

%Comparing methods energy vs time
figure(3)
plot(time, energy(1,:))
xlabel('Time (s)')
ylabel('Energy (J)')
title('Euler Method vs Euler-Cromer vs Runge Kutta')
hold on
plot(time, energy(2,:))
plot(time, energy(3,:))
legend('Euler','Euler-Cromer','Runge Kutta')
hold off

%Comparing methods error percentage
figure(4)
diff(1,:)=theta(1,:)-thetaAnalytical(1,:);
diff(2,:)=theta(2,:)-thetaAnalytical(1,:);
diff(3,:)=theta(3,:)-thetaAnalytical(1,:);
plot(time, diff(1,:))
xlabel('Time (s)')
ylabel('Error % from Analytical Solution')
title('Euler Method vs Euler-Cromer vs Runge Kutta')
hold on
plot(time, diff(2,:))
plot(time, diff(3,:))
legend('Euler','Euler-Cromer','Runge Kutta')
hold off

%Phase plot for all methods
figure(5)
plot(thetaAnalytical, omega(1,:))
xlabel('Theta (radians)')
ylabel('Omega (radians/s)')
title('Phase plot for all methods')
hold on
plot(theta(1,:), omega(1,:))
plot(theta(2,:), omega(2,:))
plot(theta(3,:), omega(3,:))
legend('Euler','Euler-Cromer','Runge Kutta')
hold off
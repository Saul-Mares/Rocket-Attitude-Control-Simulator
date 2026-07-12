function [thetaNew, omegaNew] = rocketDynamics(theta, omega, torque, I, dt)

% Angular acceleration
alpha = torque / I;

% Update angular velocity
omegaNew = omega + alpha*dt;

% Update angle
thetaNew = theta + omegaNew*dt;

end
function controlTorque = controller(theta, omega, Kp, Kd)


% PD Controller
%
% Inputs:
% theta  - Current rocket angle (rad)
% omega  - Angular velocity (rad/s)
% Kp     - Proportional gain
% Kd     - Derivative gain
%
% Output:
% controlTorque - Torque command (N*m)


controlTorque = -Kp*theta - Kd*omega;

end
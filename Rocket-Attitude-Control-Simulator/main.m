%% Rocket Attitude Simulation

clear;
clc;
close all;

%% Simulation Parameters

I = 0.08;           % Moment of inertia (kg*m^2)
dt = 0.01;          % Time step (seconds)
tEnd = 20;          % Total simulation time
Kp = 0.5;    % Proportional gain
Kd = 0.2;

time = 0:dt:tEnd;

%% Initial Conditions

theta = deg2rad(10);      % Initial angle (10 degrees)
omega = 0;                % Initial angular velocity

%% Storage Arrays

thetaHistory = zeros(size(time));
omegaHistory = zeros(size(time));
windHistory = zeros(size(time));
controlHistory = zeros(size(time));


%% Main Simulation Loop

for k = 1:length(time)

    % controller
  controlTorque = controller(theta, omega, Kp, Kd);

  % Wind disturbance
if time(k) >= 5 && time(k) <= 5.5
    windTorque = 0.08;
else
    windTorque = 0;
end

    totalTorque = controlTorque + windTorque;

    [theta, omega] = rocketDynamics(theta, omega, totalTorque, I, dt);

    thetaHistory(k) = theta;
    omegaHistory(k) = omega;
    windHistory(k) = windTorque;
    controlHistory(k) = controlTorque;
    

end

%% Plot Results

%% Plot Rocket Angle

%% Pitch Response

figure('Color','w')

plot(time, rad2deg(thetaHistory), ...
    'LineWidth',2.5)

hold on

yline(0,'k--',...
    'Desired Angle',...
    'LineWidth',1.5)

xlabel('Time (s)','FontSize',12)
ylabel('Pitch Angle (deg)','FontSize',12)

title('Rocket Pitch Response to Wind Disturbance',...
    'FontSize',14)

legend('Rocket Pitch','Desired Angle',...
    'Location','best')

grid on
box on

exportgraphics(gcf,...
    'PitchResponse.png',...
    'Resolution',300)

figure('Color','w')

plot(time, windHistory,...
    'LineWidth',2.5)

xlabel('Time (s)','FontSize',12)
ylabel('Wind Torque (N·m)','FontSize',12)

title('Applied Wind Disturbance',...
    'FontSize',14)

grid on
box on

exportgraphics(gcf,...
    'WindResponse.png',...
    'Resolution',300)
figure('Color','w')

plot(time, controlHistory,...
    'LineWidth',2.5)

xlabel('Time (s)','FontSize',12)
ylabel('Control Torque (N·m)','FontSize',12)

title('PD Controller Output',...
    'FontSize',14)

grid on
box on

exportgraphics(gcf,...
    'ControlTorque.png',...
    'Resolution',300)

%% Performance Metrics

maxAngle = max(abs(rad2deg(thetaHistory)));

maxOmega = max(abs(omegaHistory));

maxTorque = max(abs(controlHistory));

fprintf('\n');
fprintf('===== PERFORMANCE =====\n');
fprintf('Maximum Angle: %.2f deg\n', maxAngle);
fprintf('Maximum Angular Velocity: %.2f rad/s\n', maxOmega);
fprintf('Maximum Control Torque: %.3f N*m\n', maxTorque);
fprintf('Final Angle: %.3f deg\n', rad2deg(thetaHistory(end)));
performanceMetrics(time, thetaHistory, controlHistory);
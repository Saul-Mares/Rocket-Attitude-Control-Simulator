function performanceMetrics(time, thetaHistory, controlHistory)

thetaDeg = rad2deg(thetaHistory);

maxAngle = max(abs(thetaDeg));
finalAngle = thetaDeg(end);
maxTorque = max(abs(controlHistory));

% Settling time (within ±0.5°)
idx = find(abs(thetaDeg) > 0.5, 1, 'last');

if isempty(idx)
    settlingTime = 0;
else
    settlingTime = time(idx);
end

fprintf('\n===== PERFORMANCE SUMMARY =====\n');
fprintf('Maximum Angle: %.2f deg\n', maxAngle);
fprintf('Final Angle: %.2f deg\n', finalAngle);
fprintf('Maximum Control Torque: %.3f N·m\n', maxTorque);
fprintf('Approx. Settling Time: %.2f s\n', settlingTime);

end
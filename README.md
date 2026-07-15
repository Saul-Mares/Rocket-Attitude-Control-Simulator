# Rocket Attitude Control Simulator

## Overview

This project simulates the pitch dynamics of a rocket subjected to a transient wind disturbance. A proportional-derivative (PD) controller generates corrective control torque to stabilize the vehicle.

This project was developed as part of my preparation for Guidance, Navigation, and Control (GNC) engineering internships.

---

## Features

- MATLAB implementation
- PD feedback controller
- Wind disturbance simulation
- Closed-loop attitude stabilization
- Performance metrics
- Engineering plots

---

## System Model

The rotational dynamics are modeled using:

Iθ¨ = τ

where:

- I = Moment of inertia
- θ = Pitch angle
- τ = Applied torque

The controller computes:

τ = -Kpθ - Kdω

---

## Results

### Pitch Response

![Pitch Response](figures/PitchResponse.png)

### Wind Disturbance

![Wind](figures/WindResponse.png)

### Controller Output

![Controller](figures/ControlTorque.png)

### Combined Results

![Summary](figures/SimulationSummary.png)

---
## Simulink Implementation

After validating the controller in MATLAB, the simulation was recreated in Simulink using standard control system blocks.

The Simulink model includes:

- Closed-loop PD controller
- Rocket rotational dynamics
- Wind disturbance input
- Continuous-time integrators
- Feedback control loop
- Scope-based response visualization

<img width="587" height="210" alt="image" src="https://github.com/user-attachments/assets/1ade0048-147e-4db8-aba0-386c041f37eb" />

## Future Improvements

- PID controller
- Simulink implementation
- Sensor noise
- State estimation
- Thrust Vector Control
- 2D flight simulation

---

## Skills Demonstrated

- MATLAB
- Feedback Control
- Dynamic System Simulation
- Engineering Analysis
- Data Visualization

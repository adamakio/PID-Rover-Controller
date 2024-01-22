# PID Control for Mobile Robot Navigation

## Project Overview
This repository houses both the source code and the accompanying report for my introductory project on Proportional-Integral-Derivative (PID) control. The main objective was to program a mobile robot to accurately follow a predetermined path, adjusting its course in real-time using PID control loops.

## Contents
- `main_script.m`: The primary MATLAB script that integrates all functions and executes the path tracking control loop.
- `drive_robot.m`: Function to drive the robot by sending control signals based on PID outputs.
- `getError.m`: Function to calculate the error between the robot's current position and the desired path.
- `getDC.m`: Function to determine the duty cycle for the motor controller.
- `checkDC.m`: Script to check the duty cycle values and ensure they're within the operational range.
- `newPos.m`: Function to update the robot's position based on movement commands.
- `my_noise.m` & `my_noise2.m`: Functions to simulate sensor noise for testing the robustness of the control loop.
- `Zouhair Adam Hamaimou - Control Loop Report.pdf`: The project report that details the objectives, methodology, challenges encountered, and results of the PID control implementation.

## Project Structure
The code is structured to modularly reflect the components of a basic PID control system. Each function corresponds to a specific aspect of the control loop, allowing for easy adjustments and testing.

## Running the Code
To run the project, execute the `main_script.m` in MATLAB. Ensure all supporting files are in the same directory for proper function integration.

## Report Highlights
The report provides insight into the theoretical background of PID controllers, the practical challenges faced during implementation, and the iterative process of tuning PID parameters for optimal performance.

## Learning Outcomes
- Understanding the fundamentals of PID control theory.
- Gaining practical experience in real-time control systems.
- Developing MATLAB code for robotics applications.
- Analyzing and overcoming the effects of sensor noise.

Thank you for exploring this repository. It represents my initial steps into the world of control systems and robotics, and I hope it serves as a resource for those interested in the field.

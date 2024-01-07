# Overview
This repository contains MATLAB code for both inverse and direct kinematics of a soft continuum robot. The provided code is a part of the Continuum Robot Kinematics Solver, which aims to facilitate the analysis and control of soft continuum robots.
CurveIKsolver provides functionality for solving the inverse kinematics problem of a soft continuum robot. It is designed to work with a modular soft continuum robot composed of multiple sections. The class supports computation of the robot's kinematics, including forward kinematics, Jacobian matrices, and inverse kinematics using an iterative method.
## Basic Joint Structure 
<p align="center">
  <img src="https://github.com/ATLED-3301/soft_continuum_IK/blob/main/DH.jpg" alt="DH Image">
</p>

<p align="center">
  <img src="https://github.com/ATLED-3301/soft_continuum_IK/blob/main/DH_1M.png" alt="DH_1M Image">
</p>

# Usage
Clone the repository to your local machine:

bash
  ```
  git clone https://github.com/your-username/continuum-kinematics.git
  ```
Navigate to the continuum-kinematics directory:
```
cd continuum-kinematics
```
Open MATLAB and run the test.m script:
```
run test.m
```
This script demonstrates the functionality of both the inverse and direct kinematics solvers.

## example 
```
%MATLAB CODE
% Example Usage
N = [3, 2, 4];  % Number of sections in each module
l = [0.1, 0.2, 0.15];  % Length of each section
q0 = zeros(1, sum(N) * 3);  % Initial joint angles
solver = curveIKsolver(N, l, q0);
goal_pose = eye(4);  % Desired end-effector pose
weight_matrix = eye(6);  % Weight matrix for error minimization
solver.IK_solve(goal_pose, weight_matrix);
solver.plotkin();
```

## Class Description
### roperties
- N: Number of sections in the continuum robot.
- N_sec: Number of sections used for internal calculations.
- q: Joint angles of the continuum robot.
- l: Length of each section.
- T: Transformation matrices for each module of the continuum robot.
- J: Jacobian matrix for the entire robot.
- DH: Denavit-Hartenberg parameters for each module.
- J_red: Reduced Jacobian matrix for the entire robot.

### Methods
#### Constructor curveIKsolver(N, l, q0)

Initializes an instance of the class.
- N: Number of sections.
- l: Length of each section.
- q0: Initial joint angles.
####  DH_vect(self, l, q)

Computes the Denavit-Hartenberg parameters for a given module.
- l: Length of the module.
- q: Joint angles of the module.
####  compute_T_module(self, T0, DH)

Computes the transformation matrix for a module given the previous transformation matrix and Denavit-Hartenberg parameters.
#### compute_T(self)

Computes the overall transformation matrices for the entire robot.
#### compute_module_jacobian(self, Tm, T_ee)

Computes the Jacobian matrix for a single module.
#### compute_J(self)

Computes the Jacobian matrix for the entire robot.
#### IK_solve(self, goal, W)

Solves the inverse kinematics problem iteratively to achieve a desired end-effector pose.
- goal: Desired end-effector pose.
- W: Weight matrix for error minimization.
#### plotkin(self)

Plots the kinematics of the robot.
#### plotkint(self, c)

Plots the kinematics of the robot with a specified color intensity.
## Dependencies
The provided code is written in MATLAB. Ensure that you have MATLAB installed on your machine to run the scripts successfully.

## Issues and Contributions
If you encounter any issues or have suggestions for improvements, feel free to open an issue. Contributions are welcome through pull requests.

## License
This project is licensed under the MIT License - see the LICENSE file for details.

## Results
<p align="center">
  <img src="https://github.com/ATLED-3301/soft_continuum_IK/blob/main/IKpath.jpg" alt="IKpath Image">
</p>


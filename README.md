# DTU10MW_SOWFA
An ADMR (and ALMAdvanced) implementation of the DTU 10MW turbine for SOWFA

ADM/ADMR:
This implementation contains all the relevant airfoil files and turbine specifications for the ADM turbine model (e.g., pisoFoamTurbine.ADM and windPlantSolver.ADM). Two tuning parameters are used to match the turbine results with single-turbine simulation results from FAST. These are the forceScale and the epsilon, respectively. Note that these values change with the specified meshing. It has been tuned for two meshes:
10m x 10m x 10m: F=1.30, eps = 12.0, k-opt = 1.15
15m x 15m x 15m: F=1.30, eps = 16.0, k-opt = 1.15

ALMAdvanced:
This implementation contains all the relevant airfoil files and turbine specifications for the ALMAdvanced turbine model (e.g., pisoFoamTurbine.ALMAdvanced and windPlantSolver.ALMAdvanced). However, the results produced with SOWFA (ALMAdvanced) do not agree with the results produced by single-turbine simulations of the 10MW turbine using FAST. This is an important discrepancy, and it is therefore uncertain whether the ALMAdvanced turbine implementation can be used.

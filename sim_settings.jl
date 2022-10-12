## Definition of constant parameters, initialization of system model 
## and estimators
## All units in SI Units

using LinearAlgebra

include("SystemModels/systemmodel.jl")

## Definition of time parameters for the simulation 
sim_duration = 3                    # [s]                     
sim_step = 0.001                    # [s] -> 20 Hz
sim_t = 0:sim_step:sim_duration 
sim_length = length(sim_t)

## Definition which system model is used for the simulation
bb_model = Ballbot2D(2)
ballbot = System(bb_model, [0; 0.5; zeros(3, 1)], sim_step)


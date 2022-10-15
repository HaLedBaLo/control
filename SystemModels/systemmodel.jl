include("ballbot_2D/ballbot_2D.jl")

abstract type SystemModel end

@enum SystemModels begin
    ballbot_2D
    ballbot_3D
end

mutable struct System
    sysmodel::SystemModel   # defines which system model to use
    state                   # contains updated version of state
    dt                      # update period
end

struct Ballbot2D <: SystemModel
    parameters              # contains constant system parameters
end

struct Ballbot3D <: SystemModel
    parameters              # contains constant system parameters
end

# call iteravely to update system state
function system_update!(sys::System)
    sys.state = system_state_update!(sys.sysmodel, sys.state, sys.dt)
end

function system_state_update!(sysmodel::Ballbot2D, state, dt)
    return ballbot_2D_update(state, dt)
end

function system_state_update!(sysmodel::Ballbot3D, state, dt)
    return ballbot_3D_update(state, dt)
end
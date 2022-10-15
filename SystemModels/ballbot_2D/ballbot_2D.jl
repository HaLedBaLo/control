include("M_bb2d.jl")
include("C_bb2d.jl")
include("G_bb2d.jl")
include("Q_bb2d.jl")

function ballbot_2D_update(state, dt)
    ddq = M_bb2d(state[2]) \ (
        Q_bb2d() * state[5] -
        C_bb2d(state[2], state[4]) * state[3:4] -
        G_bb2d(state[2]))

    state[1:2] += state[3:4] * dt + ddq * 0.5 * dt^2
    state[3:4] += ddq * dt

    return state
end
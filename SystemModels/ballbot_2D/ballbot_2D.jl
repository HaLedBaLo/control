include("params_bb2d.jl")
include("M_bb2d.jl")
include("C_bb2d.jl")
include("G_bb2d.jl")
include("Q_bb2d.jl")

function ballbot_2D_update(state, dt)
    ddq = M_bb2d(state[2]) \ (Q_bb2d() * state[5] -
                         C_bb2d(state[2], state[4]) * state[3:4] - G_bb2d(state[2]))

    # optimze to const variable
    bb_state_transition = [
        1 0 dt 0
        0 1 0 dt
        0 0 1 0
        0 0 0 1
    ]
    dt_acc = 0.5 * dt * dt
    bb_state_acceleration = [
        dt_acc 0
        0 dt_acc
        dt 0
        0 dt
    ]

    A =
        state[1:4] = bb_state_transition * state[1:4] + bb_state_acceleration * ddq
    return state
end
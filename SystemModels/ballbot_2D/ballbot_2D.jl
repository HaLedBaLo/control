include("bb2d_M.jl")
include("bb2d_C.jl")
include("bb2d_G.jl")
include("bb2d_Q.jl")

function ballbot_2D_update(state, dt)
    ddq = M(state[2]) \ (bb2d_Q() * state[5] - 
        bb2d_C(state[2], state[4]) * state[3:4] - bb2d_G(state[2]))
    dt_acc = 0.5 * dt * dt
    state[1:4] = [
        1 0 dt 0
        0 1 0  dt 
        0 0 1  0 
        0 0 0  1
    ] * state[1:4] + [
        dt_acc  0 
        0       dt_acc
        dt      0 
        0       dt] * ddq
    return state
end
include("bb3d_M.jl")
include("bb3d_C.jl")
include("bb3d_G.jl")
include("bb3d_Q.jl")


"updates state q with 3D ballbot model equation of motion"
function ballbot_3D_update(q, dt)
    ddq = bb3d_M(q[3], q[4], q[5]) \
          (bb3d_Q(q[3], q[4], q[5]) * q[11:13] -
           bb3d_C(q[3], q[4], q[5], q[6], q[7], q[8], q[9], q[10]) * q[6:10] -
           bb3d_G(q[3], q[4]))

    q[1:5] += q[6:10] * dt + ddq * 0.5 * dt^2
    q[6:10] += ddq * dt

    return q
end

function ballbot_3D_linearize(q)

end
include("M_bb3d.jl")
include("C_bb3d.jl")
include("G_bb3d.jl")
include("Q_bb3d.jl")

struct Ballbot3DParameters
    gravity

    radius_ball
    mass_ball
    inertia_ball

    vec_ball_com_z
    mass_torso
    radius_torso
    inertia_torso_x
    inertia_torso_z

    radius_wheel
    m_wheel
    inertia_wheel
end


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

Ballbot3DParameters(gravity,
    radius_ball,
    mass_ball,
    vec_ball_com_z,
    mass_torso,
    radius_torso,
    radius_wheel,
    mass_wheel
) = Ballbot2DParameters(
    gravity,
    radius_ball,
    mass_ball,
    mass_ball / 2 * (radius_ball^2 + (radius_ball - 0.01)^2),
    vec_ball_com_z,
    mass_torso,
    radius_torso,
    mass_torso * (radius_torso^2 / 4 + vec_ball_com_z^2 / 6),
    radius_wheel,
    mass_wheel,
    mass_wheel * radius_wheel^2 / 2
)

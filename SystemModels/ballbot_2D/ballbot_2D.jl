include("M_bb2d.jl")
include("C_bb2d.jl")
include("G_bb2d.jl")
include("Q_bb2d.jl")

struct Ballbot2DParameters
    gravity

    radius_ball
    mass_ball
    inertia_ball

    length_ball_to_com
    mass_torso
    radius_torso
    inertia_torso

    radius_wheel
    m_wheel
    inertia_wheel
end

function ballbot_2D_update(state, dt, parameters)
    ddq = M_bb2d(state[2]) \ (
        Q_bb2d() * state[5] -
        C_bb2d(state[2], state[4]) * state[3:4] -
        G_bb2d(state[2]))

    state[1:2] += state[3:4] * dt + ddq * 0.5 * dt^2
    state[3:4] += ddq * dt

    return state
end

function testQ(params::Ballbot2DParameters)
    g = params.gravity
    # ball 
    r_b = params.radius_ball
    m_b = params.mass_ball
    I_b = params.inertia_ball

    # torso 
    l = params.length_ball_to_com
    m_t = params.mass_torso
    r_t = params.radius_torso
    I_t = params.inertia_torso

    # wheel
    global r_w = params.radius_wheel
    m_w = params.m_wheel
    I_w = params.inertia_wheel

    Q_bb2d()
end

Ballbot2DParameters(gravity,
    radius_ball,
    mass_ball,
    length_ball_to_com,
    mass_torso,
    radius_torso,
    radius_wheel,
    mass_wheel
) = Ballbot2DParameters(
    gravity,
    radius_ball,
    mass_ball,
    mass_ball / 2 * (radius_ball^2 + (radius_ball - 0.01)^2),
    length_ball_to_com,
    mass_torso,
    radius_torso,
    mass_torso * (radius_torso^2 / 4 + length_ball_to_com^2 / 6),
    radius_wheel,
    mass_wheel,
    mass_wheel * radius_wheel^2 / 2
)



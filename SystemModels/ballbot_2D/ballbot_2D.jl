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

function ballbot_2D_update(state, dt, params)
    ddq = M_bb2d(state, params) \ (
        Q_bb2d(params) * state[5] -
        C_bb2d(state, params) * state[3:4] -
        G_bb2d(state, params))

    state[1:2] += state[3:4] * dt + ddq * 0.5 * dt^2
    state[3:4] += ddq * dt

    return state
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


function M_bb2d(state, params)
    return M_bb2d(
        params.inertia_ball,
        params.inertia_torso,
        params.inertia_wheel,
        state[2],
        params.length_ball_to_com,
        params.mass_ball,
        params.mass_torso,
        params.radius_ball,
        params.radius_wheel
    )
end

function C_bb2d(state, params)
    return C_bb2d(
        state[2],
        state[4],
        params.length_ball_to_com,
        params.mass_torso
    )
end

function G_bb2d(state, params)
    return G_bb2d(
        state[1],
        params.gravity,
        params.length_ball_to_com,
        params.mass_torso
    )
end

function Q_bb2d(params)
    return Q_bb2d(
        params.radius_ball,
        params.radius_wheel
    )
end
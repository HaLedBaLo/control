using Plots

function plot_pos(logg::SimLogBallbot)
    display(plot(
        logg.t, [logg.pos[:, 1],
        title="Position",
        xlabel="t [s]",
        ylabel="pos [m]"
    ))
end

function plot_tilt_angle(logg::SimLogBallbot)
    display(plot(
        logg.t, [logg.pos[:, 2],
        title="Tilt Angle",
        xlabel="t [s]",
        ylabel="angle [rad]"
    ))
end

function plot_vel(logg::SimLogBallbot)
    display(plot(
        logg.t, [logg.vel[:, 1], logg.vel[:, 2]],
        title="Velocity",
        label=["X" "Y"],
        xlabel="t [s]",
        ylabel="pos [m]"
    ))
end

function plot_vel(logg::SimLogBallbot)
    display(plot(
        logg.t, [logg.vel[:, 1], logg.vel[:, 2]],
        title="Velocity",
        label=["X" "Y"],
        xlabel="t [s]",
        ylabel="pos [m]"
    ))
end
using Plots

function plot_pos(logg::SimLogBallbot)
    display(plot(
        logg.t, logg.pos[:, 1],
        title="Position",
        xlabel="t [s]",
        ylabel="pos [m]"
    ))
end

function plot_tilt_angle(logg::SimLogBallbot)
    display(plot(
        logg.t, logg.pos[:, 2],
        title="Tilt Angle",
        xlabel="t [s]",
        ylabel="angle [rad]"
    ))
end

function plot_vel(logg::SimLogBallbot)
    display(plot(
        logg.t, logg.vel[:, 1],
        title="Velocity",
        label=["X" "Y"],
        xlabel="t [s]",
        ylabel="vel [m/s]"
    ))
end

function plot_angvel(logg::SimLogBallbot)
    display(plot(
        logg.t, logg.vel[:, 2],
        title="Angular Velocity",
        label=["X" "Y"],
        xlabel="t [s]",
        ylabel="angvel [rad/s]"
    ))
end
inlcude("plot_bb2d.jl")

abstract type SimLog end

mutable struct SimLogBallbot <: SimLog
    t
    pos
    vel
    tao
end

# main plotting function, comment/uncomment desired plots
function plot_sim(logg::SimLogBallbot)
    plotly()

    


end









function plot_path_est(logg::SimLog)
    display(plot(
        logg.pos_est[:, 1], logg.pos_est[:, 2],
        title="Estimated Path",
        label=false,
        xlabel="x [m]",
        ylabel="y [m]"
    ))
end


function plot_path_vs_est(logg::SimLog)
    plot(
        logg.pos[:, 1], logg.pos[:, 2],
        title="Path",
        label="Actual Path",
        xticks=-50:10:50,
        yticks=-30:10:30
    )
    display(plot!(
        logg.pos_est[:, 1], logg.pos_est[:, 2],
        title="Comparison Path Estimate",
        label="Estimated Path",
        xlabel="x [m]",
        ylabel="y [m]"
    ))
end


function plot_path_vs_est_lim(logg::SimLog)
    plot(
        logg.pos[:, 1], logg.pos[:, 2],
        title="Path",
        label="Actual Path",
        xlims=(-53, 53),
        ylims=(-33, 33)
    )
    display(plot!(
        logg.pos_est[:, 1], logg.pos_est[:, 2],
        title="Comparison Path Estimate",
        label="Estimated Path",
        xlabel="x [m]",
        ylabel="y [m]"
    ))
end


function plot_pos_est(logg::SimLog)
    display(plot(
        logg.t, [logg.pos_est[:, 1], logg.pos_est[:, 2]],
        title="Position Estimate",
        label=["X" "Y"],
        xlabel="t [s]",
        ylabel="pos [m]"
    ))
end


function plot_pos_vs_est(logg::SimLog)
    plt1 = plot(
        logg.t, [logg.pos[:, 1], logg.pos_est[:, 1]],
        title="X Position Estimate Comparison",
        label=["True" "Estimate"],
        ylabel="pos [m]"
    )

    plt2 = plot(
        logg.t, [logg.pos[:, 2], logg.pos_est[:, 2]],
        title="Y Position Estimate Comparison",
        label=false,
        xlabel="t [s]",
        ylabel="pos [m]"
    )

    display(plot(plt1, plt2, layout=(2, 1)))
end

function plot_pos_est_err(logg::SimLog)
    pos_err = logg.pos - logg.pos_est
    display(plot(
        logg.t, [pos_err[:, 1], pos_err[:, 2]],
        title="Position Estimate Error",
        label=["X" "Y"],
        xlabel="t [s]",
        ylabel="pos [m]"
    ))
end


function plot_vel_est(logg::SimLog)
    display(plot(
        logg.t, [logg.vel_est[:, 1], logg.vel_est[:, 2]],
        title="Velocity Estimate",
        label=["X" "Y"],
        xlabel="t [s]",
        ylabel="vel [m/s]"
    ))
end


function plot_vel_est_err(logg::SimLog)
    vel_err = logg.vel - logg.vel_est
    display(plot(
        logg.t, [vel_err[:, 1], vel_err[:, 2]],
        title="Velocity Estimate Error",
        label=["X" "Y"],
        xlabel="t [s]",
        ylabel="vel [m/s]"
    ))
end

function plot_vel_vs_est(logg::SimLog)
    plt1 = plot(
        logg.t, [logg.vel[:, 1], logg.vel_est[:, 1]],
        title="X Velocity Estimate Comparison",
        label=["True" "Estimate"],
        ylabel="vel [m]"
    )

    plt2 = plot(
        logg.t, [logg.vel[:, 2], logg.vel_est[:, 2]],
        title="Y Velocity Estimate Comparison",
        label=false,
        xlabel="t [s]",
        ylabel="vel [m]"
    )

    display(plot(plt1, plt2, layout=(2, 1)))
end

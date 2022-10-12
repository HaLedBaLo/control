abstract type SimLog end

mutable struct SimLogBallbot <: SimLog
    t
    pos
    vel
    tao
end
include("plot_bb2d.jl")


# main plotting function, comment/uncomment desired plots
function plot_sim(logg::SimLogBallbot)
    plotly()
    plot_pos(logg)
    plot_vel(logg)
    plot_tilt_angle(logg)
    plot_angvel(logg)
end



println("*** Starting ***")

include("sim_settings.jl")
include("logging/plot_sim.jl")

# # initialize logging of simulation 
logg = SimLogBallbot(zeros(sim_length, 1), zeros(sim_length, 2), 
                     zeros(sim_length, 2), zeros(sim_length, 1))

# simulation loop
for i = 1:sim_length
    t = i * sim_step

    system_update!(ballbot)

    logg.t[i] = t
    logg.pos[i,:] = ballbot.state[1:2]
    logg.vel[i,:] = ballbot.state[3:4]
end

plot_sim(logg)

println("*** Starting ***")

include("sim_settings.jl")
inlcude("plot_sim.jl")

# # initialize logging of simulation 
# logg = log_init(sim_model, sim_length)

# simulation loop
for i = 1:sim_length
    system_update!ballbot(ballbot)
end

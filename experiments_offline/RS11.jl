using POMCGraphSearch
using POMDPs
using Random
using POMDPTools
using RockSample

Random.seed!(1)

pomdp = RockSamplePOMDP(11, 11)  

pomcgs = SolverPOMCGS(pomdp;
    max_b_gap = 0.3,
    max_search_depth = 40,
    nb_particles = 50000,
    epsilon_VMDP = 0.01,
    num_sim_per_sa = 20
)


solve(pomcgs, pomdp)

ExportLogData(pomcgs, "RS11_log")
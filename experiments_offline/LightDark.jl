using POMCGraphSearch
using POMDPs
using Random
using POMDPTools
using POMDPModels

Random.seed!(1)

pomdp = LightDark1D()
pomcgs = SolverPOMCGS(pomdp;
    max_b_gap=0.15,
    max_planning_secs=3600.0, 
    max_search_depth=30,
    num_fixed_observations=15,
    state_grid = [1.0, 1.0],
    num_sim_per_sa=1000
)

solve(pomcgs, pomdp)
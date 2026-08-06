using POMCGraphSearch
using POMDPModels, POMDPTools, POMDPs, Distributions, StatsBase
using TagPOMDPProblem
using CSV, DataFrames
using Random 

Random.seed!(1)


pomdp = TagPOMDP()

pomcgs = SolverPOMCGS(pomdp;
    max_b_gap = 0.2,
    max_search_depth = 50,
    C_star = 1000,
    num_sim_per_sa = 1000
)


solve(pomcgs, pomdp)
ExportLogData(pomcgs, "Tag_log.csv")


using POMCGraphSearch
using POMDPModels, POMDPTools, POMDPs, Distributions, StatsBase
using RockSample
using CSV, DataFrames
using Random 

Random.seed!(1)


pomdp = RockSamplePOMDP(7,8)

pomcgs = SolverPOMCGS(pomdp;
    max_b_gap = 0.2,
    max_search_depth = 30,
    num_sim_per_sa = 20
)

planning_time = 2.0
max_depth = 100
nb_runs = 100 

results = Float64[]

for i in 1:nb_runs
    # run_return = POMCGraphSearch.SolveOnline(pomcgs, max_depth, planning_time; verbose=true)
    run_return = POMCGraphSearch.SolveOnline(pomcgs, max_depth, planning_time; verbose=false)
    push!(results, run_return)
    println("Run $i: $run_return")
end

# Save results to CSV
df = DataFrame(run_id = 1:nb_runs, return_value = results)
CSV.write("pomcgs_results_RS78.csv", df)

println("\nTotal return: $(sum(results))")
println("Average return: $(mean(results))")
println("Results saved to pomcgs_results.csv")
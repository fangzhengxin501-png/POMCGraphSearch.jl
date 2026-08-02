using POMCGraphSearch
using POMDPModels, POMDPTools, POMDPs, Distributions, StatsBase
using RockSample
using CSV, DataFrames
using Random 

Random.seed!(1)


pomdp = RockSamplePOMDP(15,15)

pomcgs = SolverPOMCGS(pomdp;
    max_b_gap = 0.2,
    max_search_depth = 40,
    num_sim_per_sa = 20,
    max_planning_secs = 36000.0,
    nb_particles = 50000,
    nb_sim_VMDP = 50000,
    epsilon_VMDP = 0.01
)


planning_time = 5.0
max_depth = 100
nb_runs = 100 

results = Float64[]

for i in 1:nb_runs
    run_return = POMCGraphSearch.SolveOnline(pomcgs, max_depth, planning_time; verbose=true)
    push!(results, run_return)
    println("Run $i: $run_return")
end

# Save results to CSV
df = DataFrame(run_id = 1:nb_runs, return_value = results)
CSV.write("pomcgs_results_RS1515.csv", df)

println("\nTotal return: $(sum(results))")
println("Average return: $(mean(results))")
println("Results saved to pomcgs_results.csv")
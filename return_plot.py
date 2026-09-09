import numpy as np
import matplotlib.pyplot as plt
import pandas as pd


import pandas as pd

def S_M(csv_path: str):
    df = pd.read_csv(csv_path)
    return [df["return_value"].sum(), df["return_value"].mean()]

A = [2,5,7,10,20,30,35,50,60,70,80,90,100]
R = []
for i in A:
    _, mean = S_M(f"/Users/zhengxinfang/Documents/intern-2026/POMCGraphSearch.jl/data_storage_week4/0.03_10_nobs{i}.csv")
    R.append(mean)

plt.figure(figsize=(10, 5))
plt.plot(A, R, marker="o", linestyle="-", markersize=3)
plt.xlabel("number of fixed observations")
plt.ylabel("average reward per run in 100 runs")
plt.grid(True)
plt.tight_layout()
#plt.savefig("rewards_plot.png")  # saves to file
plt.show()                       # displays it (if running interactively)

print(A); print(R)
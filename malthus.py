"""Testing when Mathusian dynamics with forgetting leads to sustained growth in Knowledge"""

import matplotlib.pyplot as plt
import numpy as np

BETA = 0.2
GAMMA = 0.5
DELTA = 0.05
PHI = 0.3
N = 0.01

L_0 = 1.0
A_0 = 1.0
N_STEPS = 100

k_grid = np.linspace(0, N_STEPS + 1, N_STEPS + 1)


def Y(A, L) -> float:
    return A * L ** (1 - BETA)


def dot_A(L, A) -> float:
    return GAMMA * L * A**PHI - DELTA * A


def dot_L(L, Y) -> float:

    y = Y / L
    return L * f(y)


def f(y) -> float:
    if y <= 0:
        print("All humans are dead")
    return max(-0.999, min(np.log(y), N))


def plot_solo() -> None:
    A_vals = [A_0]
    L_vals = [L_0]
    Y_vals = [Y(A_0, L_0)]

    y_vals = [Y_vals[0] / L_0]

    for t in range(N_STEPS):
        A_old = A_vals[t]
        L_old = L_vals[t]
        Y_old = Y_vals[t]

        A_new = A_old + dot_A(L_old, A_old)
        L_new = L_old + dot_L(L_old, Y_old)
        Y_new = Y(A_new, L_new)

        if t == 50:
            Y_new /= 2
        A_vals.append(A_new)
        L_vals.append(L_new)
        Y_vals.append(Y_new)

        y_vals.append(Y_new / L_new)

    fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(14, 6))

    ax1.plot(k_grid, Y_vals, label="GDP", color="orange")
    ax1.plot(k_grid, A_vals, label="Level of A", color="blue", linestyle=":")
    ax1.plot(k_grid, L_vals, label="Population", color="green", linestyle="-.")
    ax1.plot(k_grid, y_vals, label="GDP per capita", color="green")
    ax1.set_xlabel("Steps")
    ax1.set_ylabel("Values")
    ax1.legend()

    ax2.plot(k_grid, np.log(Y_vals), label="GDP", color="orange")
    ax2.plot(k_grid, np.log(A_vals), label="Level of A", color="blue", linestyle=":")
    ax2.plot(k_grid, np.log(L_vals), label="Population", color="green", linestyle="-.")
    ax2.plot(k_grid, np.log(y_vals), label="GDP per capita", color="green")
    ax2.set_xlabel("Steps")
    ax2.set_ylabel("Log Values")
    ax2.legend()

    plt.tight_layout()
    plt.show()


plot_solo()

A = 2.94
EAF = 1.41737
SF = [6.20, 3.04,  2.19, 4.24, 4.68]
KSLOC_avg = 9890.0 / 1000.0
KSLOC_max = 14405.0 / 1000.0
B = 0.91
E = B + 0.01 * sum(SF)

effort_avg = A * EAF * KSLOC_avg ** E
effort_max = A * EAF * KSLOC_max ** E

F = 0.28 + 0.3 * (E - B)
duration_avg = 3.67 * effort_avg ** F
duration_max = 3.67 * effort_max ** F

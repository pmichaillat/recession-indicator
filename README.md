# Has the Recession Started? – Code and Data

This repository contains the code and data accompanying the paper "Has the Recession Started?", written by [Pascal Michaillat](https://pascalmichaillat.org) and [Emmanuel Saez](https://eml.berkeley.edu/~saez/), and posted on [arXiv](https://doi.org/10.48550/arXiv.2408.05856) in September 2024.

## Paper webpage

The paper is available at https://pascalmichaillat.org/16/.

## Raw data

The raw data used to produce the results in the paper are stored as CSV files. The data are placed in the folder `raw`. 

+ `20210719_cycle_dates_pasted.csv` – US recession dates, 1929–2022
	+ Source: [National Bureau of Economic Research (2023)](https://www.nber.org/research/data/us-business-cycle-expansions-and-contractions)
+ `CLF16OV.csv` – US labor-force level, 1948–2024
	+ Source: [US Bureau of Labor Statistics (2024)](https://fred.stlouisfed.org/series/CLF16OV)
+ `CompositeHWI.xlsx - Sheet1.csv` – US vacancy rate, 1951–2020
	+ Source: [Barnichon (2010)](https://docs.google.com/spreadsheets/d/1fkMinSHkjTL99-bLZYFldQ8rHtgh8lxd)
+ `HistoricalSeries_JME_2020January.csv` – US unemployment and vacancy rates, 1890–2017
	+ Source: [Petrosky-Nadeau, Zhang (2021)](https://docs.google.com/spreadsheets/d/1Ym0zkHZtIvb73zjLzL2cz_P5lXrulzFgvZpA5ZYyElI)
+ `JTSJOL.csv` – US Job openings, 2001–2024
	+ Source: [US Bureau of Labor Statistics (2024)](https://fred.stlouisfed.org/series/JTSJOL)
+ `UNEMPLOY.csv` – US unemployment level, 1948–2024
	+ Source: [US Bureau of Labor Statistics (2024)](https://fred.stlouisfed.org/series/UNEMPLOY)
	
## Code

The results in the paper are produced with MATLAB code. The code is placed in the folder `code`.

### Main script

The main script, `main.m`, orchestrates the production of the results in the paper. The script produces the 9 figures presented in the paper. The script generates each figure in a figure window and saves the figures as PDF files. The script also saves the data used to generate each figure in CSV files.

### Setup scripts

Before the computations begin, the main script calls two setup scripts:

+ `setup.m` – Close figure windows, clear workspace and command window, set paths to folders with raw data and figures
+ `formatFigure` – Format default figure, and predefine line and axis styles

### Production scripts

The main script produces the individual figures using a collection of production scripts:

+ `figure1.m` – Produce figure 1
+ `figure2A.m` – Produce figure 2A
+ `figure2B.m` – Produce figure 2B
+ `figure34.m` – Produce figures 3 and 4
+ `figure5.m` – Produce figure 5
+ `figure6.m` – Produce figures 6A and 6B
+ `figure7.m` – Produce figure 7

Each script produces a figure in a figure window, saves a copy of the figure in PDF format, and saves the data used to generate each figure in CSV files.

### Helper functions

The production scripts rely on a collection of helper functions:
 
+ `getRecession.m` – Return US recession dates, 1929–2022
+ `getUnemployment.m` – Compute and return US unemployment rate, 1929–2024
+ `getVacancy.m` – Compute and return US vacancy rate, 1929–2024
+ `createIndicatorCountercyclical` – Apply the Sahm filter to a countercyclical variable 
+ `createIndicatorProcyclical` – Apply the Sahm filter to a procyclical variable 

## Figures

The 9 figures produced by the code are saved as 9 PDF files. The data underlying each figure are saved in 9 CSV files. All the files are placed in the folder `figures`, each corresponding to a specific figure in the paper:

+ `figure1.pdf`, `figure1.csv` – Figure 1
+ `figure2A.pdf`, `figure2A.csv` – Figure 2A
+ `figure2B.pdf`, `figure2B.csv` – Figure 2B
+ `figure3.pdf`, `figure34.csv` – Figure 3
+ `figure4.pdf`, `figure34.csv` – Figure 4
+ `figure5.pdf`, `figure5.csv` – Figure 5
+ `figure6A.pdf`, `figure6.csv` – Figure 6A
+ `figure6B.pdf`, `figure6.csv` – Figure 6B
+ `figure7.pdf`, `figure7.csv` – Figure 7

## Software

The results were obtained using MATLAB R2024a on an Apple Silicon Mac running macOS Sonoma 14.6.1.

## License

The content of this repository is licensed under the terms of the MIT License.

## Related code

+ [Python version of this code](https://github.com/fatalfeel/new_sahm_rule/tree/main/pysource) – Written by Jesse Stone.
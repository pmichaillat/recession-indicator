function u = getUnemployment()

global inputFolder

%% Get unemployment rate for 1929M4–1947M12

uRate1929 = readmatrix([inputFolder,'HistoricalSeries_JME_2020January.csv'], 'Range', 'B477:B701')./100;

%% Get unemployment rate for 1948M1–2024M7

% Read unemployment level
uLevel1948 = readmatrix([inputFolder,'UNEMPLOY.csv'], 'Range', 'B2:B921');

% Read monthly labor-force level
laborforce = readmatrix([inputFolder,'CLF16OV.csv'], 'Range', 'B2:B921');

% Compute unemployment rate
uRate1948 = uLevel1948 ./ laborforce;

%% Splice two series into a long series

u = [uRate1929; uRate1948];
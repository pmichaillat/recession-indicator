function v = getVacancy()

global inputFolder

%% Get vacancy rate for 1929M4–1950M12

vRate1929 = readmatrix([inputFolder,'HistoricalSeries_JME_2020January.csv'], 'Range', 'D477:D737')./100;

%% Get vacancy rate for 1951M1–2000M12

vRate1951 = readmatrix([inputFolder,'CompositeHWI.xlsx - Sheet1.csv'], 'Range', 'C9:C608')./100;

%% Get vacancy rate for 2001M1–2024M7

% Read vacancy level
vLevel2001 = readmatrix([inputFolder,'JTSJOL.csv'], 'Range', 'B2:B285');

% Read labor-force level
laborforce = readmatrix([inputFolder,'CLF16OV.csv'], 'Range', 'B638:B921');

% Compute vacancy rate
vRate2001 = vLevel2001 ./ laborforce;

%% Splice three series into a long series

v = [vRate1929; vRate1951; vRate2001];
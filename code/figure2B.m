%% Specify output files

figureFile = [outputFolder, 'figure2B.pdf'];
dataFile = [outputFolder, 'figure2B.csv'];

%% Get data

% Get recessions dates
[startRecession, endRecession] = getRecession();

% Get unemployment rate
u = getUnemployment();

% Get vacancy rate
v = getVacancy();

%% Compute unemployment, vacancy, and minimum indicators

uIndicator  = createIndicatorCountercyclical(u,meanWindow,minWindow);
vIndicator  = createIndicatorProcyclical(v,meanWindow,minWindow);
minIndicator  = min(uIndicator,vIndicator);

%% Produce figure

iFigure = iFigure + 1;
figure(iFigure)
hold on

% Format x-axis
ax = gca;
set(ax, xaxis{:});
ax.XLim(1) = 1960;

% Format y-axis
ax.YLim = [0, 0.04];
ax.YTick =  [0:0.01:0.04];
ax.YTickLabel = ['0pp'; '1pp'; '2pp'; '3pp'; '4pp'];
ax.YLabel.String =  'Recession indicators';

% Paint recession areas
xregion(startRecession, endRecession, areaRecession{:});

% Plot unemployment and vacancy rates
plot(timeline, uIndicator, lineBlackThin{:})
plot(timeline, vIndicator, lineOrangeThin{:})
plot(timeline, minIndicator, linePurple{:})

% Plot recession threshold from Sahm rule
plot(timeline, lowThreshold.*ones(size(timeline)), linePinkThin{:})

% Save figure
print('-dpdf', figureFile)

%% Save data

% Write header
header = {'Year', 'Unemployment indicator', 'Vacancy indicator', 'Minimum indicator'};
writecell(header, dataFile, 'WriteMode', 'overwrite')

% Write data
data = [timeline, uIndicator, vIndicator, minIndicator];
idx = find(timeline == 1960);
writematrix(round(data(idx:end,:),4), dataFile, 'WriteMode', 'append')
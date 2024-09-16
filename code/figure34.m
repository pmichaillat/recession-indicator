%% Specify output files

figureFile1 = [outputFolder, 'figure3.pdf'];
figureFile2 = [outputFolder, 'figure4.pdf'];
dataFile = [outputFolder, 'figure34.csv'];

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
ax.YLim = [0, 0.02];
ax.YTick =  [0:0.005:0.02];
ax.YTickLabel = ['  0pp';'0.5pp'; '  1pp';'1.5pp'; '  2pp'];
ax.YLabel.String =  'Minimum indicator';

% Paint recession areas
xregion(startRecession, endRecession, areaRecession{:});

% Plot unemployment and vacancy rates
plot(timeline, minIndicator, linePurple{:})

% Plot recession threshold
plot(timeline, lowThreshold.*ones(size(timeline)), linePinkThin{:})

% Save first figure
print('-dpdf', figureFile1)

plot(timeline, highThreshold.*ones(size(timeline)), linePinkThin{:})

% Save second figure
print('-dpdf', figureFile2)

%% Save data

% Write header
header = {'Year', 'Minimum indicator'};
writecell(header, dataFile, 'WriteMode', 'overwrite')

% Write data
data = [timeline, minIndicator];
idx = find(timeline == 1960);
writematrix(round(data(idx:end,:), 4), dataFile, 'WriteMode', 'append')
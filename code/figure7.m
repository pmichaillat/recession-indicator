%% Specify output files

figureFile = [outputFolder, 'figure7.pdf'];
dataFile = [outputFolder, 'figure7.csv'];

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

% Format y-axis
ax.YLim = [0, 0.06];
ax.YTick =  [0:0.01:0.06];
ax.YTickLabel = ['0pp'; '1pp'; '2pp'; '3pp'; '4pp'; '5pp'; '6pp'];
ax.YLabel.String =  'Unemployment indicator';

% Paint recession areas
xregion(startRecession, endRecession, areaRecession{:});

% Plot unemployment and vacancy rates
plot(timeline, uIndicator, lineBlack{:})

% Plot recession threshold from Sahm rule
plot(timeline, sahmThreshold.*ones(size(timeline)), linePinkThin{:})

% Save figure
print('-dpdf', figureFile)

%% Save data

% Write header
header = {'Year', 'Unemployment indicator'};
writecell(header, dataFile, 'WriteMode', 'overwrite')

% Write data
data = [timeline, uIndicator];
writematrix(round(data,4), dataFile, 'WriteMode', 'append')
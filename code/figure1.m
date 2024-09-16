%% Specify output files

figureFile = [outputFolder, 'figure1.pdf'];
dataFile = [outputFolder, 'figure1.csv'];

%% Get data

% Get recessions dates
[startRecession, endRecession] = getRecession();

% Get unemployment rate
u = getUnemployment();

% Get vacancy rate
v = getVacancy();

%% Smooth unemployment and vacancy rates

% Compute trailing average of unemployment rate
uMean = movmean(u, [meanWindow-1,0]);

% Compute trailing average of vacancy rate
vMean = movmean(v, [meanWindow-1,0]);

%% Produce figure

iFigure = iFigure + 1;
figure(iFigure)
hold on

% Format x-axis
ax = gca;
set(ax, xaxis{:});
ax.XLim(1) = 1960;

% Format y-axis
ax.YLim = [0, 0.14];
ax.YTick =  [0:0.02:0.14];
ax.YTickLabel = [' 0%'; ' 2%'; ' 4%'; ' 6%'; ' 8%'; '10%'; '12%'; '14%'];
ax.YLabel.String =  'Share of labor force';

% Paint recession areas
xregion(startRecession, endRecession, areaRecession{:});

% Plot unemployment and vacancy rates
plot(timeline, uMean, lineBlack{:})
plot(timeline, vMean, lineOrange{:})

% Save figure
print('-dpdf', figureFile)

%% Save data

% Write header
header = {'Year', 'Smooth unemployment rate', 'Smooth vacancy rate'};
writecell(header, dataFile, 'WriteMode', 'overwrite')

% Write data
data = [timeline, uMean, vMean];
idx = find(timeline == 1960);
writematrix(round(data(idx:end,:), 4), dataFile, 'WriteMode', 'append')
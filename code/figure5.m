%% Specify output files

figureFile = [outputFolder, 'figure5.pdf'];
dataFile = [outputFolder, 'figure5.csv'];

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

probability = max(minIndicator,lowThreshold.*ones(size(minIndicator)));
probability = min(probability,highThreshold.*ones(size(minIndicator)));
probability = (probability-lowThreshold)./(highThreshold - lowThreshold);

%% Produce figure

iFigure = iFigure + 1;
figure(iFigure)
hold on

ax = gca;
set(ax, xaxis{:});
ax.XLim(1) = 1960;

ax.YLim = [0, 1];
ax.YTick =  [0:0.2:1];
ax.YTickLabel = ['  0%'; ' 20%'; ' 40%';' 60%'; ' 80%'; '100%'];

% Paint recession areas
xregion(startRecession, endRecession, areaRecession{:});

a = area(timeline, [zeros(size(probability)), probability], 'LineStyle', 'none');
a(1).FaceAlpha = 0;
a(2).FaceAlpha = 0.2;
a(2).FaceColor = purple;

plot(timeline, probability, linePurpleThin{:})
ylabel('Recession probability')

% Save figure
print('-dpdf', figureFile)

%% Save data

% Write header
header = {'Year', 'Recession probability'};
writecell(header, dataFile, 'WriteMode', 'overwrite')

% Write data
data = [timeline, probability];
idx = find(timeline == 1960);
writematrix(round(data(idx:end,:), 3), dataFile, 'WriteMode', 'append')

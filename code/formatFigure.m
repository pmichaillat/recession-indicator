%% formatFigure.m
% 
% Format default figure
%
%% Description
%
% This script modifies the default properties of figures. 
%
% The script also predefines a color palette composed of purple, pink, orange, and grays. Each color is specified in hexadecimal format (hex triplet) and encoded as a string.
%
% Finally, the script also predefines properties for areas, lines, markers, and the x-axis. These properties are contained in cell arrays.
%
%% Examples
%
%   plot(x, y, 'Color', pinkLight)
%   area(x, y, areaRecession{:})
%   plot(x, y, linePurple{:})
%   plot(x, y, markerOrange{:})

%

createProperty = @(obj) [fieldnames(obj), struct2cell(obj)]';

%% Set default properties for figures

widthFigure = 10;
heightFigure = 5.625;
set(groot, 'defaultFigureUnits', 'inches')
set(groot, 'defaultFigurePosition', [1,1,widthFigure,heightFigure]);
set(groot, 'defaultFigurePaperPosition', [0, 0, widthFigure,heightFigure]);
set(groot, 'defaultFigurePaperSize', [widthFigure,heightFigure]);
set(groot, 'defaultAxesFontName', 'Helvetica')
set(groot, 'defaultAxesFontSize', 15)
set(groot, 'defaultAxesLabelFontSizeMultiplier', 1)
set(groot, 'defaultAxesTitleFontSizeMultiplier', 1)
set(groot, 'defaultAxesTitleFontWeight', 'normal')
set(groot, 'defaultAxesXColor', 'black')
set(groot, 'defaultAxesYColor', 'black')
set(groot, 'defaultAxesGridColor', 'black')
set(groot, 'defaultAxesLineWidth', 0.8)
set(groot, 'defaultAxesYGrid', 'on')
set(groot, 'defaultAxesXGrid', 'off')
set(groot, 'defaultAxesTickDirMode', 'manual')
set(groot, 'defaultAxesTickDir', 'out')
set(groot,'defaultAxesTickLength', [0.005 0.005])
set(groot, 'defaultAxesMinorGridLineStyle', 'none')

%% Predefine color palette

orange = '#d95f02';
purple = '#59539d';
purpleStandard = '#7570b3';
purpleLight = '#bcbddc';
purpleMedium = '#9e9ac8';
pink = '#e7298a';
pinkLight = '#c994c7';
pinkMedium = '#df65b0';
grayLight = '#bdbdbd';
grayMedium = '#737373';
grayDark = '#252525';

%% Predefine area properties

clear obj
obj.FaceColor = 'black';
obj.LineStyle = 'none';
obj.FaceAlpha = 0.1;
areaRecession = createProperty(obj);

%% Predefine line properties

clear obj
obj.Color = orange;
obj.LineWidth = 2.4;
obj.LineStyle = '-';
lineOrange = createProperty(obj);

clear obj
obj.Color = orange;
obj.LineWidth = 2.4;
obj.LineStyle = '-.';
lineOrangeDash = createProperty(obj);

clear obj
obj.Color = orange;
obj.LineWidth = 0.8;
obj.LineStyle = '-';
lineOrangeThin = createProperty(obj);

clear obj
obj.Color = purple;
obj.LineWidth = 2.4;
linePurple = createProperty(obj);

clear obj
obj.Color = purple;
obj.LineWidth = 2.4;
obj.LineAlpha = 0.5;
linePurpleTransparent = createProperty(obj);

clear obj
obj.Color = purple;
obj.LineWidth = 1.2;
linePurpleThin = createProperty(obj);

clear obj
obj.Color = purpleLight;
obj.LineWidth = 2.4;
linePurpleLight = createProperty(obj);

clear obj
obj.Color = purpleMedium;
obj.LineWidth = 2.4;
linePurpleMedium = createProperty(obj);

clear obj
obj.Color = pink;
obj.LineWidth = 2.4;
linePink = createProperty(obj);

clear obj
obj.Color = pink;
obj.LineWidth = 1.2;
obj.LineStyle = '-.';
linePinkThin = createProperty(obj);

clear obj
obj.Color = pinkLight;
obj.LineWidth = 2.4;
obj.LineStyle = '-.';
linePinkDash = createProperty(obj);

clear obj
obj.Color = pinkLight;
obj.LineWidth = 2.4;
linePinkLight = createProperty(obj);

clear obj
obj.Color = pinkMedium;
obj.LineWidth = 2.4;
linePinkMedium = createProperty(obj);

clear obj
obj.Color = grayLight;
obj.LineWidth = 2.4;
obj.LineStyle = '-.';
lineGrayLight = createProperty(obj);

clear obj
obj.Color = grayMedium;
obj.LineWidth = 2.4;
obj.LineStyle = '-.';
lineGrayMedium = createProperty(obj);

clear obj
obj.Color = grayMedium;
obj.LineWidth = 0.8;
obj.LineStyle = '-.';
lineGrayMediumThin = createProperty(obj);

clear obj
obj.Color = grayDark;
obj.LineWidth = 2.4;
obj.LineStyle = '-.';
lineGrayDark = createProperty(obj);

clear obj
obj.Color = grayDark;
obj.LineWidth = 0.8;
obj.LineStyle = '-.';
lineGrayDarkThin = createProperty(obj);

clear obj
obj.Color = 'k';
obj.LineWidth = 2.4;
obj.LineStyle = '-';
lineBlack = createProperty(obj);

clear obj
obj.Color = 'k';
obj.LineWidth = 0.8;
obj.LineStyle = '-';
lineBlackThin = createProperty(obj);

%% Predefine axis properties

clear obj
obj.Xlim = [startDate, endDate];
obj.XTick = [1930, 1940, 1950, 1960, 1970, 1980, 1990, 2000, 2010, 2020];
xaxis = createProperty(obj);
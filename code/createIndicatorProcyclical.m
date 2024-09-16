function vIndicator = createIndicatorProcyclical(v, meanWindow, minWindow)

% Compute trailing average
vMean = movmean(v, [meanWindow - 1, 0]);

% Compute trailing maximum
vMax = movmax(vMean, [minWindow, 0]);

% Compute exact indicator
vIndicatorExact =  vMax - vMean;

% Round exact indicator
vIndicator = round(vIndicatorExact, 4);
function uIndicator = createIndicatorCountercyclical(u, meanWindow, minWindow)

% Compute trailing average
uMean = movmean(u, [meanWindow - 1, 0]);

% Compute trailing minimum
uMin = movmin(uMean, [minWindow, 0]);

% Compute exact indicator
uIndicatorExact = uMean - uMin;

% Round exact indicator
uIndicator = round(uIndicatorExact, 4);

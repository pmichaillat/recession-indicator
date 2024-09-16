function [startRecession, endRecession] = getRecession()

global inputFolder

% Read month numbers for recession start and end dates
startTable = readtable([inputFolder,'20210719_cycle_dates_pasted.csv'], 'Range', 'A22:A36');
endTable = readtable([inputFolder,'20210719_cycle_dates_pasted.csv'], 'Range', 'B22:B36');

% Transform table into datetime array 
startArray = table2array(startTable) + calmonths(1);
endArray = table2array(endTable);

% Translate dates into numbers
startRecession = year(startArray) + (month(startArray) - 1)./12; 
endRecession = year(endArray) + (month(endArray) - 1)./12;


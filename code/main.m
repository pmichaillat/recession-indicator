%% main.m
% 
% Main script
%
%% Description
%
% This is the main script for the paper. It constructs the figures included in the paper.
%
%% Output
%
% * The figures are saved as PDF files.
% * The figure data are saved as CSV files.
%

%% Set up computations

setup

%% Format default figure

formatFigure

%% Set parameters

% Set window for trailing average (in months)
meanWindow = 3;

% Set window for minimum (in months)
minWindow = 12;

%% Set thresholds

lowThreshold = 0.003;
highThreshold = 0.008;
sahmThreshold = 0.005;

%% Produce figures

figure1
figure2A
figure2B
figure34
figure5
figure6
figure7
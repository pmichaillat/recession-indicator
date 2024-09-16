%% setup.m
% 
% Setup script
%
%% Description
%
% This script sets up the computations: 
%
% * Close all figure windows
% * Clears workspace and command window
% * Set paths to input and output folders
%

%% Clear MATLAB

% Close figure windows
close all

% Clear workspace
clear

% Clear command window
clc

%% Set paths to input and output folders

global inputFolder outputFolder

% Path to folder with raw data
inputFolder = '../raw/';

% Path to folder with figures
outputFolder = '../figures/';

%% Set analysis dates

startDate = 1929.25;
endDate = 2024+7/12;
timeline = [startDate:1/12:endDate]';

%% Reset figure counter

global iFigure
iFigure = 0;
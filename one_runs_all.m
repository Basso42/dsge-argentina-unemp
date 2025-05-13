%% Set paths
currentFolder = pwd;
modelFolder = fullfile(currentFolder, 'unemployment_matlab')
dataFolder = fullfile(currentFolder, 'functions')


%% Get data
run(fullfile(dataFolder, 'data_argentina.m'));

%% Run baseline
cd(modelFolder);
dynare unemp_argentina_baseline.mod

%% Run estim
cd(modelFolder);
dynare unemp_argentina_estim_2000_2005.mod

%% Unemployment
% Get 1984 - 2024 from DBnomics
[~, output_table_unemp_DB, T_unemp_DB] = call_dbnomics('IMF/PGI/A.AR.LUR_PT');
% Keeps only the window we want, here 1987 - 1990
idx = (T_unemp_DB >= 1987) & (T_unemp_DB <= 1990);
output_table_unemp_DB = output_table_unemp_DB(idx, :);
T_unemp_DB = T_unemp_DB(idx);

% Get the rest of the time series from World Bank
[output_table_unemp_WB,~,T_unemp_WB] = call_worldbank('SL.UEM.TOTL.ZS/AR/1991:2023');

% Merging the two
years_WB = output_table_unemp_WB(:,1);           
values_WB = output_table_unemp_WB(:,2);

% Convert to table with the same variable name (e.g., 'PGI')
output_table_unemp_WB = array2table(values_WB, ...
    'VariableNames', {'PGI'}, ...
    'RowNames', cellstr(string(years_WB)));

output_table_unemp = [output_table_unemp_DB; output_table_unemp_WB];
years = str2double(output_table_unemp.Properties.RowNames);
values = table2array(output_table_unemp);
output_table_unemp = [years, values];
output_table_unemp = array2table(output_table_unemp);
output_table_unemp.Properties.VariableNames = ["Year","Unemployment"];



%% Key Interest Rate 
% Calling 2002 - 2024 from DBnomics
[~, output_table_r_DB,T_r_DB] = call_dbnomics( 'IMF/MFS/A.AR.FPOLM_PA');
% Keeps only the window we want, here 1987 - 1990
idx = (T_r_DB >= 1987) & (T_r_DB <= 2023);
output_table_r_DB = output_table_r_DB(idx, :);
T_r_DB = T_r_DB(idx);
years = str2double(output_table_r_DB.Properties.RowNames);
values = table2array(output_table_r_DB);
output_table_r_DB = [years, values];
output_table_r_DB = array2table(output_table_r_DB);
output_table_r_DB.Properties.VariableNames = ["Year","InterestRate"];

% 1987 - 2001 Manual data from https://econstats.com/ifs/NorGSc_OAC20_Y.htm
manual_data_interest = [1987 6.23 ;
                        1988 9.46 ;
                        1989 71.33;
                        1990 15.11;
                        1991 6.31 ;
                        1992 7.66 ;
                        1993 9.46 ;
                        1994 6.23 ;
                        1995 6.63 ;
                        1996 6.81 ;
                        1997 6.99 ;
                        1998 8.15 ;
                        1999 24.90;
                        2000 41.35;
                        2001 3.74 ];
           
manual_data_interest = array2table(manual_data_interest);
manual_data_interest.Properties.VariableNames = ["Year","InterestRate"];

% Concatenating
output_table_interest_rate = [manual_data_interest; output_table_r_DB];


%% Consumption Growth 
% Calling 1994 - 2023 from World Bank 
[output_table_conso_WB,~,T_cons_WB] = call_worldbank('NE.CON.PRVT.KD.ZG/AR/1987:2023');
output_table_conso_WB = array2table(output_table_conso_WB);
output_table_conso_WB.Properties.VariableNames = ["Year","ConsoGrowth"];

% 1987 - 1993 Manual data from https://ivanstat.com/en/hce/ar.html
manual_data_conso = [1987 2.6;
                   1988 -3.4;
                   1989 -11.4;
                   1990 12.2;
                   1991 18.3;
                   1992 11.9;
                   1993 2.4];
manual_data_conso = array2table(manual_data_conso);
manual_data_conso.Properties.VariableNames = ["Year","ConsoGrowth"];

% Concatenating
output_table_conso = [manual_data_conso; output_table_conso_WB];


%% GDP 1987 - 2023; Inflation 1987-2023 ;
[output_table_WB,~,T_WB] = call_worldbank('NY.GDP.MKTP.KD.ZG/AR/1987:2023', 'NY.GDP.DEFL.KD.ZG/AR/1987:2023');
output_table_WB = array2table(output_table_WB);
output_table_WB.Properties.VariableNames = ["Year","GDP", "Inflation"];

%% Merge all the data in one table
output_final = join(output_table_WB, output_table_unemp)
output_final = join(output_final, output_table_conso)
output_final = join(output_final, output_table_interest_rate)
output_final = table2array(output_final)
disp(output_final)

%% Spliting the datasets of the three inflation episodes
% 1988-1995
year_range_idx_1 = output_final(:,1) >= 1988 & output_final(:,1) <= 1995;
output_final_1988_1995 = output_final(year_range_idx_1, :);
T_1989 = output_final_1988_1995(:,1)
idx = find(~isnan(sum(output_final_1988_1995(:,1:end),2)));
output_final_1988_1995 	= output_final_1988_1995(idx,:);
T_1989 = T_1989(idx);
% 2000 - 2005
year_range_idx_2 = output_final(:,1) >= 2000 & output_final(:,1) <= 2005;
output_final_2000_2005 = output_final(year_range_idx_2, :);
T_2003 = output_final_2000_2005(:,1)
idx = find(~isnan(sum(output_final_2000_2005(:,1:end),2)));
output_final_2000_2005 	= output_final_2000_2005(idx,:);
T_2003 = T_2003(idx);
% 2020 - 2024
year_range_idx_3 = output_final(:,1) >= 2020 & output_final(:,1) <= 2024;
output_final_2020_2024 = output_final(year_range_idx_3, :);
T_2022 = output_final_2020_2024(:,1)
idx = find(~isnan(sum(output_final_2020_2024(:,1:end),2)));
output_final_2020_2024 	= output_final_2020_2024(idx,:);
T_2022 = T_2022(idx);


%% Fitting the data to expected format
T               = output_final(:,1)
idx 			= find(~isnan(sum(output_final(:,1:end),2)));
output_final 	= output_final(idx,:);
T				= T(idx);

% Taking observed values - ALL
gy_obs  = output_final(:,2)/100; % GDP
pi_obs  = output_final(:,3)/100; % Inflation
u_obs   = output_final(:,4)/100; % Unemployment
gc_obs  = output_final(:,5)/100; % Consumption Growth
r_obs   = output_final(:,6)/100 % Interest Rates
T = T(1:end);

% Taking observed values - 1988-1995
gy_obs_1989  = output_final_1988_1995(:,2); % GDP
pi_obs_1989 = output_final_1988_1995(:,3); % Inflation
u_obs_1989  = output_final_1988_1995(:,4); % Unemployment
gc_obs_1989  = output_final_1988_1995(:,5); % Consumption Growth
r_obs_1989  = output_final_1988_1995(:,6); % Interest Rates
T_1989 = T_1989(1:end);

% Taking observed values - 2000 - 2005
gy_obs_2003  = output_final_2000_2005(:,2); % GDP
pi_obs_2003 = output_final_2000_2005(:,3); % Inflation
u_obs_2003  = output_final_2000_2005(:,4); % Unemployment
gc_obs_2003  = output_final_2000_2005(:,5); % Consumption Growth
r_obs_2003  = output_final_2000_2005(:,6); % Interest Rates
T_2003 = T_2003(1:end);

% Taking observed values - 2020 - 2024
gy_obs_2022  = output_final_2020_2024(:,2); % GDP
pi_obs_2022 = output_final_2020_2024(:,3); % Inflation
u_obs_2022  = output_final_2020_2024(:,4); % Unemployment
gc_obs_2022  = output_final_2020_2024(:,5); % Consumption Growth
r_obs_2022  = output_final_2020_2024(:,6); % Interest Rates
T_2022 = T_2022(1:end);


%% Saving
currentFolder = pwd;
parentFolder = fileparts(currentFolder);
targetFolder_data = fullfile(parentFolder, 'unemployment_matlab')
targetFolder_figure = fullfile(parentFolder, 'results')

% save into obs_argentina.mat
savePath_data = fullfile(targetFolder_data, 'obs_argentina.mat');
save(savePath_data, 'gy_obs', 'pi_obs', 'u_obs', 'gc_obs', 'r_obs', 'T');

save(fullfile(targetFolder_data, 'obs_argentina_1988_1995.mat'), 'gy_obs_1989', 'pi_obs_1989', 'u_obs_1989', 'gc_obs_1989', 'r_obs_1989', 'T_1989');
save(fullfile(targetFolder_data, 'obs_argentina_2000_2005.mat'), 'gy_obs_2003', 'pi_obs_2003', 'u_obs_2003', 'gc_obs_2003', 'r_obs_2003', 'T_2003');
save(fullfile(targetFolder_data, 'obs_argentina_2020_2024.mat'), 'gy_obs_2022', 'pi_obs_2022', 'u_obs_2022', 'gc_obs_2022', 'r_obs_2022', 'T_2022');


% Figure
figure('Name','Data Series Visualization');
subplot(3,2,1)
plot(T,gy_obs)
xlim([min(T) max(T)]);
title('GDP Growth (YoY ; %)')
subplot(3,2,2)
plot(T,gc_obs)
xlim([min(T) max(T)]);
title('Consumption Growth (YoY ; %)')
subplot(3,2,3)
plot(T,u_obs)
xlim([min(T) max(T)]);
title('Unemployment Rate (YoY ; %)')
subplot(3,2,4)
plot(T,pi_obs)
xlim([min(T) max(T)]);
title('Inflation Rate, (YoY ; %)')
subplot(3,2,5)
plot(T,r_obs)
xlim([min(T) max(T)]);
title('Key MP Rate, (YoY ; %)')

print('-depsc', fullfile(targetFolder_figure, 'data_series_fig.eps'));





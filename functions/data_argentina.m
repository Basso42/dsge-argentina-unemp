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
disp(output_final)

% Taking observed values
gy_obs  = output_final(:,2); % GDP
pi_obs  = output_final(:,3); % Inflation
u_obs   = output_final(:,4); % Unemployment
gc_obs  = output_final(:,5); % Consumption Growth
r_obs   = output_final(:,6); % Interest Rates
T = output_final(:,1)

% save into obs_argentina.mat
save unemployment_matlab/obs_argentina gy_obs pi_obs u_obs gc_obs r_obs;


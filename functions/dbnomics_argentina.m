% Consumption Growth Rate, Investment, Interest Rates, Unemployment Rates,
% Government Expenditures
[output_table,~,T] = call_dbnomics( 'IMF/PGI/A.AR.NCP_​SA_​XDC', 'OECD/DSD_NAMAIN1@DF_QNA_EXPENDITURE_GROWTH_OECD/A.Y.ARG.S1.S1.P51G._​Z._​T._​Z.PC.L.G1.T0102', 'IMF/MFS/A.AR.FPOLM_PA', 'IMF/PGI/A.AR.LUR_​PT');


% select non NaN ids
idx 			= find(~isnan(sum(output_table(:,2:end),2)));
output_table 	= output_table(idx,:);
T				= T(idx);

% Taking observed values
gc_obs  = output_table(:,1);
gi_obs  = output_table(:,2);
r_obs   = output_table(:,3);
u_obs   = output_table(:,4);
T = T(2:end);

% save into myobs.mat
save myobs gc_obs gi_obs r_obs u_obs;


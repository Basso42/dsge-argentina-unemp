% Consumption Growth Rate, Investment, Interest Rates, Unemployment Rates,
% Government Expenditures
[output_table,~,T] = call_dbnomics( ...
    'IMF/PGI/A.AR.NCP_​SA_​XDC', ...   % Consumption growth rate 2004 - 2019
    'OECD/DSD_NAMAIN1@DF_QNA_EXPENDITURE_GROWTH_OECD/A.Y.ARG.S1.S1.P51G._​Z._​T._​Z.PC.L.G1.T0102', ... % Investment 2005 - 2024
    'IMF/MFS/A.AR.FPOLM_PA', ... % Interest Rates 2002 - 2024
    'IMF/PGI/A.AR.LUR_​PT', ... % Unemployment 1986 - 2014
    );


% select non NaN ids
idx 			= find(~isnan(sum(output_table(:,2:end),2)));
output_table 	= output_table(idx,:);
T				= T(idx);


%% taking in real growth rates per capita
gy_obs  = diff(log(output_table(:,2)./(def)));
gc_obs  = diff(log(output_table(:,3)./(def)));
gi_obs  = diff(log(output_table(:,4)./(def)));

% hours worked as a fraction per day instead of weekly amount
h_obs	= output_table(2:end,6)/(7*24);

% inflation rate
pi_obs  = diff(log(def));
% quarterly interest rate
r_obs	= output_table(2:end,7)/400;

T = T(2:end);

% save into myobs.mat
save myobs gy_obs gc_obs gi_obs h_obs T pi_obs r_obs;

figure;
subplot(2,2,1)
plot(T,gy_obs)
xlim([min(T) max(T)]);
title('output growth')
subplot(2,2,2)
plot(T,gc_obs)
xlim([min(T) max(T)]);
title('consumption growth')
subplot(2,2,3)
plot(T,gi_obs)
xlim([min(T) max(T)]);
title('investment growth')
subplot(2,2,4)
plot(T,h_obs)
xlim([min(T) max(T)]);
title('hours worked')


figure;
subplot(1,3,1)
plot(T,gy_obs)
xlim([min(T) max(T)]);
title('output growth')
subplot(1,3,2)
plot(T,pi_obs)
xlim([min(T) max(T)]);
title('inflation rate')
subplot(1,3,3)
plot(T,r_obs)
xlim([min(T) max(T)]);
title('nominal rate')

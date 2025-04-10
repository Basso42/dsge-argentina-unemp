clear all; close all; clc;


% Add the functions folder to the MATLAB path
addpath('functions/');


[output_table,~,T] = call_dbnomics('OECD/QNA/USA.B1_GE.CQRSA.Q','OECD/QNA/USA.P31DC.CQRSA.Q','OECD/QNA/USA.P51.CQRSA.Q','OECD/QNA/USA.B1_GE.DNBSA.Q','OECD/MEI/USA.HOHWMN02.STSA.Q','OECD/KEI/IR3TIB01.USA.ST.Q');
% Output, Consumption, Investment, Deflator, Weekly Hours, Nominal Rate

figure;
plot(T, output_table(:,2)); %we select the second column because first contains time (I think lol)

% Use the econometrics toolobox to assess the stationarity of the time
% series


% select non NaN ids
idx 			= find(~isnan(sum(output_table(:,2:end),2)));
output_table 	= output_table(idx,:);
T				= T(idx);


% we normalize to one prices and in population for 2015
id2015 = find(T==2015);
def = output_table(:,5)/output_table(id2015,5);


%% taking in real growth rates per capita
gy_obs  = diff(log(output_table(:,2)./(def)));
gc_obs  = diff(log(output_table(:,3)./(def)));
gi_obs  = diff(log(output_table(:,4)./(def)));

% hours worked as a fraction per day instead of weekly amount
h_obs	= output_table(2:end,6)/(7*24);

% inflation rate
pi_obs  = diff(log(def));
% quarterly interest rate, care -> interest rate are often yearly in
% providers database
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

% Remove the functions folder from the path (optional cleanup)
rmpath('functions/');
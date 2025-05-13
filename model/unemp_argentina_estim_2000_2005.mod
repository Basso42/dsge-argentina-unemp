% Model of unemployment for Argentina (Basso F. and Stizi N.)
% Inspired by "Toy Model of Unemployment" by gauthier@vermandel.fr
% Revised version for Argentina 1989, free of environmental consideration.

%----------------------------------------------------------------
% 0. Housekeeping (close all graphic windows)
%----------------------------------------------------------------

close all;

%----------------------------------------------------------------
% 1. Defining variables
%----------------------------------------------------------------

var rr c n u w y k i lb mc pi r z x v_H v_P g gy_obs_2003 gc_obs_2003 pi_obs_2003 r_obs_2003 u_obs_2003 varrho;
var e_a e_g e_c e_m e_i e_r;


varexo eta_a eta_g eta_c eta_m eta_i eta_r;
 
parameters beta delta alpha sigmaC sigmaL delta_N chi phi gy b  Gam eta gamma epsilon kappa rho phi_y phi_pi xi
			y0 A  piss  rho_a rho_g rho_c rho_m rho_i rho_r rho_t;
            
            
%----------------------------------------------------------------
% 2. Calibration
%----------------------------------------------------------------
delta_N = .1;		% separation rate
eta		= .5;		% negotiation share
phi		= 0.05;		% shape hiring cost function
beta 	= 0.994; 	% Discount factor firms
delta 	= 0.025;	% Depreciation rate
alpha 	= 0.30;		% Capital share
gy 		= 0.22;   	% Public spending in GDP
sigmaC 	= 1.68;		% Consumption risk aversion
sigmaL 	= 2; 		% Elasticity of labor
epsilon = 10;		% Elasticity between goods
rho 	= 0.44;		% Monetary policy smoothing
phi_y	= 0.025;	% Monetary policy reaction to output
phi_pi	= 1.1;		% Monetary policy reaction to inflation
xi 		= 80;		% Adjustment costs on prices
kappa	= 4;		% adjustment costs on investment
gamma	= .07;		% unemployment insurance as % of real wage
piss	= 0.35;	    % steady state inflation in Argentina
y0      = 11.5;

% autoregressive roots parameters
rho_a	= 0.95;
rho_g	= 0.95;
rho_c	= 0.95;
rho_m  	= 0.95;
rho_i	= 0.95;
rho_r	= 0.40;

%----------------------------------------------------------------
% 3. Model
%----------------------------------------------------------------

model; 
	%% Household
	[name='marginal utility of consumption']
	lb = e_c*c^-sigmaC;
	[name='Euler']
	beta*lb(+1)/lb*rr = 1;
	[name='Labor Supply']
	v_H = w - b - chi/lb + beta*(1-delta_N)*v_H(+1);
	[name='Employment law of motion']
	n = (1-delta_N)*n(-1) + x*u;

	%% Production
	[name='technology']
	y = A*e_a*(k(-1)^alpha)*(n^(1-alpha));
	[name='Capital law of motion']
	i*e_i*(1-(kappa/2)*(i/i(-1)-1)^2) = k-(1-delta)*k(-1);
	[name='FOC k']
	((1-delta)*z(+1)+alpha*varrho(+1)*y(+1)/k) = z*rr;
	[name='FOC i']
 	e_i*z = 1 + e_i*z*(kappa/2)*( 1 + ( 3*i/i(-1)-4 )*i/i(-1) )
			+ beta*lb(+1)/lb*e_i(+1)*z(+1)*kappa*(1-i(+1)/i)*(i(+1)/i)^2;
	[name='FOC n']
	v_P = (1-alpha)*varrho*y/n - w + beta*lb(+1)/lb*(1-delta_N)*v_P(+1);
	[name='FOC x']
	Gam*x^phi = v_P;
	[name='NKPC']
	(1-epsilon) + epsilon*mc - xi*pi*(pi-steady_state(pi)) + xi*beta*lb(+1)/lb*y(+1)/y*pi(+1)*(pi(+1)-steady_state(pi));
	[name='wage']
	(1-e_m*eta)*v_H = e_m*eta*v_P;
	[name='FOC y']
	varrho = mc;
	
	
	%% AGGREGATION
	[name='Resources Constraint']
	y = c + i + g  + xi/2*(pi-steady_state(pi))^2*y + Gam/(1+phi)*x^(1+phi)*u;
	[name='Unemployment rate']
	u = 1-n;	
	[name='Fisherian equation']
	rr = r/pi(+1);
	
	%%% Policy instruments
	[name='Monetary Policy rule']
	r = r(-1)^rho * (steady_state(r)*(pi/steady_state(pi))^phi_pi*(y/steady_state(y))^phi_y)^(1-rho) * e_r;
	[name='Public spending']
	g = gy*steady_state(y)*e_g;
	
	
	%% Observable variables 
	[name='measurement GDP']
	gy_obs_2003 = log(y/y(-1));
	[name='measurement consumption']
	gc_obs_2003 = log(c/c(-1));
	[name='measurement inflation']
	pi_obs_2003 = pi - steady_state(pi);
	[name='measurement interest rate']
	r_obs_2003  = r  - steady_state(r);
	[name='measurement unemployment']
	u_obs_2003  = u  - steady_state(u);
	
	[name='shocks']
	log(e_a) = rho_a*log(e_a(-1))+eta_a;
	log(e_g) = rho_g*log(e_g(-1))+eta_g;
	log(e_c) = rho_c*log(e_c(-1))+eta_c;
	log(e_i) = rho_i*log(e_i(-1))+eta_i;
    log(e_m) = rho_m*log(e_m(-1))+eta_m;
    log(e_r) = rho_r*log(e_r(-1))+eta_r;
end;

%----------------------------------------------------------------
% 3bis. Call and generate datafile
%----------------------------------------------------------------
addpath('../functions');
disp('Generating datafile...');
data_argentina;
disp('Datafile generated...');
addpath('../data');
    
%----------------------------------------------------------------
% 4. Computation
%----------------------------------------------------------------
steady_state_model;
	pi		= piss;
	rr		= 1/beta;
	r		= rr*pi;
	y		= y0;
	mc		= (epsilon-1)/epsilon;
	varrho 	= mc;
	z		= 1;
	u 		= .06;
	n 		= 1-u;
	k		=	alpha*varrho*y/(rr-(1-delta));
	A		= y/(k^alpha*n^(1-alpha));
	i		= delta*k;
	x 		= delta_N*n/u;	
	Gam 	= 0.01*y / (x^(1+phi)*u/(1+phi));
	v_P 	= Gam*x^phi;
	v_H 	= eta/(1-eta)*v_P;
	w 		= (1-alpha)*varrho*y/n - v_P  + beta*((1-delta_N-0*x)*v_P+0*phi/2*x^2);
	c  		= (1-gy)*y-i-Gam/(1+phi)*x^(1+phi)*u;
	lb 		= c^-sigmaC;
	chi 	= ((1-gamma)*w - v_H*(1-beta*(1-delta_N-0*x)))*lb;
	g 		= gy*y;
	b		= gamma*w;
	e_a 	= 1;
	e_g 	= 1;
	e_c 	= 1;
	e_m 	= 1;
	e_i 	= 1;
	e_r 	= 1;
	gy_obs_2003 = 0; gc_obs_2003 = 0; pi_obs_2003 = 0; r_obs_2003 = 0; u_obs_2003 = 0; 
end;


varobs gy_obs_2003 pi_obs_2003 r_obs_2003 gc_obs_2003 u_obs_2003;


estimated_params;
//	PARAM NAME,		INITVAL,	LB,		UB,		PRIOR_SHAPE,		PRIOR_P1,		PRIOR_P2,		PRIOR_P3,		PRIOR_P4,		JSCALE
	stderr eta_g,   	,		,		,	    INV_GAMMA_PDF,	        1.1,			0.14;
	rho_g,				,    	,		,		beta_pdf,			    .84,			0.04;

	stderr eta_r,   	,		,		,		INV_GAMMA_PDF,		    0.06,			0.02;
	rho_r,				,    	,		,		beta_pdf,			    .5,				0.2;

	stderr eta_c,   	,		,		,		INV_GAMMA_PDF,		    0.05,			2;
	rho_c,				,    	,		,		beta_pdf,			    .5,				0.2;

    stderr eta_a,  0.01, , , inv_gamma_pdf, 0.01, 2;
    rho_a,				,    	,		,		beta_pdf,			    .5,				0.2;
    stderr eta_m,  0.01, , , inv_gamma_pdf, 0.01, 2;
    rho_m,				,    	,		,		beta_pdf,			    .5,				0.2;
    stderr eta_i,  0.01, , , inv_gamma_pdf, 0.01, 2;
    rho_i,				,    	,		,		beta_pdf,			    .5,				0.2;
	
	sigmaC,				2,    		,		,		normal_pdf,			1.5,				.35;
	kappa,				6,    		,		,		gamma_pdf,			4,				1.5;
	xi,					106,    	0,		,		gamma_pdf,			100,				15;
	rho,				,    	    ,		,		beta_pdf,			.45,				0.11;
	phi_pi,				1.8,    	,		,		gamma_pdf,			1.5,				0.25;
	phi_y,				0.05,    	,		,		gamma_pdf,			0.12,				0.05;
%	alpha,				0.25,    	,		,		beta_pdf,			0.3,				.05;

end;


%%% estimation of the model
estimation(datafile='../data/obs_argentina_2000_2005.mat',
first_obs=1,				
mode_compute=6,				
mh_replic=20000,				% number of sample in Metropolis-Hastings
mh_jscale=0.5,				% adjust this to have an acceptance rate between 0.2 and 0.3
prefilter=1,				
lik_init=2,					
mh_nblocks=1,				% number of mcmc chains
forecast=8					% forecasts horizon
) gy_obs_2003 pi_obs_2003 r_obs_2003 gc_obs_2003 u_obs_2003;



% load estimated parameters
fn = fieldnames(oo_.posterior_mean.parameters);
for ix = 1:size(fn,1)
	set_param_value(fn{ix},eval(['oo_.posterior_mean.parameters.' fn{ix} ]))
end
% load estimated shocks
fx = fieldnames(oo_.posterior_mean.shocks_std);
for ix = 1:size(fx,1)
	idx = strmatch(fx{ix},M_.exo_names,'exact');
	M_.Sigma_e(idx,idx) = eval(['oo_.posterior_mean.shocks_std.' fx{ix}])^2;
end

stoch_simul(irf=30,conditional_variance_decomposition=[1,4,10,100],order=1) gy_obs_2003 pi_obs_2003 r_obs_2003 gc_obs_2003 u_obs_2003;


clear all;
clc;

%% Initial Parameters
% Autocall structure with one coupon at the redemption/maturity parameters
T = 6;
Freq = 2;
B_Autocall = 100;
K_Put = 100; 
B_PDI = 70;
Coupon_Autocall = 0.0775;

% Market Parameters in percents
Spot_Init = 100;
Volatility = 0.15;
Rate = -0.0035; 
Dividend_Yield = 0.0464;
Repo = -0.0006;

% Generate trajectories
Nb_Trajectories = 10000;
Normal_Maxtrix = Generate_Normal_Matrix( T/Freq,Nb_Trajectories );
tic
[Prix_Snowball, Error_Snowball, Trajectories] = Price_Snowball(Coupon_Autocall,K_Put,B_PDI,0,B_Autocall,Freq,Spot_Init,Dividend_Yield,Repo,Volatility,Rate,T,Nb_Trajectories,Normal_Maxtrix);
toc
% plot(Trajectories')

% Sensibility to the interest rate and the volatility
Rho_start = -.05;
Rho_end = .05;
pas_rho = .005;
Vega_start = .08;
Vega_end = .2;
pas_vega = .01;
Rho = Rho_start:pas_rho:Rho_end;
Vega = Vega_start:pas_vega:Vega_end;

[r,v] = meshgrid(Rho,Vega);
Prices_Snowball = zeros(length(Vega),length(Rho));

for i = 1:length(Rho)
    for j = 1:length(Vega)
        Prices_Snowball(j,i) = Price_Snowball(Coupon_Autocall,K_Put,B_PDI,0,B_Autocall,Freq,Spot_Init,Dividend_Yield,Repo,Vega(j),Rho(i),T,Nb_Trajectories,Normal_Maxtrix);
    end
end
%%
figure
surf(r,v,Prices_Snowball)

%% Initial Parameters
% Autocall structure with one coupon at the redemption/maturity parameters
% Maturity 6 years no bonus coupon 
T = 6;
Freq = 1;
B_Autocall = 100;
K_Put = 100; 
B_PDI = 60;
Coupon_Autocall = 0.0525;

% Market Parameters in percents
Spot_Init = 100;
Volatility = 0.15;
Rate = -0.0035; 
Dividend_Yield = 0.0464;
Repo = -0.0006;

% Generate trajectories
Nb_Trajectories = 10000;
Normal_Maxtrix = Generate_Normal_Matrix( T/Freq,Nb_Trajectories );
tic
[Prix_Snowball, Error_Snowball, Trajectories] = Price_Snowball(Coupon_Autocall,K_Put,B_PDI,0,B_Autocall,Freq,Spot_Init,Dividend_Yield,Repo,Volatility,Rate,T,Nb_Trajectories,Normal_Maxtrix);
toc
% plot(Trajectories')

% Sensibility to the interest rate and the volatility
Rho_start = -.05;
Rho_end = .05;
pas_rho = .005;
Vega_start = .08;
Vega_end = .2;
pas_vega = .01;
Rho = Rho_start:pas_rho:Rho_end;
Vega = Vega_start:pas_vega:Vega_end;

[r,v] = meshgrid(Rho,Vega);
Prices_Snowball = zeros(length(Vega),length(Rho));

for i = 1:length(Rho)
    for j = 1:length(Vega)
        Prices_Snowball(j,i) = Price_Snowball(Coupon_Autocall,K_Put,B_PDI,0,B_Autocall,Freq,Spot_Init,Dividend_Yield,Repo,Vega(j),Rho(i),T,Nb_Trajectories,Normal_Maxtrix);
    end
end
%%
figure
surf(r,v,Prices_Snowball)







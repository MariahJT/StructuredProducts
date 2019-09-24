clear all;
clc;

%% Initial Parameters
% Guaranteed fund structure parameters
T = 8;
Freq = 1;
K_LC = 100; 
K_SC = 180;

% Market Parameters in percents
Spot_Init = 100;
Volatility = 0.15;
Rate = -0.0035; 
Dividend_Yield = 0.0464;
Repo = -0.0006;

% Generate trajectories
Nb_Trajectories = 100000;
Normal_Maxtrix = Generate_Normal_Matrix( T/Freq,Nb_Trajectories );
tic
Current_Price = Price_Guaranteed(K_LC,K_SC,Freq,Spot_Init,Dividend_Yield,Repo,Volatility,Rate,T,Nb_Trajectories,Normal_Maxtrix);
toc

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
Prices = zeros(length(Vega),length(Rho));

for i = 1:length(Rho)
    for j = 1:length(Vega)
        Prices(j,i) = Price_Guaranteed(K_LC,K_SC,Freq,Spot_Init,Dividend_Yield,Repo,Vega(j),Rho(i),T,Nb_Trajectories,Normal_Maxtrix);
    end
end

figure
surf(r,v,Prices)

%% Initial Parameters
% Protected fund structure parameters
T = 10;
Freq = 1;
K_LC = 90; 
K_SC = 190;

% Market Parameters in percents
Spot_Init = 100;
Volatility = 0.15;
Rate = -0.0035; 
Dividend_Yield = 0.0464;
Repo = -0.0006;

% Generate trajectories
Nb_Trajectories = 100000;
Normal_Maxtrix = Generate_Normal_Matrix( T/Freq,Nb_Trajectories );
tic
Current_Price90 = Price_Guaranteed(K_LC,K_SC,Freq,Spot_Init,Dividend_Yield,Repo,Volatility,Rate,T,Nb_Trajectories,Normal_Maxtrix);
toc

%% Sensibility to the interest rate and the volatility
Rho_start = -.05;
Rho_end = .05;
pas_rho = .005;
Vega_start = .08;
Vega_end = .2;
pas_vega = .01;
Rho = Rho_start:pas_rho:Rho_end;
Vega = Vega_start:pas_vega:Vega_end;

[r,v] = meshgrid(Rho,Vega);
Prices90 = zeros(length(Vega),length(Rho));

for i = 1:length(Rho)
    for j = 1:length(Vega)
        Prices90(j,i) = Price_Guaranteed(K_LC,K_SC,Freq,Spot_Init,Dividend_Yield,Repo,Vega(j),Rho(i),T,Nb_Trajectories,Normal_Maxtrix);
    end
end

figure
surf(r,v,Prices90)

%% Sensitbility to the cap and maturity
K_Cap = 160:200;
Maturity = 8:12;
[kc,t] = meshgrid(K_Cap,Maturity);
PricesCapped = zeros(length(Maturity),length(K_Cap));
Nb_Trajectories = 100000;

for j = 1:length(Maturity)
    Normal_Maxtrix = Generate_Normal_Matrix(Maturity(j)/Freq,Nb_Trajectories);
    for i = 1:length(K_Cap)
         PricesCapped(j,i) = Price_Guaranteed(K_LC,K_Cap(i),Freq,Spot_Init,Dividend_Yield,Repo,Volatility,Rate,Maturity(j),Nb_Trajectories,Normal_Maxtrix);
    end
end

figure
surf(kc-100,t,PricesCapped)
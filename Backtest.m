clc;
clear all;
%% Import data
[dataLag, txt] = xlsread('StockMarketIndex','LaggedPrices');

%% Historical Data
% Underlying level compared to the initial level
S = dataLag(:,1:end-1);
% Interest rate at the initial dates
R = dataLag(:, end);
Dates = datetime(txt(2:end,1),'InputFormat','MM/dd/yyyy');
T = size(S,2)-1;
N = size(S,1);
%% The Call Spread Structure
BT = ZC(R/100,T);
Spot_Init = 100;
Strike_LC = 100;
Strike_SC = 180;
LC = max(S(:,end)-Strike_LC,0);
SC = max(S(:,end)-Strike_SC,0);

Perf_CallSpread = (LC - SC)/T/100;

plot(Dates,Perf_CallSpread);
title('Backtest Call Spread Strucuture')
xlabel('Initial Dates')
ylabel('Annual Return')

%%
Max = max(Perf_CallSpread);
summary(T)
%% Autocall strucuture
Spot_Init = 100;
Maturity = 6;
Freq = 2;
AutocallDates = 0:Freq:Maturity;

Spot_Trajectories = S(:,AutocallDates+1);

Price=zeros(N,1);
Boost=zeros(N,1);
Fixe=zeros(N,1);
Put=zeros(N,1);
ZCt=zeros(N,1);
IsActivated=zeros(N,1);
IsAutocalled=zeros(N,length(AutocallDates));
BarriereBoost = 100;
BarriereAutoCall = 100;
Coupon_Autocall = 0.0775;
Coupon_Boost = 0;
BarrierePDI = 70;
K_PDI = 100;
IsAmerican = 0;

for traj=1:N
    Boost(N) = 0;
    for t=2:length(AutocallDates)
            BT=ZC(R(traj)/100,t);
            if(IsAutocalled(traj,t-1))
                Boost(traj)=Boost(traj);
            elseif(Spot_Trajectories(traj,t)>= BarriereBoost && ~IsAutocalled(traj,t-1))
                Boost(traj)=BT*Coupon_Boost + Boost(traj); 
            end
   
            if(Spot_Trajectories(traj,t)>=BarriereAutoCall)
                IsAutocalled(traj,t)=1;
            else
                IsAutocalled(traj,t)=IsAutocalled(traj,t-1);
            end

            if( IsAutocalled(traj,t) && ~IsAutocalled(traj,t-1))
                ZCt(traj)=BT;
                Fixe(traj)=BT*Coupon_Autocall*(t-1)*Freq;
            end
            
            if(~IsAutocalled(traj,t-1)&& Spot_Trajectories(traj,t)<BarrierePDI)
                IsActivated(traj)=1;
            end
            
            if(~IsAutocalled(traj,t-1) && t==Maturity/Freq+1 && IsActivated(traj)==1)     
                if(IsAmerican==false)
                    ZCt(traj)=BT;
                    Put(traj)=ZCt(traj)*max((K_PDI-Spot_Trajectories(traj,t)),0)/K_PDI;
                end
            end

        Price(traj)= Fixe(traj)+Boost(traj)-Put(traj)+ZCt(traj);
    end
end

%%
RealMaturity = 8-2*sum(IsAutocalled,2);
RealMaturity(Maturity == 8) = 6;
AnnualReturn = (Price-1)./RealMaturity;
figure
plot(Dates,AnnualReturn);
title('Backtest Autocall Strucuture')
xlabel('Initial Dates')
ylabel('Annual Return')
mean(AnnualReturn)
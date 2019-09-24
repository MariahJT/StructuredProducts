function [ Prix, Error, Trajectories ] = Price_Snowball(Coupon_Autocall, Strike,BarrierePDI,IsAmerican,BarriereAutoCall, Freq, Spot_Init, Dividend_Yield, Repo, Volatility, Rate, Maturity, Nb_Trajectories, Normal_Maxtrix)

Dates = 0:Freq:Maturity;

if (nargin < 14)
    Spot_Trajectories = Generate_Trajectory_BS( Spot_Init,Dividend_Yield,Repo,Volatility,Rate,Dates,Nb_Trajectories);
else
    Spot_Trajectories = Generate_Trajectory_BS( Spot_Init,Dividend_Yield,Repo,Volatility,Rate,Dates,Nb_Trajectories,Normal_Maxtrix);
end

Price=zeros(Nb_Trajectories,1);
Fixe=zeros(Nb_Trajectories,1);
Put=zeros(Nb_Trajectories,1);
ZCt=zeros(Nb_Trajectories,1);
IsActivated=zeros(Nb_Trajectories,1);
IsAutocalled=zeros(Nb_Trajectories,length(Dates));

for traj=1:Nb_Trajectories
    for t=2:length(Dates)
            BT=ZC(Rate,Dates(t));
            if t >= 2 
                if(Spot_Trajectories(traj,t)>BarriereAutoCall)
                    IsAutocalled(traj,t)=1;
                    if (~IsAutocalled(traj,t-1))
                        ZCt(traj)=BT;
                        Fixe(traj)=BT*Coupon_Autocall*(t-1)*Freq;
                    end 
                else
                    IsAutocalled(traj,t)=IsAutocalled(traj,t-1);
                end
            end

            if(~IsAutocalled(traj,t-1) && t==Maturity/Freq+1 && Spot_Trajectories(traj,t)<BarrierePDI)     
                if(IsAmerican==false)
                    IsActivated(traj)=1;
                    ZCt(traj)=BT;
                    Put(traj)=ZCt(traj)*max((Strike-Spot_Trajectories(traj,t)),0)/Strike;
                end
            end
        Price(traj)=Fixe(traj)-Put(traj)+ZCt(traj);
    end
end

Prix=mean(Price);
Error=std(Price);
Trajectories = Spot_Trajectories;

end


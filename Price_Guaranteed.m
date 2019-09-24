function [ Prix, Error, Trajectories ] = Price_Guaranteed(Strike_LC,Strike_SC, Freq, Spot_Init, Dividend_Yield, Repo, Volatility, Rate, Maturity, Nb_Trajectories, Normal_Maxtrix)

Dates = 0:Freq:Maturity;

if (nargin < 11)
    Spot_Trajectories = Generate_Trajectory_BS( Spot_Init,Dividend_Yield,Repo,Volatility,Rate,Dates,Nb_Trajectories);
else
    Spot_Trajectories = Generate_Trajectory_BS( Spot_Init,Dividend_Yield,Repo,Volatility,Rate,Dates,Nb_Trajectories,Normal_Maxtrix);
end

Price=zeros(Nb_Trajectories,1);
SC=zeros(Nb_Trajectories,1);
LC=zeros(Nb_Trajectories,1);
ZCt=zeros(Nb_Trajectories,1);

for traj=1:Nb_Trajectories
    BT=ZC(Rate,Dates(end));
    LC(traj) = max(Spot_Trajectories(traj,length(Dates))-Strike_LC,0)/Spot_Init;
    SC(traj) = max(Spot_Trajectories(traj,length(Dates))-Strike_SC,0)/Spot_Init;
    ZCt(traj)= BT;
    Price(traj)=LC(traj)-SC(traj)+ZCt(traj);
end

Prix=mean(Price);
Error=std(Price);
Trajectories = Spot_Trajectories;

end


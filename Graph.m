% Graph
%% Call put parity
K_P = 100;
S = 0:200;
Payoff_S = S - 100;
Payoff_P = max(K_P - S,0)-2;
Payoff_Sum = Payoff_S + Payoff_P;
figure
plot(S, Payoff_S, S, Payoff_P);

ylim([-100 120])
title("Payoff of Put and Underlying at the Maturity")
xlabel('Underlying level compared to the initial level S(T)/S(0) per cent %')
ylabel('Payoff per cent %')

figure
plot(S, Payoff_Sum);

ylim([-10 100])
title("Payoff of Formula at the Maturity")
xlabel('Underlying level compared to the initial level S(T)/S(0) per cent %')
ylabel('Payoff per cent %')

%% Call spread
KL = 100;
KS = 180;
S = 0:280;
Payoff_LC = max( S - KL, 0)-4;
Payoff_SC = - max( S - KS, 0)+2;
Payoff = max(S - KL,0) - max( S - KS, 0)-2;
figure
plot(S, Payoff_LC, S, Payoff_SC)
ylim([-100 120])
title("Payoff of Long Call and Short Call at the Maturity")
xlabel('Underlying level compared to the initial level S(T)/S(0) per cent %')
ylabel('Payoff per cent %')

figure
plot(S, Payoff)
ylim([-10 90])
title("Payoff of Call Spread Formula at the Maturity")
xlabel('Underlying level compared to the initial level S(T)/S(0) per cent %')
ylabel('Payoff per cent %')

%% Market senario
B = 70-100;
Dates = 0:6;
AutocallDates = 0:2:6;
Senario1 = [100,96.2828670069228,67.7179641274161,48.6622417399317,46.6310088697741,50.7006606141825,46.9042931261169]-100;
figure
scatter(AutocallDates,Senario1(AutocallDates+1))
hold on
scatter(6,B,'d','filled');
hold on 
scatter(6,Senario1(7),'filled')
hold on
plot(Dates, Senario1)
title("Unfavorable Scenario")
xlabel('Dates')
ylabel('Underlying Performance %')
legend('Underlying level at observation dates','Protection Barrier','Underlying level at maturity','Underlying Prices')
grid on
%%
Senario2 = [100,87.8477291335618,80.0968057411964,64.9334611762712,63.3257908766159,74.5617233001950,71.7427413172931]-100;
figure
scatter(AutocallDates,Senario2(AutocallDates+1))
hold on
scatter(6,B,'d','filled');
hold on 
scatter(6,Senario2(7),'filled')
hold on
plot(Dates, Senario2)
hold on
scatter(6,0,'filled','s')
title("Neutral Scenario")
xlabel('Dates')
ylabel('Underlying Performance %')
legend('Underlying level at observation dates','Protection Barrier','Underlying level at maturity','Underlying Prices','Final NAV')
grid on

%%
Dates3 = 0:2:2;
Dates4 = 0:2:4;
Dates5 = 0:2:6;
Senario3 = [100,106.020603623751,110.291259393961,115.241436745826,116.436462293347,105.675489805577,97.5318388273930] -100;
Senario4 = [100,94.5961129645177,68.7195290221533,81.7664045953572,101.461587379134,139.269240450019,123.269002433028] -100;
Senario5 = [100,102.374654165728,99.5068168778265,80.8962504228438,76.9312969393716,88.6085795767641,101.371465965869] -100;
Coupon = AutocallDates*7.75;
figure
scatter(2,Senario3(3),'r');
hold on
scatter([2 4],Senario4(3:2:5),'g');
hold on
scatter([2 4 6],Senario5(3:2:7),'b');
hold on

plot(0:2,Senario3(1:3),0:4,Senario4(1:5),0:6,Senario5(1:7));

hold on

scatter(2:2:6,7.75*[2 4 6],'s','filled')
hold on

legend('Prices at observation dates 2y','Prices at observation dates 4y','Prices at observation dates 6y','Underlying prices 2y','Underlying prices 4y','Underlying prices 6y','Final Coupon' )
title("Favorable Scenario")
xlabel('Dates')
ylabel('Underlying Performance %')
%legend('Underlying level at observation dates','Underlying Prices','','Protection Barrier',)
grid on

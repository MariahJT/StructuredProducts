# Formula Structures
Formula funds are structured products whose payoff is pre-defined by a mathematical formula and depends on the performance of the benchmark index or portfolio or on other financial conditions. As stated in different types of protection, there are three main types of formula funds, guaranteed funds, protected funds and unprotected funds. The fund manager covers the risk by using derivatives such as call options, put options and OTC formula swaps that secure both the capital and the promised return. When the funds expires, the derivative sellers pay back the formula performance to the fund. 

## Guaranteed funds
The initial amount of capital is totally guaranteed in guaranteed funds. A typical example is a fund called ACTICCIA VIE launched in 2014 by AMUNDI Asset Management. This fund aimed at  institutional investors especially life insurance companies. The maturity of ACTICCIA VIE is fixed at 8 years. It offers a call spread payoff at the maturity so that the loss is limited and the gain is capped. If the value of underlying assets falls under 100% of its initial level at the maturity, the full amount will be recovered. 

The structure can be recognized as a call spread consisting in buying a call option on a lower strike and short selling another call option with a higher strike. Strike of the long call option is the protection level, and strike of the short call option corresponds to the capped performance level. 
Given a certain level of interest rates and market volatilities, we can calculate the cost of this formula. With respect to the Vega of this structure, the prices do not increase significantly as volatility surges. However, the prices are quite sensitive to interest rates at any level of volatility. This indicates that the price can be quite expensive for investors to buy such structure in a low interest rate environment. This is why the guaranteed level degraded to 90% after 2014 for other funds in the same category.

## Protected funds
Similar to guaranteed funds, risk of capital loss is limited in protected funds where a certain percentage of the origin investment is locked above the given rate of protection. This is the case of ACTICCIA VIE 90 which has the same structure as ACTICCIA VIE 90 launched in 2015. 

The protection level is set at 90% of the initial investment. At the expiration dates, if the performance of its underlying assets is under 90%, a protection is triggered and the derivative seller will help fix the capital to 90%. The sensibility of this structure stays the same. Yet a longer maturity allows fund managers to finance the purchase of formula with a backing portfolio composed of longer maturity and higher coupon bonds. While other factors remain unchanged, we observe that the cost of the structure is minimized at 10 years’ maturity. Regarding the ceiling of the performance, the prices are not quite sensitive to the ceiling especially when the maturity is 10 years.
	
## Unprotected funds
Unlike stock funds the unprotected formula funds provide with a recovery of capital under certain circumstances. Autocall structure is often put into use, for example, LCL AUTOCALL 2019. There is a floor of protection of 70% i.e. if the underlying asset loses less than 30%, the initial capital will be refunded. Though protection exists, the underlying asset may lose more than 30% in an extreme unfavorable market context and investors may suffer the capital loss. 

However if the underlying asset is worth more than its initial level at the observation dates, the fund expires immediately and will be paid a snowball coupon. The 6 years’ maturity is the maximum maturity if the autocall is not triggered at the end of the 2nd or the 4th year.

* Relying on static hedging theories, any option of intrinsic value h can be hedged statically by the limit of a linear combination of out of the money calls and puts . So that the autocall structure can be considered as a combination of binary options and can be priced based on vanilla option pricing methods. 

# Conclusion
When comparing the surface of prices of LCL AUTOCALL 2019 with that of ACTICCIA VIE, the cost of the autocall formula is lower than that of a call spread structure. When volatilities are low, the prices are more sensitive to interest rate. With a 15% annualized volatility, the curve of interest rate sensibility is almost a line. Prices slightly increase as interest rates going higher and vice versa. Hence, the autocall structure is frequently used in the funds launching after 2014.

Other factors being equal, if we add an extra 2.5% per annum coupon to the snowball structure and pay investors a coupon at each observation date if the underlying level is above the down-and-in put barrier. Though price of this product is slightly higher, investors will be rewarded at each observation date and it is advantageous in a marketing perspective. 

To specify why the unprotected structure is cheaper than the guaranteed ones, we run a back test on historical data back to 1999.  Even though the average annual performances of autocall structure are the same as the guaranteed formula, the standard deviations are bigger and there are more extremely negative values.


# EGARCH

My MATLAB codes for E-GARCH Value-Weighted Portfolios estimation. The example is based on monthly stock return data from CRSP from July 1926 to December 2014. Industry portfolio returns (12 industry classifications from the SIC codes) are obtained by weighting the stocks returns (by market capitalization) at the end of the last trading day of the month.

To estimate the EGARCH(p,q) model I first do de-meaning process to get residuals to work with. Then standard EGARCH procedure is implemented. I decide to pick up industries #4 (Energy) and #8 (Utilities) to make a comparison. The two models for Energy firms and Utility firms produce quite similar parameters, with a much higher impact for shocks in volatility rather than for the previous period realized shock, and lower persistent volatility for Utilities as compared to Energy firms. To choose the best model methods such as out-of-sample, cross-validation, and penalized scores could be used. I chose the second approach and use the AIC penalization to measure the goodness-of-fit.

Files "estim_egarch" and "likelihood_egarch" contain MATLAB function to estimate E-GARCH models, while an example of its application is available in file "example". You can see the result of forecasted volatilities for two industries on the attached figure.

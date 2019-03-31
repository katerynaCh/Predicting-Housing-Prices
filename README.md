# Predicting-Housing-Prices
https://www.kaggle.com/c/house-prices-advanced-regression-techniques/leaderboard
<h3>Problem</h3>

>Ask a home buyer to describe their dream house, and they probably won't begin with the height of the basement ceiling or the proximity to an east-west railroad. But this playground competition's dataset proves that much more influences price negotiations than the number of bedrooms or a white-picket fence.

>With 79 explanatory variables describing (almost) every aspect of residential homes in Ames, Iowa, this competition challenges you to predict the final price of each home.

>Submissions are evaluated on Root-Mean-Squared-Error (RMSE) between the logarithm of the predicted value and the logarithm of the observed sales price. (Taking logs means that errors in predicting expensive houses and cheap houses will affect the result equally.)

<h3>File descriptions:</h4>

train.csv - the training set
<br>test.csv - the test set
<br>data_description.txt - full description of each column, originally prepared by Dean De Cock but lightly edited to match the column names used here
<br>sample_submission.csv - a benchmark submission from a linear regression on year and month of sale, lot square footage, and number of bedrooms
<br>prediction.ipynb - final notebook with my solution
<h3>My approach:</h3>

<br>1. Remove features irrelevant from the first sight, or the ones having a lot of similar/missing values
<br>2. Generate new features:
- Remodelled
- YearSinceRemodelled
- Age
- HowFastSold
- Has2ndFloor
- Season
- GoodNeighborhood
- TotArea
- HasFirePlace
- HasWoodDeck
- GoodSubClass
- NoGarage
- NoBasement
- Features identifying 'Good QUality' of some facility
- Features identifying poor quality of some facility
- linear transfomations of the highly-correlated features

<br>3. Missing data imputation is handled meaningfully, each feature is treated separately (check notebook)
<br>4. Transform numeric to categoric and sometimes vice versa
<br>5. Analyze features for correlations and remove unrelevant again
<br>6. Find outliers statistically and remove them
<br>7. More feature engineering
<br>8. Unskewing data
<br>9. Models: catboost worked the best. 

What I tried that didn't work:
- models: Lasso, Ridge, KernelRidge, ElasticNet, Random Forest, LightGBM, stacking, xgboost (actually it has a small role in ensembling)
- some other new features

Best result was achieved by a 'hardcore' linear combination of the best models. Initially, a huge boost in my score was achieved after taking a mean of catboost model built with one set of features and the one with another set. Then I tried xgboosting and averaging multiple models, including ones built on different feature sets. It gave a result slightly worse than my best one, but it was still good, so I added the final xgboost ensemble to the mix. I then experimented a bit more and ended up with a score of 0.11473 - this is the mean of 7 models (not the 7 best actually, but the ones I intuitively thought would complement each other), some of which were 2nd level models. 
This score placed me in top 6% on the leaderboard.

P.S. All xgboost-related stuff is in an R file, as I cannot manage to install it on my Windows machine, and I r e a l l y tried.



require(xgboost)


MyData <- read.csv(file="C:\\Users\\Kateryna\\Desktop\\kaggle\\Housing\\all_data.csv", header=TRUE, sep=",", stringsAsFactors = FALSE)
data_train <- read.csv(file='C:\\Users\\Kateryna\\Desktop\\kaggle\\Housing\\train2.csv', 
                       header = TRUE)

train = MyData[1:nrow(data_train),]
test = MyData[nrow(data_train):nrow(MyData),]
y=data_train["SalePrice"]

train <- train[,-c(1)]
test <- test[,-c(1)]


params <- list(objective='reg:linear', eta=0.05, max_depth = 4,  
                subsample=0.5, colsample_bytree = 0.8, gamma = 5,seed=2323232,
                eval_metric='rmse')

xgbcv <- xgb.cv( params = params, data = data.matrix(train), 
                 label=data.matrix(y), 
                 nrounds=1000,
                 nfold=5,
                 early_stopping_rounds = 30, 
                 maximize = F)

xgb10 <- xgboost(data = data.matrix(train), 
                 label = data.matrix(y), 
                 nround=192, 
                 params = params
)
xgb11 <- xgboost(data = data.matrix(train), 
                 label = data.matrix(y), 
                 nround=668, 
                 params = params
)
xgb12 <- xgboost(data = data.matrix(train), 
                 label = data.matrix(y), 
                 nround=378, 
                 params = params
)
xgb13 <- xgboost(data = data.matrix(train), 
                 label = data.matrix(y), 
                 nround=365, 
                 params = params
)

xgb14 <- xgboost(data = data.matrix(train), 
                 label = data.matrix(y), 
                 nround=443, 
                 params = params
)
xgb15 <- xgboost(data = data.matrix(train), 
                 label = data.matrix(y), 
                 nround=480, 
                 params = params
)
xgb16 <- xgboost(data = data.matrix(train), 
                 label = data.matrix(y), 
                 nround=270, 
                 params = params
)
xgb17 <- xgboost(data = data.matrix(train), 
                 label = data.matrix(y), 
                 nround=273, 
                 params = params
)
xgb18 <- xgboost(data = data.matrix(train), 
                 label = data.matrix(y), 
                 nround=359, 
                 params = params
)
xgb19 <- xgboost(data = data.matrix(train), 
                 label = data.matrix(y), 
                 nround=715, 
                 params = params
)
xgb20 <- xgboost(data = data.matrix(train), 
                 label = data.matrix(y), 
                 nround=203, 
                 params = params
)
xgb21 <- xgboost(data = data.matrix(train), 
                 label = data.matrix(y), 
                 nround=441, 
                 params = params
)

y_pred11 <- predict(xgb11, data.matrix(test))
y_pred12 <- predict(xgb12, data.matrix(test))
y_pred23 <- predict(xgb13, data.matrix(test))
y_pred24 <- predict(xgb14, data.matrix(test))

y_pred15 <- predict(xgb15, data.matrix(test))
y_pred16 <- predict(xgb16, data.matrix(test))
y_pred17 <- predict(xgb17, data.matrix(test))
y_pred10 <- predict(xgb10, data.matrix(test))

y_pred18 <- predict(xgb18, data.matrix(test))
y_pred19 <- predict(xgb19, data.matrix(test))
y_pred20 <- predict(xgb20, data.matrix(test))
y_pred21 <- predict(xgb21, data.matrix(test))

y_pred <- (y_pred18 + y_pred19 + y_pred20 + y_pred21 + y_pred17 + y_pred16 + y_pred15 + y_pred24 + y_pred23 + y_pred12 + y_pred11 + y_pred10)/12
write.table(y_pred11, file = "C:\\Users\\Kateryna\\Desktop\\kaggle\\Housing\\xgboost5.csv", col.names = FALSE, sep=',')



df <- read.table("./input_data", fill = TRUE, 
                  header = FALSE)    

newdata <- na.omit(df)

newdata$V1<- NULL
newdata$V2<- NULL
newdata$V3<- NULL
newdata$V4<- NULL
newdata$V5<- NULL


fit<-kmeans(newdata,2)
str(fit)


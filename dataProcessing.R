setwd('~/git/dv5_performance_benchmark')
timing<-read.table('results.txt', header=F)

## Eight x 3.7GHz Intel(R) Core(TM) i7-4770 CPU @ 3.40GHz Processors, 31.9GB RAM, 54283 Bogomips Total

# Experiment Size
dataSize = c(1000, 2000, 4000, 8000, 16000, 32000, 64000)
dataSizePlot = c(1000,4000,8000,16000, 32000,64000)

# Datasets
algo1_set1<-timing[1:7,2]
algo1_set2<-timing[8:14,2]
algo1_set3<-timing[15:21,2]
algo2_set1<-timing[22:28,2]
algo2_set2<-timing[29:35,2]
algo2_set3<-timing[36:42,2]
benchmark <- data.frame(algo1_set1 = algo1_set1, 
                        algo1_set2=algo1_set2, 
                        algo1_set3=algo1_set3, 
                        algo2_set1=algo2_set1, 
                        algo2_set2=algo2_set2, 
                        algo2_set3=algo2_set3)

row.names(benchmark)<-dataSize 

plot(dataSize,
     benchmark[,1],
     lty=1,
     xaxt="n", 
     type="b", 
     pch=5,
     xlab='Problem Size',
     ylab='time (s), mean 20 rep')
axis(1, at=dataSize, las=2, cex.axis=0.7)
points(dataSize, benchmark[,2], type="b", pch=0, lty=1)
points(dataSize, benchmark[,3], type="b", pch=1, lty=1)
points(dataSize, benchmark[,4], type="b", pch=4, lty=2)
points(dataSize, benchmark[,5], type="b", pch=3, lty=2)
points(dataSize, benchmark[,6], type="b", pch=2, lty=2)

legend(1000,10, c("algo 1 set 1", 
                  "algo 1 set 2", 
                  "algo 1 set 3", 
                  "algo 2 set 1", 
                  "algo 2 set 2", 
                  "algo 2 set 3"),
       pch=c(5,0,1,4,3,2))

#####################################################################################
# Linear Regression Algo 1 Dataset 1
########
plot(dataSize, 
     benchmark[,1],
     #main="Raw Data Algo 1 Dataset 1",
     xaxt="n", 
     type="b", 
     col='black',
     xlab='Problem Size',
     ylab='time (s)')
axis(1, at=dataSizePlot, las=2, cex.axis=0.7)

### Transforming
plot(dataSize,
     sqrt(benchmark[,1]),
          lty=2,
          #main="Sqrt Transformed Data Algo 1 Dataset 1",
          xaxt="n", 
          type="p", 
          col='black',
          xlab='Problem Size',
          ylab='time (sqrt(s))')
     axis(1, at=dataSizePlot, las=2, cex.axis=0.7)

### Regression
regAnal <- lm(sqrt(benchmark[,1])~dataSize)
summary(regAnal)
cor(sqrt(benchmark[,1]),dataSize)
abline(regAnal, lty=4, col='blue')

#####################################################################################
# Linear Regression Algo 1 Dataset 2
########
plot(dataSize, 
     benchmark[,2],
     #main="Raw Data Algo 1 Dataset 2",
     xaxt="n", 
     type="b", 
     col='black',
     xlab='Problem Size',
     ylab='time (s)')
axis(1, at=dataSizePlot, las=2, cex.axis=0.7)

### Regression
regAnal <- lm(benchmark[,2]~dataSize)
summary(regAnal)
cor(benchmark[,2],dataSize)
abline(regAnal, lty=4, col='blue')

#####################################################################################
# Linear Regression Algo 1 Dataset 3
########
plot(dataSize, 
     benchmark[,3],
     main="Raw Data Algo 1 Dataset 3",
     xaxt="n", 
     type="b", 
     col='black',
     xlab='Problem Size',
     ylab='time (s)')
axis(1, at=dataSize, las=2, cex.axis=0.7)

### Transforming
plot(dataSize,
     sqrt(benchmark[,3]),
     lty=2,
     main="Sqrt Transformed Data Algo 1 Dataset 3",
     xaxt="n", 
     type="p", 
     col='black',
     xlab='Problem Size',
     ylab='time (sqrt(s))')
axis(1, at=dataSize, las=2, cex.axis=0.7)

### Regression
regAnal <- lm(sqrt(benchmark[,3])~dataSize)
summary(regAnal)
cor(sqrt(benchmark[,3]),dataSize)
abline(regAnal, lty=4, col='blue')

#####################################################################################
# Linear Regression Algo 2 Dataset 1
########
plot(dataSize, 
     benchmark[,4],
     main="Raw Data Algo 2 Dataset 1",
     xaxt="n", 
     type="b", 
     col='black',
     xlab='Problem Size',
     ylab='time (s)')
axis(1, at=dataSize, las=2, cex.axis=0.7)

### Transforming
plot(dataSize,
     sqrt(benchmark[,4]),
     lty=2,
     main="Sqrt Transformed Data Algo 2 Dataset 1",
     xaxt="n", 
     type="p", 
     col='black',
     xlab='Problem Size',
     ylab='time (sqrt(s))')
axis(1, at=dataSize, las=2, cex.axis=0.7)

### Regression
regAnal <- lm(sqrt(benchmark[,4])~dataSize)
summary(regAnal)
cor(sqrt(benchmark[,4]),dataSize)
abline(regAnal, lty=4, col='blue')


#####################################################################################
# Linear Regression Algo 2 Dataset 2
########
plot(dataSize, 
     benchmark[,5],
     main="Raw Data Algo 2 Dataset 2",
     xaxt="n", 
     type="b", 
     col='black',
     xlab='Problem Size',
     ylab='time (s)')
axis(1, at=dataSize, las=2, cex.axis=0.7)

### Transforming
plot(dataSize,
     sqrt(benchmark[,5]),
     lty=2,
     main="Sqrt Transformed Data Algo 2 Dataset 2",
     xaxt="n", 
     type="p", 
     col='black',
     xlab='Problem Size',
     ylab='time (sqrt(s))')
axis(1, at=dataSize, las=2, cex.axis=0.7)

### Regression
regAnal <- lm(sqrt(benchmark[,5])~dataSize)
summary(regAnal)
cor(sqrt(benchmark[,5]),dataSize)
abline(regAnal, lty=4, col='blue')


#####################################################################################
# Linear Regression Algo 2 Dataset 3
########
plot(dataSize, 
     benchmark[,6],
     main="Raw Data Algo 2 Dataset 3",
     xaxt="n", 
     type="b", 
     col='black',
     xlab='Problem Size',
     ylab='time (s)')
axis(1, at=dataSize, las=2, cex.axis=0.7)

### Transforming
plot(dataSize,
     sqrt(benchmark[,6]),
     lty=2,
     main="Sqrt Transformed Data Algo 2 Dataset 3",
     xaxt="n", 
     type="p", 
     col='black',
     xlab='Problem Size',
     ylab='time (sqrt(s))')
axis(1, at=dataSize, las=2, cex.axis=0.7)

### Regression
regAnal <- lm(sqrt(benchmark[,6])~dataSize)
summary(regAnal)
cor(sqrt(benchmark[,6]),dataSize)
abline(regAnal, lty=4, col='blue')



setwd('~/git/dv5_performance_benchmark')
timing<-read.table('results.txt', header=F)



# Experiment Size
dataSize = c(1000, 2000, 4000, 8000, 16000, 32000, 64000)

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
     xaxt="n", 
     type="b", 
     col='black',
     xlab='Problem Size',
     ylab='time (s)')
axis(1, at=dataSize, las=2, cex.axis=0.7)
points(dataSize, benchmark[,2], type="b", col="red")
points(dataSize, benchmark[,3], type="b", col="green")
points(dataSize, benchmark[,4], type="b", col="blue")
points(dataSize, benchmark[,5], type="b", col="brown")
points(dataSize, benchmark[,6], type="b", col="cyan")

legend(1000,10, c("algo 1 set 1", 
                  "algo 1 set 2", 
                  "algo 1 set 3", 
                  "algo 2 set 1", 
                  "algo 2 set 2", 
                  "algo 2 set 3"),
       fill=c('black', 'red', 'green', 'blue', 'brown', 'cyan'))



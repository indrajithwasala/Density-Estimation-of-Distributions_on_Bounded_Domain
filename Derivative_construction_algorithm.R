# R function to implement derivative construction algorithm.

DS<-read.csv(file.choose(),header = T) # Importing the dataset and save it as DS
derivative<-function(data){
A<- data.frame(data)
A<- apply(A,2,sort,decreasing=F) # Column sorting according to ascending order
n=length(A[,1]) # Number of rows
m=length(A[1,]) # Number of columns
dt<-matrix(0,ncol = m, nrow=n)
dt<-data.frame(dt) # Construction of data frame for derivatives
# Derivative estimation using 7 points
for (i in 4:(n-3)){
f7<- (-3*A[i-3,] -2*A[i-2,]-A[i-1,]+A[i+1,]+2*A[i+2,]+3*A[i+3,])
dt[i,]=(28/n)/f7
}
  
# Derivative estimation at boundaries
# Construction of dt[3,] and dt[n-2,] using 5 points
# Construction of dt[3,]
f5=-2*A[1,]-A[2,]+A[4,]+2*A[5,]
con<-(f5==0)
c_f5<-sum(con)
if(c_f5==0){
dt[3,]=(10/n)/f5 # 5 points derivative estimation
}else{
dt[3,]=(10/n)/f5
dt[3,con]=dt[4,con] # Constant approximation
}
  
# Construction of dt[n-2,]
f5=-2*A[n-4,]-A[n-3,]+A[n-1,]+2*A[n,]
con<-(f5==0)
c_f5<-sum(con)
if(c_f5==0){
dt[n-2,]=(10/n)/f5 # 5 points derivative estimation
}else{
dt[n-2,]=(10/n)/f5
dt[n-2,con]=dt[n-3,con] # Constant approximation
}
  
# Construction of dt[2,] and dt[n-1,] using 3 points
# Construction of dt[2,]
f3=A[3,]-A[1,]
con<-(f3==0)
c_f3<-sum(con)
if(c_f3==0){
dt[2,]=(2/n)/f3 # 3 points derivative estimation
}else{
dt[2,]=(2/n)/f3
dt[2,con]=dt[3,con] # Constant approximation
}
  
# Construction of dt[n-1,]
f3=A[n,]-A[n-2,]
con<-(f3==0)
c_f3<-sum(con)
if(c_f3==0){
dt[n-1,]=(2/n)/f3 # 3 points derivative estimation
}else{
dt[2,]=(2/n)/f3
dt[n-1,con]=dt[n-2,con] # Constant approximation
}
  
# Construction of dt[1,] and dt[n,] using forward difference approximation
# Construction of dt[1,]
f1=(A[2,]-A[1,])
con<-(f1==0)
c_f1<-sum(con)
if(c_f3==0){
dt[1,]=(1/n)/f1 # 2 points derivative estimation
}else{
dt[1,]=(1/n)/f1
dt[1,con]=dt[2,con] # Constant approximation
}
  
# Construction of dt[n,]
f1=(A[n,]-A[n-1,])
con<-(f1==0)
c_f1<-sum(con)
if(c_f3==0){
dt[n,]=(1/n)/f1 # 2 points derivative estimation
}else{
dt[n,]=(1/n)/f1
dt[n,con]=dt[n-1,con] # Constant approximation
}
return(list(derivatives=dt,Sorted_data=A))
}
derivatives<- derivative(DS)$derivatives # Running the function

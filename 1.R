data1=as.matrix(data);
data2=data1[,2];
rst=kmeans(data2,centers = 5,nstart = 2);
data3=cbind(data1,rst$cluster);
result=NULL;
for(i in 1:length(rst$size))
{
  a=i;
  b=sum(as.numeric(data3[which(data3[,3]==i),2]));
  c=min(as.numeric(data3[which(data3[,3]==i),2]));
  d=max(as.numeric(data3[which(data3[,3]==i),2]));
  e=b/rst$size[i];
  result=rbind(result,c(a,b,c,d,e));
}
result=cbind(result,rst$size);


write.csv(result,"C:\\workspace\\kmeans5.csv")


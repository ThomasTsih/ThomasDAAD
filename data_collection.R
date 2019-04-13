#Data Collection and Analysis Script

## ---- Installing Google Trends package
install.packages("gtrendsR")

## ----- Using Library
library("gtrendsR")

## ----- Finding Terms of Interest
trends<-gtrends(keyword =c("anxiety","depression"), geo=("GR"),time=("2018-01-01 2018-12-31"))

## ----- Showing Data
trends

## ---- Getting and showing only interest over time
interest_over_time<-trends$interest_over_time
interest_over_time

## ---- Saving Data
write.csv(interest_over_time,file="interest_over_time")

## ---- Analysing Data
group_a<-interest_over_time$keyword
group_b<-interest_over_time$hits

## ---- Framing Data 
df_wide<-data.frame(group_a,group_b)
anxiety_name<-group_a[1:52]
anxiety_hits<-group_b[1:52]
Anxiety<-cbind(anxiety_name,anxiety_hits)
depression_name<-group_a[53:104]
depression_hits<-group_b[53:104]
Depression<-cbind(depression_name,depression_hits)

## ---- Pearson, structures, names.
cor.test(anxiety_hits,depression_hits)
result <- cor.test(anxiety_hits,depression_hits)
str(result)
names(result)


# ---- Visualising Data
plot(anxiety_hits~depression_hits,col=30,main = "Correlation between searches on Anxiety and Depression", cex=1.5, cex.main=1, font.main=4, font.lab=2, font.axis=3, xlab="Anxiety", ylab="Depression", pch=20)


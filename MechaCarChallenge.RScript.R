library(dplyr)

#Import and read csv file
mechacar <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)
#generate multiple linear regression
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mechacar) 
#generate summary
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mechacar)) 

#Import and read csv file
suspension<- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)
#Create total summary table
total_summary <- suspension %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep')
#Create lot summary table 
lot_summary <- suspension %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep')

#T.test for all manufacturing lot 
t.test(suspension$PSI, mu=1500)
#T.Test for each lot 
t.test(subset(suspension$PSI,suspension$Manufacturing_Lot=="Lot1"), mu=1500)
t.test(subset(suspension$PSI,suspension$Manufacturing_Lot=="Lot2"), mu=1500)
t.test(subset(suspension$PSI,suspension$Manufacturing_Lot=="Lot3"), mu=1500)
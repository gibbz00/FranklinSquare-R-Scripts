df2$DurationLastLevel<- as.numeric(df2$DurationLastLevel)
df2[, TotalDaysUntilRecent := cumsum(DurationLastLevel), by = ContactID]

write.csv(df2, "C:/Users/ssizan/Documents/SQL_CSV/FullLifeCycle.csv",row.names = FALSE)

df2[ , BecomesProducer:=ifelse(any(EngagementLevel1=="New Producer") , "TRUE", "FALSE")
 , by = ContactID]

df2[ , FollowsCLC:=ifelse(any(grepl("Level0-->Level1-->Level2-->Level3-->Level4-->Level5",FullLevelCycle)) , "TRUE", "FALSE")
     , by = ContactID]


grepl("Level0-->Level1-->Level2-->Level3-->Level4-->Level5",df2$FullLevelCycle)

#adding random comment to see change in git

#adding more random comments
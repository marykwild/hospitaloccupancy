library(readr)
library(dplyr)

setwd("C:/Users/mkwil/Desktop/MCRs")

#mainly need the nmrc file, which must be loaded separately. 
eighteen <- read_csv("HOSP10FY2018/hosp10_2018_NMRC.CSV", col_names = FALSE)
names(eighteen)[1] <- "RPT_no"

seventeen <- read_csv("HOSP10FY2017/hosp10_2017_NMRC.CSV", col_names = FALSE)
names(seventeen)[1] <- "RPT_no"

sixteen <- read_csv("HOSP10FY2016/hosp10_2016_NMRC.CSV", col_names = FALSE)
names(sixteen)[1] <- "RPT_no"

fifteen <- read_csv("HOSP10FY2015/hosp10_2015_NMRC.CSV", col_names = FALSE)
names(fifteen)[1] <- "RPT_no"

fourteen <- read_csv("HOSP10FY2014/hosp10_2014_NMRC.CSV", col_names = FALSE)
names(fourteen)[1] <- "RPT_no"

thirteen <- read_csv("HOSP10FY2013/hosp10_2013_NMRC.CSV", col_names = FALSE)
names(thirteen)[1] <- "RPT_no"

twelve <- read_csv("HOSP10FY2012/hosp10_2012_NMRC.CSV", col_names = FALSE)
names(twelve)[1] <- "RPT_no"

eleven <- read_csv("HOSP10FY2011/hosp10_2011_NMRC.CSV", col_names = FALSE)
names(eleven)[1] <- "RPT_no"

ten <- read_csv("HOSP10FY2010/hosp10_2010_NMRC.CSV", col_names = FALSE)
names(ten)[1] <- "RPT_no"

memory.limit(size=1800)

#You need to use the rpt file to look up the report number, corresponding to provider number.
#All SC hospitals' provider numbers start with 42

RPT18 <- read_csv("HOSP10FY2018/hosp10_2018_RPT.CSV", col_names = FALSE)[ ,c(1,3)]
names(RPT18) <- c("RPT_no","Provider_no")
SCRPT18 <- filter(RPT18, grepl('^42', Provider_no))

RPT17 <- read_csv("HOSP10FY2017/hosp10_2017_RPT.CSV", col_names = FALSE)[ ,c(1,3)]
names(RPT17) <- c("RPT_no","Provider_no")
SCRPT17 <- filter(RPT17, grepl('^42', Provider_no))

RPT16 <- read_csv("HOSP10FY2016/hosp10_2016_RPT.CSV", col_names = FALSE)[ ,c(1,3)]
names(RPT16) <- c("RPT_no","Provider_no")
SCRPT16 <- filter(RPT16, grepl('^42', Provider_no))

RPT15 <- read_csv("HOSP10FY2015/hosp10_2015_RPT.CSV", col_names = FALSE)[ ,c(1,3)]
names(RPT15) <- c("RPT_no","Provider_no")
SCRPT15 <- filter(RPT15, grepl('^42', Provider_no))

RPT14 <- read_csv("HOSP10FY2014/hosp10_2014_RPT.CSV", col_names = FALSE)[ ,c(1,3)]
names(RPT14) <- c("RPT_no","Provider_no")
SCRPT14 <- filter(RPT14, grepl('^42', Provider_no))

RPT13 <- read_csv("HOSP10FY2013/hosp10_2013_RPT.CSV", col_names = FALSE)[ ,c(1,3)]
names(RPT13) <- c("RPT_no","Provider_no")
SCRPT13 <- filter(RPT13, grepl('^42', Provider_no))

RPT12 <- read_csv("HOSP10FY2012/hosp10_2012_RPT.CSV", col_names = FALSE)[ ,c(1,3)]
names(RPT12) <- c("RPT_no","Provider_no")
SCRPT12 <- filter(RPT12, grepl('^42', Provider_no))

RPT11 <- read_csv("HOSP10FY2011/hosp10_2011_RPT.CSV", col_names = FALSE)[ ,c(1,3)]
names(RPT11) <- c("RPT_no","Provider_no")
SCRPT11 <- filter(RPT11, grepl('^42', Provider_no))

RPT10 <- read_csv("HOSP10FY2010/hosp10_2010_RPT.CSV", col_names = FALSE)[ ,c(1,3)]
names(RPT10) <- c("RPT_no","Provider_no")
SCRPT10 <- filter(RPT10, grepl('^42', Provider_no))

#Shouldn't need these variables anymore
rm(RPT10,RPT11,RPT12,RPT13,RPT14,RPT15,RPT16,RPT17,RPT18)

SCeighteen <- left_join(SCRPT18, eighteen, by = "RPT_no")
SCseventeen <- left_join(SCRPT17, seventeen, by = "RPT_no")
SCsixteen <- left_join(SCRPT16, sixteen, by = "RPT_no")
SCfifteen <- left_join(SCRPT15, fifteen, by = "RPT_no")
SCfourteen <- left_join(SCRPT14, fourteen, by = "RPT_no")
SCthirteen <- left_join(SCRPT13, thirteen, by = "RPT_no")
SCtwelve <- left_join(SCRPT12, twelve, by = "RPT_no")
SCeleven <- left_join(SCRPT11, eleven, by = "RPT_no")
SCten <- left_join(SCRPT10, ten, by = "RPT_no")

#After Join don't need these either
rm(SCRPT10,SCRPT11,SCRPT12,SCRPT13,SCRPT14,SCRPT15,SCRPT16,SCRPT17,SCRPT18)

#OCCUPANCY RATE
#bed days available (denominator, filtering on SC hospitals)
beddaysavail18 <- filter(SCeighteen,X2=="S300001", X3=="01400", X4=="00300")
beddaysavail18['Year'] <- 2018
beddaysavail18 <- beddaysavail18[ ,c(1,2,6,7)]
names(beddaysavail18)[3] <- 'Bed_days_avail'

beddaysavail17 <- filter(SCseventeen,X2=="S300001", X3=="01400", X4=="00300")
beddaysavail17['Year'] <- 2017
beddaysavail17 <- beddaysavail17[ ,c(1,2,6,7)]
names(beddaysavail17)[3] <- 'Bed_days_avail'

beddaysavail16 <- filter(SCsixteen,X2=="S300001", X3=="01400", X4=="00300")
beddaysavail16['Year'] <- 2016
beddaysavail16 <- beddaysavail16[ ,c(1,2,6,7)]
names(beddaysavail16)[3] <- 'Bed_days_avail'

beddaysavail15 <- filter(SCfifteen,X2=="S300001", X3=="01400", X4=="00300")
beddaysavail15['Year'] <- 2015
beddaysavail15 <- beddaysavail15[ ,c(1,2,6,7)]
names(beddaysavail15)[3] <- 'Bed_days_avail'

beddaysavail14 <- filter(SCfourteen,X2=="S300001", X3=="01400", X4=="00300")
beddaysavail14['Year'] <- 2014
beddaysavail14 <- beddaysavail14[ ,c(1,2,6,7)]
names(beddaysavail14)[3] <- 'Bed_days_avail'

beddaysavail13 <- filter(SCthirteen,X2=="S300001", X3=="01400", X4=="00300")
beddaysavail13['Year'] <- 2013
beddaysavail13 <- beddaysavail13[ ,c(1,2,6,7)]
names(beddaysavail13)[3] <- 'Bed_days_avail'

beddaysavail12 <- filter(SCtwelve,X2=="S300001", X3=="01400", X4=="00300")
beddaysavail12['Year'] <- 2012
beddaysavail12 <- beddaysavail12[ ,c(1,2,6,7)]
names(beddaysavail12)[3] <- 'Bed_days_avail'

beddaysavail11 <- filter(SCeleven,X2=="S300001", X3=="01400", X4=="00300")
beddaysavail11['Year'] <- 2011
beddaysavail11 <- beddaysavail11[ ,c(1,2,6,7)]
names(beddaysavail11)[3] <- 'Bed_days_avail'

  #Note low number of observations
beddaysavail10 <- filter(SCten,X2=="S300001", X3=="01400", X4=="00300")
beddaysavail10['Year'] <- 2010
beddaysavail10 <- beddaysavail10[ ,c(1,2,6,7)]
names(beddaysavail10)[3] <- 'Bed_days_avail'
  
SCbeddays <- rbind(beddaysavail11,beddaysavail12,beddaysavail13,beddaysavail14,beddaysavail15,beddaysavail16,beddaysavail17,beddaysavail18)
#Can remove the yearly variables now
rm(beddaysavail10,beddaysavail11,beddaysavail12,beddaysavail13,beddaysavail14,beddaysavail15,beddaysavail16,beddaysavail17,beddaysavail18)

#hospital days (numerator, filtering on SC hospitals)
days18 <- filter(SCeighteen,X2=="S300001", X3=="01400", X4=="00800")
days18['Year'] <- 2018
days18 <- days18[ ,c(1,2,6,7)]
names(days18)[3] <- 'Hospital_days'

days17 <- filter(SCseventeen,X2=="S300001", X3=="01400", X4=="00800")
days17['Year'] <- 2017
days17 <- days17[ ,c(1,2,6,7)]
names(days17)[3] <- 'Hospital_days'

days16 <- filter(SCsixteen,X2=="S300001", X3=="01400", X4=="00800")
days16['Year'] <- 2016
days16 <- days16[ ,c(1,2,6,7)]
names(days16)[3] <- 'Hospital_days'

days15 <- filter(SCfifteen,X2=="S300001", X3=="01400", X4=="00800")
days15['Year'] <- 2015
days15 <- days15[ ,c(1,2,6,7)]
names(days15)[3] <- 'Hospital_days'

days14 <- filter(SCfourteen,X2=="S300001", X3=="01400", X4=="00800")
days14['Year'] <- 2014
days14 <- days14[ ,c(1,2,6,7)]
names(days14)[3] <- 'Hospital_days'

days13 <- filter(SCthirteen,X2=="S300001", X3=="01400", X4=="00800")
days13['Year'] <- 2013
days13 <- days13[ ,c(1,2,6,7)]
names(days13)[3] <- 'Hospital_days'

days12 <- filter(SCtwelve,X2=="S300001", X3=="01400", X4=="00800")
days12['Year'] <- 2012
days12 <- days12[ ,c(1,2,6,7)]
names(days12)[3] <- 'Hospital_days'

days11 <- filter(SCeleven,X2=="S300001", X3=="01400", X4=="00800")
days11['Year'] <- 2011
days11 <- days11[ ,c(1,2,6,7)]
names(days11)[3] <- 'Hospital_days'

days10 <- filter(SCten,X2=="S300001", X3=="01400", X4=="00800")
days10['Year'] <- 2010
days10 <- days10[ ,c(1,2,6,7)]
names(days10)[3] <- 'Hospital_days'

SCdays <- rbind(days11,days12,days13,days14,days15,days16,days17,days18)  
rm(days10,days11,days12,days13,days14,days15,days16,days17,days18)

#MERGING
SCbeddays['unique_id'] <- paste0(SCbeddays$RPT_no, SCbeddays$Year)

SCdays['unique_id'] <- paste0(SCdays$RPT_no, SCdays$Year)

SCoccupancy <- full_join(SCbeddays,SCdays,by="unique_id")
SCoccupancy <- SCoccupancy[,c(1,2,3,4,8)]
names(SCoccupancy) <- c("RPT_no","Provider_no","Bed_days_avail","Year","Hospital_days")

#Calculating the actual occupancy rate
SCoccupancy$Occupancy_rate <- SCoccupancy$Hospital_days / SCoccupancy$Bed_days_avail
write.csv(SCoccupancy,"SChospitaloccupancy.csv")


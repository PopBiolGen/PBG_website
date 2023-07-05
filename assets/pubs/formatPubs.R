library(lubridate)
library(tidyverse)


# from Zotero
ztPubs<-read.table(file="data/labPubs.txt", sep = "\t", quote="", header=TRUE, stringsAsFactors = FALSE, )
# fix yyyy-mm formats
ymSub <- grepl("-", ztPubs$Date)
ztPubs$Date[ymSub] <- paste0(ztPubs$Date[ymSub], "-01")
ztPubs$Date[ymSub] <- year(ymd(ztPubs$Date[ymSub]))
# fix dd-mm-yyy formats
dweirdFormats <- year(dmy(ztPubs$Date))
ztPubs$Date <- as.numeric(ztPubs$Date)
ztPubs$Date <- ifelse(is.na(ztPubs$Date), weirdFormats, ztPubs$Date)


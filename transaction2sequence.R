library(dplyr)
df = read.csv('~/Desktop/IntStockCode.csv')
str(df)
library(gdata)
# levels(df[,3])
# (fac <- factor(levels(df[,3])))
# (map <- mapLevels(x=fac))
# str(map)
x = as.factor(df[,3])
levels(x) <- 1:length(levels(x))
x <- as.integer(x)

df$newStockCode = x
df %>% arrange(StockCode)
write.csv(df,'~/Desktop/testR.csv')
head(df)
df1 = df %>% group_by(CustomerID,InvoiceNo,InvoiceNo) %>% 
  summarise(items = paste(IntCode,collapse = " ")) 
  # %>% 
  # group_by(CustomerID) %>% 
  # mutate(items = paste0("(",items,")"))
  
df2 = df1 %>% group_by(CustomerID) %>% 
  summarise(items1 = paste(items,collapse = " -1 "))
  # %>% 
  # group_by(CustomerID) %>% 
  # mutate(items1 = paste0("(",items1,")"))       
write.csv(df2,'~/Desktop/df2.csv')
          
head(df2)

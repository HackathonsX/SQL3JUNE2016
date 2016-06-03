library(RODBC)
myServer <- "cloudwickunicorns.database.windows.net"
myUser <- "duhit"
myPassword <- "cloudwick@9"
myDatabase <- "firstdatabase"
myDriver <- "SQL Server" # Must correspond to an entry in the Drivers tab of "ODBC Data Sources"

connectionString <- paste0(
  "Driver=", myDriver, 
  ";Server=", myServer, 
  ";Database=", myDatabase, 
  ";Uid=", myUser, 
  ";Pwd=", myPassword)
# This query simulates a table by generating a rowset with one integer column going from 1 to 1000
sqlQuery <- "Select top(10) Name From SalesLT.Product;"

#WITH nb AS (SELECT 0 AS n UNION ALL SELECT n+1 FROM nb where n < 9) SELECT n1.n+10*n2.n+100*n3.n+1 FROM nb n1 CROSS JOIN nb n2 CROSS JOIN nb n3"

conn <- odbcDriverConnect(connectionString)
df <- sqlQuery(conn, sqlQuery)
close(conn) # don't leak connections !

str(df)
## 'data.frame':    1000 obs. of  1 variable:
##  $ : int  1 2 3 4 5 6 7 8 9 10 ...
summary(df)
##                  
##  Min.   :   1.0  
##  1st Qu.: 250.8  
##  Median : 500.5  
##  Mean   : 500.5  
##  3rd Qu.: 750.2  
##  Max.   :1000.0=

library(dplyr)
library(ggplot2)

# We'll start by creating some nonsense data with dates
df <- data.frame(
  date = seq(Sys.Date(), len=100, by="1 day")[sample(100, 50)],
  price = runif(50)
)
df <- df[order(df$date), ]
dt <- qplot(date, price, data=df, geom="line") + theme(aspect.ratio = 1/4)

# We can control the format of the labels, and the frequency of
# the major and minor tickmarks.  See ?format.Date and ?seq.Date
# for more details.
library(scales) # to access breaks/formatting functions
dt + scale_x_date() + ggtitle("Plot 1")
dt + scale_x_date(labels = date_format("%m/%d")) + ggtitle("Plot 2")
dt + scale_x_date(labels = date_format("%W")) + ggtitle("Plot 3")
dt + scale_x_date(labels = date_format("%W"), breaks = date_breaks("week"))+ ggtitle("Plot 4")

dt + scale_x_date(breaks = date_breaks("months"),
                  labels = date_format("%b"))+ ggtitle("Plot 5")
dt + scale_x_date(breaks = date_breaks("4 weeks"),
                  labels = date_format("%d-%b"))+ ggtitle("Plot 6")

# We can use character string for breaks.
# See \\code{\\link{by}} argument in \\code{\\link{seq.Date}}.
dt + scale_x_date(breaks = "2 weeks") + ggtitle("Plot 7")
dt + scale_x_date(breaks = "1 month", minor_breaks = "1 week")+ ggtitle("Plot 8")

# The date scale will attempt to pick sensible defaults for
# major and minor tick marks
qplot(date, price, data=df[1:10,], geom="line")+ ggtitle("Plot 9")
qplot(date, price, data=df[1:4,], geom="line")+ ggtitle("Plot 10")

df <- data.frame(
  date = seq(Sys.Date(), len=1000, by="1 day"),
  price = runif(500)
)
qplot(date, price, data=df, geom="line")
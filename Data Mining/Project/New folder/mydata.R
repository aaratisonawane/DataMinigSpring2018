#install packages
install.packages("ggplot2")
install.packages("forecast")
install.packages("tseries")

#Step 1: Load R Packages
library('ggplot2')
library('forecast')
library('tseries')

Restaurant_1 <- read.csv("C:/Users/Arti/Desktop/Project/Restaurant_1.csv", header=TRUE, stringsAsFactors=FALSE)
daily_data = read.csv("C:/Users/Arti/Desktop/Project/Restaurant_1.csv", header=TRUE, stringsAsFactors=FALSE)

#Step 2: Examine Your Data
daily_data$Date = as.Date(daily_data$Date,"%m/%d/%Y")

ggplot(daily_data, aes(Date, People)) + geom_line() + scale_x_date('month')  + ylab("Daily number of customers") +
  xlab("")

#clean the data
count_ts = ts(daily_data[, c('People')])

daily_data$clean_People = tsclean(count_ts)

ggplot() +
  geom_line(data = daily_data, aes(x = Date, y = clean_People)) + ylab("cleaned data")

#Find out moving average(Used clean cound with no outliers ie. cleaned data/preprocessed data)
daily_data$cnt_ma = ma(daily_data$clean_People, order=7) # using the clean count with no outliers
daily_data$cnt_ma30 = ma(daily_data$clean_People, order=30)

ggplot() +
  geom_line(data = daily_data, aes(x = Date, y = clean_People, colour = "Counts")) +
  geom_line(data = daily_data, aes(x = Date, y = cnt_ma,   colour = "Weekly Moving Average"))  +
  geom_line(data = daily_data, aes(x = Date, y = cnt_ma30, colour = "Monthly Moving Average"))  +
  ylab('People Count')


#Step 3: Decompose Your Data
#Omit null values in cnt_ma
count_ma = ts(na.omit(daily_data$cnt_ma), frequency=30)
decomp = stl(count_ma, s.window="periodic")
deseasonal_cnt <- seasadj(decomp)
plot(decomp)

#Stationary check
adf.test(count_ma, alternative = "stationary")
#adf.test(count_ts, alternative = "stationary")

#Step 5: Autocorrelations and Choosing Model Order
Acf(count_ma, main='')

Pacf(count_ma, main='')

count_d1 = diff(deseasonal_cnt, differences = 1)
plot(count_d1)
adf.test(count_d1, alternative = "stationary")

Acf(count_d1, main='ACF for Differenced Series')
Pacf(count_d1, main='PACF for Differenced Series')

auto.arima(deseasonal_cnt, seasonal=FALSE)
fit<- auto.arima(deseasonal_cnt, seasonal=FALSE)
tsdisplay(residuals(fit), lag.max=45, main='(1,1,1) Model Residuals')


fit2 = arima(deseasonal_cnt, order=c(1,1,7))

fit2

tsdisplay(residuals(fit2), lag.max=15, main='Seasonal Model Residuals')

fcast <- forecast(fit2, h=2)
#plot(fcast)
print(fcast)
plot(fcast, showgap = FALSE,type = "o", ylab = "Number of Customers", xlab = "Months")


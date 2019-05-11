library(tidyverse)

dat <- read_csv("./data/example.csv")

runs <- 1000

year <- rate_r <- rate_f <- rep(NA, 10)
frate_r <- frate_f <- rep(NA, 10)



for(i in 1:runs){

	year[1] <- dat[1, 2] %>% as.double()	
	rate_r[1] <- dat[2, 2] %>% as.double()
	rate_f[1] <- dat[3, 2] %>% as.double()
	
	for(j in 2:year){
		rate_r[j] <- runif(1, 0.98, 1.02) * rate_r[j-1]
		rate_f[j] <- runif(1, 0.99, 1.01) * rate_f[j-1]	
	}

	frate_r[i] <- rate_r[length(rate_r)]
	frate_f[i] <- rate_f[length(rate_f)]
}

result <- data.frame(frate_r, frate_f)
hist(result$frate_r)
result

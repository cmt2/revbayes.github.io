library(RevGadgets)
library(ape)
library(ggplot2)
library(dplyr)
library(deeptime)

# the CO2 values as a reference in our plot
co2 <- c(297.6, 301.36, 304.84, 307.86, 310.36, 312.53, 314.48, 316.31, 317.42, 317.63, 317.74, 318.51, 318.29, 316.5, 315.49, 317.64, 318.61, 316.6, 317.77, 328.27, 351.12, 381.87, 415.47, 446.86, 478.31, 513.77, 550.74, 586.68, 631.48, 684.13, 725.83, 757.81, 789.39, 813.79, 824.25, 812.6, 784.79, 755.25, 738.41, 727.53, 710.48, 693.55, 683.04, 683.99, 690.93, 694.44, 701.62, 718.05, 731.95, 731.56, 717.76)

MAX_VAR_AGE = 50
NUM_INTERVALS = length(co2)
co2_age <- MAX_VAR_AGE * (1:NUM_INTERVALS) / NUM_INTERVALS

## Replicate and row-bind each co2 dataframe for every rate variable
co2df <- bind_rows(lapply(factor(c("speciation rate", "extinction rate", "net-diversification rate", "relative-extinction rate")), 
                          function(item) data.frame("time" = co2_age, "co2" = co2, "item" = item)))

primates_corr <- processDivRates(speciation_time_log = "output/primates_EBD_Corr_speciation_times_run_1.log",
                                 speciation_rate_log = "output/primates_EBD_Corr_speciation_rates_run_1.log",
                                 extinction_time_log = "output/primates_EBD_Corr_extinction_times_run_1.log",
                                 extinction_rate_log = "output/primates_EBD_Corr_extinction_rates_run_1.log",
                                 burnin=0.25)


# Create the simplest plot
p1 <- plotDivRates(primates_corr)

# Add co2 data and secondary y-axis
k <- 1000 # scaling factor between the two y-axes
p2 <- p1 + geom_point(data = co2df,
               aes(x = time, y = co2/k)) +
  scale_y_continuous("", sec.axis = sec_axis(~ . * k, name = "co2 (PPM)")) +
  theme(axis.title.y = ggplot2::element_text()) 

# Add geologic time scale
p3 <- p2 + coord_geo(dat = list("epochs", "periods"),
	   	     height = list(unit(2.5, "lines"), unit(1.5, "line")),
	   	     pos = as.list(rep("bottom", 2)),
	   	     rot = list(90, 0), size = list(2.5, 4.5), 
		     abbrv = FALSE)

ggsave("figures/EBD_Corr.png", plot = p3)

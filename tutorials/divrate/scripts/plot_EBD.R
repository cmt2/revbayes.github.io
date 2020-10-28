# Install RevGadgets, ape and ggplot2 if you haven't done so already
#library(devtools)
#install_github("revbayes/RevGadgets")
#install.packages("ape")
#install.packages("ggplot2")
library(RevGadgets)
library(ape)
library(ggplot2)

tree <- read.nexus("data/primates_tree.nex")

primates <- processDivRates(speciation_time_log = "output/primates_EBD_speciation_times.log", 
                            speciation_rate_log = "output/primates_EBD_speciation_rates.log", 
                            extinction_time_log = "output/primates_EBD_extinction_times.log", 
                            extinction_rate_log = "output/primates_EBD_extinction_rates.log", 
                            burnin=0.25)

# create a results for the plot, and change the x-axis label
p <- plotDivRates(primates) +
  xlab("Millions of years ago")

# save the plot
ggsave("EBD.pdf", plot = p)

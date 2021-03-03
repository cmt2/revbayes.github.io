# Install RevGadgets and ggplot2 if you haven't done so already
#library(devtools)
#install_github("revbayes/RevGadgets")
#install.packages("ggplot2")
library(RevGadgets)
library(ggplot2)

rates <- processDivRates(speciation_time_log = "output/primates_uniform_speciation_times.log",
                         speciation_rate_log = "output/primates_uniform_speciation_rates.log",
                         extinction_time_log = "output/primates_uniform_extinction_times.log",
                         extinction_rate_log = "output/primates_uniform_extinction_rates.log")

p <- plotDivRates(rates) +
  xlab("Millions of years ago")

ggsave("figures/uniform.png", p)


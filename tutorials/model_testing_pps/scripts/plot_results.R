# specify the name of the model
model_name <- "JC"

# name the directory with the output
dir <- paste0("results_", model_name, "/")
dataset_name <- "pps_example"

# name the files with the statistics
simulated_stats_fn <- paste0(dir, "simulated_data_", dataset_name, ".csv")
observed_stats_fn  <- paste0(dir, "empirical_data_", dataset_name, ".csv")

# read the statistics
pps_stats <- processPostPredStats(simulated_stats_fn, observed_stats_fn)

# create the plots
pps_plots <- plotPostPredStats(pps_stats)

# plot the mean GC (or any stat by name)
pdf("mean_gc.pdf", height=4)
pps_plots["Mean GC"]
dev.off()

# save all of the plots individually
for(i in 1:length(pps_plots)) {

  # get the name of this statistic
  this_pps_stat <- names(pps_plots)[[i]]

  # create the filename
  this_plot_filename <- paste0(this_pps_stat,".pdf")

  # create the plot
  pdf(this_plot_filename, height=4)
  print(pps_plots[[i]])
  dev.off()

}

# save all of the plots together
pdf("pps_combined.pdf", height=4)
pps_plots
dev.off()


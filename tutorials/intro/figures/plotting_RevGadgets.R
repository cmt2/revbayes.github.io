trace <- readTrace(path = "~/Desktop/revbayes_intro_graph_models/output/linear_regression.log")
trace_mcmc <- coda::as.mcmc(trace[[1]])
png("~/Desktop/revbayes_intro_graph_models/plots/beta_bad_new.png",
    width = 5, height = 5, res = 300, units = "in")
coda:: traceplot(trace_mcmc[,"beta"])
dev.off()

trace <- readTrace(path = "~/Desktop/revbayes_intro_graph_models/output/linear_regression_gen.log")
trace_mcmc <- coda::as.mcmc(trace[[1]])
png("~/Desktop/revbayes_intro_graph_models/plots/beta_good_new.png",
    width = 5, height = 5, res = 300, units = "in")
coda:: traceplot(trace_mcmc[,"beta"])
dev.off()

trace_burnin <- removeBurnin(trace, 0.1)
png("~/Desktop/revbayes_intro_graph_models/plots/param_estimates_new.png",
    width = 5, height = 5, res = 300, units = "in")
plotTrace(trace_burnin, vars = c("alpha", "beta", "sigma"))
dev.off()

trace <- readTrace(path = "~/Desktop/revbayes_intro_graph_models/output/linear_regression_inf.log")
trace_burnin <- removeBurnin(trace, 0.1)
png("~/Desktop/revbayes_intro_graph_models/plots/priors_new.png",
    width = 5, height = 5, res = 300, units = "in")
plotTrace(trace_burnin, vars = c("alpha", "beta", "sigma"))
dev.off()

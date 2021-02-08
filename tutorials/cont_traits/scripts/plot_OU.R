library(RevGadgets)

# read the samples
samples <- readTrace("output/simple_OU.log")

# plot the posterior distributions
pdf("ou_posterior.pdf", height=4)
plotTrace(samples, vars=c("alpha","theta","sigma2"))
dev.off()


# plot the joint distribution of theta and sigma2
library(ggplot2)

pdf("ou_joint_posterior.pdf", height=4, width=4)
ggplot(samples[[1]], aes(x=alpha, y=sigma2)) + geom_point()
dev.off()




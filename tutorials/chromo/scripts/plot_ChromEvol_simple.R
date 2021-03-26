
#
# This R script plots the ancestral chromosome numbers estimated 
# by a ChromoSSE RevBayes analysis.
#
# Install the RevGadgets R package from:
# https://github.com/revbayes/RevGadgets
#

library(RevGadgets)
library(ggplot2)
library(ggtree)
library(tidytree)

fpath <- "output/ChromoSSE_final.tree"
tree <- processAncStates(fpath)

p <- plotAncStatesPie(tree)

p2 <- p + guides(colour = guide_legend("Chromosome \nNumber", override.aes = list(size=4, alpha = 1.0)))

ggsave("figures/ChromEvol_simple.svg", p)

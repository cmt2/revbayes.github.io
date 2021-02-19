library(RevGadgets)

# read the tree
tree <- readTrees("output/bears_relaxed_exponential.mcc.tre")

# plot the tree
pdf("bears_relaxed.mcc.tre.pdf", height=4)
plotTree(tree, node_age_bars=TRUE, node_age_bars_colored_by="posterior")
dev.off()

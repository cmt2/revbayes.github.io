library(RevGadgets)

# read the tree
tree <- readTrees("output/bears_global.mcc.tre")

# plot the tree
pdf("bears_global.mcc.tre.pdf", height=4)
plotTree(tree, node_age_bars=TRUE)
dev.off()

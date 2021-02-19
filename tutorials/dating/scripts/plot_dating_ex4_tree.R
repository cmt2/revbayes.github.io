library(RevGadgets)

# read the tree
tree <- readTrees("output/bears_FBD_extant.mcc.tre")

# plot the tree
pdf("bears_FBD_extant.mcc.tre.pdf", height=4)
plotTree(tree, timeline=FALSE, node_age_bars=TRUE)
dev.off()

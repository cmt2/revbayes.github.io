library(RevGadgets)

# read the tree
tree <- readTrees("output/bears_nodedate.mcc.tre")

# plot the tree
# pdf("bears_nodedate.mcc.tre.pdf", height=4)
plotTree(tree, timeline=TRUE, node_age_bars=TRUE)
# plotTree(tree, timeline=FALSE, node_age_bars=TRUE)
# dev.off()

library(RevGadgets)
library(ggplot2)
library(ggtree)
library(tidytree)

my_tree_file = "data/primates.tre"
my_branch_rates_file = "output/primates_BDS_rates.log"

branch_data <- read.table(my_branch_rates_file, header = TRUE, sep = "\t")
tree <- as.treedata(read.tree(my_tree_file))

tree2 <- processBranchData(tree, branch_data, summary = "median")

p <- plotTree(tree = tree2,
              node_age_bars = FALSE,
              node_pp = F,
              tip_labels = FALSE,
              color_branch_by = "avg_lambda",
              line_width = 0.8,
              branch_color = c("blue","green")) +
     ggplot2::theme(legend.position=c(.1, .9))

ggsave("figures/BDS.png", plot = p)

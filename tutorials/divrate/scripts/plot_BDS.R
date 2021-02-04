library(RevGadgets)
library(ggplot2)
library(ggtree)
library(tidytree)

my_tree_file = "data/primates.tre"
my_branch_rates_file = "output/primates_BDS_rates.log"

branch_data <- read.table(my_branch_rates_file, header = TRUE, sep = "\t")
tree <- as.treedata(read.tree(my_tree_file))

tree2 <- processBranchData(tree, branch_data, summary = "median")

p <- ggtree(tree2) +
	  aes(colour = avg_lambda) +
	    scale_color_continuous(paste0("Posterior median \nspeciation rate"), 
				                            low="blue", high="green") + 
  theme(legend.position=c(0.2,0.80), legend.background=element_blank())


ggsave("figures/BDS.png", plot = p)

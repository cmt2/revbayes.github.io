################################################################################
#
# Plot ancestral placental types inferred using two CTMC models of character evolution.
#
#
# authors: Sebastian Hoehna, Will Freyman, Carrie Tribble
#
################################################################################

library(RevGadgets)

##### MK Model #####
file_path <- "output/ase_mk.tree"
tree <- processAncStates(path = file_path,
                         state_labels = c("1" = "Epitheliochorial",
                                          "2" = "Endotheliochorial",
                                          "3" = "Hemochorial"))

plot <- plotAncStatesMAP(t = tree, tree_layout = "circular") +
        ggplot2::theme(legend.position = c(0.57,0.41))

pdf("ancStatesMap_MK.pdf", height = 20, width = 20)
plot
dev.off()

##### freeK Model #####

file_path <- "output/ase_freeK.tree"
tree <- processAncStates(path = file_path,
                         state_labels = c("1" = "Epitheliochorial",
                                          "2" = "Endotheliochorial",
                                          "3" = "Hemochorial"))

plot <- plotAncStatesMAP(t = tree, tree_layout = "circular") +
  ggplot2::theme(legend.position = c(0.57,0.41))

pdf("ancStatesMap_freeK.pdf", height = 20, width = 20)
plot
dev.off()

##### RJ Model #####

file_path <- "output/ase_freeK_RJ.tree"
tree <- processAncStates(path = file_path,
                         state_labels = c("1" = "Epitheliochorial",
                                          "2" = "Endotheliochorial",
                                          "3" = "Hemochorial"))
                                          #"?" = "?"))

plot <- plotAncStatesMAP(t = tree, tree_layout = "circular") +
  ggplot2::theme(legend.position = c(0.57,0.41))

pdf("ancStatesMap_RJ.pdf", height = 20, width = 20)
plot
dev.off()

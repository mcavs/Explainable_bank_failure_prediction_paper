# merging all couterfactuals as a .Rda File

load("counterfactuals_for_all_models/original/CEs/org_all_cfactuals_rf.rda")
load("counterfactuals_for_all_models/original/CEs/org_all_cfactuals_ext.rda")
load("counterfactuals_for_all_models/original/CEs/org_all_cfactuals_dt.rda")
load("counterfactuals_for_all_models/original/CEs/org_all_cfactuals_xgb.rda")
load("counterfactuals_for_all_models/original/CEs/org_nice_cfactuals_dt.rda")
load("counterfactuals_for_all_models/original/CEs/org_nice_cfactuals_rf.rda")
load("counterfactuals_for_all_models/original/CEs/org_nice_cfactuals_ext.rda")
load("counterfactuals_for_all_models/original/CEs/org_nice_cfactuals_xgb.rda")
load("counterfactuals_for_all_models/original/CEs/org_moc_cfactuals_dt.rda")
load("counterfactuals_for_all_models/original/CEs/org_moc_cfactuals_ext.rda")
load("counterfactuals_for_all_models/original/CEs/org_moc_cfactuals_rf.rda")
load("counterfactuals_for_all_models/original/CEs/org_moc_cfactuals_xgb.rda")


# What-if Results #
org_all_cfactuals_ext$CE_Method <- rep("WhatIf", nrow(org_all_cfactuals_ext))
org_all_cfactuals_ext$Used_Model <- rep("Extra trees", nrow(org_all_cfactuals_ext))

org_all_cfactuals_dt$CE_Method <- rep("WhatIf", nrow(org_all_cfactuals_dt))
org_all_cfactuals_dt$Used_Model <- rep("Decision tree", nrow(org_all_cfactuals_dt))

org_all_cfactuals_rf$CE_Method <- rep("WhatIf", nrow(org_all_cfactuals_rf))
org_all_cfactuals_rf$Used_Model <- rep("Random forest", nrow(org_all_cfactuals_rf))

org_all_cfactuals_xgb$CE_Method <- rep("WhatIf", nrow(org_all_cfactuals_xgb))
org_all_cfactuals_xgb$Used_Model <- rep("XGBoost", nrow(org_all_cfactuals_xgb))

org_whatif_results <- rbind(org_all_cfactuals_ext, org_all_cfactuals_dt, org_all_cfactuals_rf, org_all_cfactuals_xgb, fill = TRUE)
save(org_whatif_results, file = "counterfactuals_for_all_models/original/org_whatif_results.rda")

# MOC Results #

org_moc_cfactuals_ext$CE_Method <- rep("MOC", nrow(org_moc_cfactuals_ext))
org_moc_cfactuals_ext$Used_Model <- rep("Extra trees", nrow(org_moc_cfactuals_ext))

org_moc_cfactuals_dt$CE_Method <- rep("MOC", nrow(org_moc_cfactuals_dt))
org_moc_cfactuals_dt$Used_Model <- rep("Decision tree", nrow(org_moc_cfactuals_dt))

org_moc_cfactuals_rf$CE_Method <- rep("MOC", nrow(org_moc_cfactuals_rf))
org_moc_cfactuals_rf$Used_Model <- rep("Random forest", nrow(org_moc_cfactuals_rf))

org_moc_cfactuals_xgb$CE_Method <- rep("MOC", nrow(org_moc_cfactuals_xgb))
org_moc_cfactuals_xgb$Used_Model <- rep("XGBoost", nrow(org_moc_cfactuals_xgb))

org_moc_results <- rbind(org_moc_cfactuals_ext, org_moc_cfactuals_dt, org_moc_cfactuals_rf, org_moc_cfactuals_xgb, fill = TRUE)
save(org_moc_results, file = "counterfactuals_for_all_models/original/org_moc_results.rda")


# NICE Results #

org_nice_cfactuals_ext$CE_Method <- rep("NICE", nrow(org_nice_cfactuals_ext))
org_nice_cfactuals_ext$Used_Model <- rep("Extra trees", nrow(org_nice_cfactuals_ext))

org_nice_cfactuals_dt$CE_Method <- rep("NICE", nrow(org_nice_cfactuals_dt))
org_nice_cfactuals_dt$Used_Model <- rep("Decision tree", nrow(org_nice_cfactuals_dt))

org_nice_cfactuals_rf$CE_Method <- rep("NICE", nrow(org_nice_cfactuals_rf))
org_nice_cfactuals_rf$Used_Model <- rep("Random forest", nrow(org_nice_cfactuals_rf))

org_nice_cfactuals_xgb$CE_Method <- rep("NICE", nrow(org_nice_cfactuals_xgb))
org_nice_cfactuals_xgb$Used_Model <- rep("XGBoost", nrow(org_nice_cfactuals_xgb))

org_nice_results <- rbind(org_nice_cfactuals_ext, org_nice_cfactuals_dt, org_nice_cfactuals_rf, org_nice_cfactuals_xgb, fill = TRUE)
save(org_nice_results, file = "counterfactuals_for_all_models/original/org_nice_results.rda")




# merging prediction and metrics with IDRSSD
merged_org_df <- merge(df_org_results2, modelData_for_prediction, by = "IDRSSD")

# DT
merged_org_dt_data <- merged_org_df[, !(names(merged_org_df) %in%
                                          c("OverAllProb", "OverAllPrediction", 
                                            "Prediction_rf", "Prediction_ext", "Prediction_xgb", 
                                            "Prob_rf", "Prob_ext", "Prob_xgb"))]
head(merged_org_dt_data)

filtered_org_dt <- merged_org_dt_data[merged_org_dt_data$Prediction_dt == 1, ]
head(filtered_org_dt)

# EXT
merged_org_ext_data <- merged_org_df[, !(names(merged_org_df) %in% 
                                           c("OverAllProb", "OverAllPrediction", 
                                             "Prediction_rf", "Prediction_dt", "Prediction_xgb",
                                             "Prob_rf", "Prob_dt", "Prob_xgb"))]
colnames(merged_org_ext_data)[colnames(merged_org_ext_data) == "Prediction_ext"] <- "Label"
merged_org_ext_data <- merged_org_ext_data[,-8]
head(merged_org_ext_data)

filtered_org_ext <- merged_org_ext_data[merged_org_ext_data$Label == 1, ]
head(filtered_org_ext)


# RF
merged_org_rf_data <- merged_org_df[, !(names(merged_org_df) %in% 
                                          c("OverAllProb", "OverAllPrediction", 
                                            "Prediction_ext", "Prediction_dt", "Prediction_xgb",
                                            "Prob_ext", "Prob_dt", "Prob_xgb"))]
colnames(merged_org_rf_data)[colnames(merged_org_rf_data) == "Prediction_rf"] <- "Label"
merged_org_rf_data <- merged_org_rf_data[,-8]
head(merged_org_rf_data)

filtered_org_rf <- merged_org_rf_data[merged_org_rf_data$Label == 1, ]
head(filtered_org_rf)

# XGB
merged_org_xgb_data <- merged_org_df[, !(names(merged_org_df) %in% 
                                          c("OverAllProb", "OverAllPrediction", 
                                            "Prediction_ext", "Prediction_dt", "Prediction_rf",
                                            "Prob_ext", "Prob_dt", "Prob_rf"))]
colnames(merged_org_xgb_data)[colnames(merged_org_xgb_data) == "Prediction_xgb"] <- "Label"
merged_org_xgb_data <- merged_org_xgb_data[,-8]
head(merged_org_xgb_data)

filtered_org_xgb <- merged_org_xgb_data[merged_org_xgb_data$Label == 1, ]
head(filtered_org_xgb)

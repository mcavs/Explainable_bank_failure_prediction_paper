# merging prediction and metrics with IDRSSD

# DT
smote_merged_df <- merge(smote_df_results2, modelData_for_prediction, by = "IDRSSD")

smote_merged_dt_data <- smote_merged_df[, !(names(smote_merged_df) %in%
                                              c("OverAllProb", "OverAllPrediction", 
                                                "Prediction_rf", "Prediction_ext", "Prediction_xgb", 
                                                "Prob_rf", "Prob_ext", "Prob_xgb"))]

head(smote_merged_dt_data)

smote_filtered_dt <- smote_merged_dt_data[smote_merged_dt_data$Prediction_dt == 1, ]

head(smote_filtered_dt)


# EXT
smote_merged_ext_data <- smote_merged_df[, !(names(smote_merged_df) %in% 
                                               c("OverAllProb", "OverAllPrediction", 
                                                 "Prediction_rf", "Prediction_dt", "Prediction_xgb",
                                                 "Prob_rf", "Prob_dt", "Prob_xgb"))]
colnames(smote_merged_ext_data)[colnames(smote_merged_ext_data) == "Prediction_ext"] <- "Label"
smote_merged_ext_data <- smote_merged_ext_data[,-8]
head(smote_merged_ext_data)

smote_filtered_ext <- smote_merged_ext_data[smote_merged_ext_data$Label == 1, ]

head(smote_filtered_ext)


# RF
smote_merged_rf_data <- smote_merged_df[, !(names(smote_merged_df) %in% 
                                              c("OverAllProb", "OverAllPrediction", 
                                                "Prediction_ext", "Prediction_dt", "Prediction_xgb",
                                                "Prob_ext", "Prob_dt", "Prob_xgb"))]
colnames(smote_merged_rf_data)[colnames(smote_merged_rf_data) == "Prediction_rf"] <- "Label"
smote_merged_rf_data <- smote_merged_rf_data[,-8]

head(smote_merged_rf_data)

smote_filtered_rf <- smote_merged_rf_data[smote_merged_rf_data$Label == 1, ]

head(smote_filtered_rf)

# XGB
smote_merged_xgb_data <- smote_merged_df[, !(names(smote_merged_df) %in% 
                                           c("OverAllProb", "OverAllPrediction", 
                                             "Prediction_ext", "Prediction_dt", "Prediction_rf",
                                             "Prob_ext", "Prob_dt", "Prob_rf"))]
colnames(smote_merged_xgb_data)[colnames(smote_merged_xgb_data) == "Prediction_xgb"] <- "Label"
smote_merged_xgb_data <- smote_merged_xgb_data[,-8]
head(smote_merged_xgb_data)

smote_filtered_xgb <- smote_merged_xgb_data[smote_merged_xgb_data$Label == 1, ]
head(smote_filtered_xgb)

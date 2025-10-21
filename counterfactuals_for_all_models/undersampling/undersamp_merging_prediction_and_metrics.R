# merging prediction and metrics with IDRSSD

# DT
under_merged_df <- merge(under_df_results2, modelData_for_prediction, by = "IDRSSD")

under_merged_dt_data <- under_merged_df[, !(names(under_merged_df) %in% 
                                              c("OverAllProb", "OverAllPrediction", 
                                                "Prediction_rf", "Prediction_ext", "Prediction_xgb", 
                                                "Prob_rf", "Prob_ext", "Prob_xgb"))]

head(under_merged_dt_data)
under_filtered_dt <- under_merged_dt_data[under_merged_dt_data$Prediction_dt == 1, ]

head(under_filtered_dt)


# EXT
under_merged_ext_data <- under_merged_df[, !(names(under_merged_df) %in% 
                                               c("OverAllProb", "OverAllPrediction", 
                                                 "Prediction_rf", "Prediction_dt", "Prediction_xgb",
                                                 "Prob_rf", "Prob_dt", "Prob_xgb"))]
colnames(under_merged_ext_data)[colnames(under_merged_ext_data) == "Prediction_ext"] <- "Label"
under_merged_ext_data <- under_merged_ext_data[,-8]
head(under_merged_ext_data)

under_filtered_ext <- under_merged_ext_data[under_merged_ext_data$Label == 1, ]

head(under_filtered_ext)


# RF
under_merged_rf_data <- under_merged_df[, !(names(under_merged_df) %in% 
                                              c("OverAllProb", "OverAllPrediction", 
                                                "Prediction_ext", "Prediction_dt", "Prediction_xgb",
                                                "Prob_ext", "Prob_dt", "Prob_xgb"))]
colnames(under_merged_rf_data)[colnames(under_merged_rf_data) == "Prediction_rf"] <- "Label"
under_merged_rf_data <- under_merged_rf_data[,-8]

head(under_merged_rf_data)

under_filtered_rf <- under_merged_rf_data[under_merged_rf_data$Label == 1, ]

head(under_filtered_rf)

# XGB
under_merged_xgb_data <- under_merged_df[, !(names(under_merged_df) %in% 
                                             c("OverAllProb", "OverAllPrediction", 
                                               "Prediction_ext", "Prediction_dt", "Prediction_rf",
                                               "Prob_ext", "Prob_dt", "Prob_rf"))]
colnames(under_merged_xgb_data)[colnames(under_merged_xgb_data) == "Prediction_xgb"] <- "Label"
under_merged_xgb_data <- under_merged_xgb_data[,-8]
head(under_merged_xgb_data)

under_filtered_xgb <- under_merged_xgb_data[under_merged_xgb_data$Label == 1, ]
head(under_filtered_xgb)
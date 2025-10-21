# Computing moc counterfactuals for all models

### Decision Tree ###

# Creating a 'predictor' object, which serves as a wrapper for different model types.
under_predictor_dt <- Predictor$new(model_dt_under2)
under_filtered_dt <- under_filtered_dt %>% filter(TICRC <= 0.0205772 & NIMY <= 11.9066 & ROE <= 70.36 & RBC1AAJ <= 84.4993 & INTEXPYQ>= -1.49012e-08)
under_moc_ce_dt <- list()

for (i in 1:nrow(under_filtered_dt)) {
  x_interest <- under_filtered_dt[i,]
  print(under_predictor_dt$predict(x_interest))
  moc_classif <- MOCClassif$new(
    under_predictor_dt,
    epsilon = NULL,
    fixed_features = NULL,
    max_changed = NULL,
    mu = 20L,
    termination_crit = "gens",
    n_generations = 10L,
    p_rec = 0.71,
    p_rec_gen = 0.62,
    p_mut = 0.73,
    p_mut_gen = 0.5,
    p_mut_use_orig = 0.4,
    k = 1L,
    weights = NULL,
    lower = NULL,
    upper = NULL,
    init_strategy = "icecurve",
    use_conditional_mutator = FALSE,
    quiet = FALSE,
    distance_function = "gower"
  )
  
  moc_cfactuals <- moc_classif$find_counterfactuals(x_interest, desired_class = "0", desired_prob = c(0.5, 1))
  
  under_moc_ce_dt[[i]] <- cbind(
    moc_cfactuals$evaluate(),
    moc_cfactuals$evaluate_set()
  )
  moc_cfactuals$predict()
  
}

#under_moc_cfactuals_dt <- do.call(rbind, under_moc_ce_dt)
under_moc_cfactuals_dt <- rbindlist(under_moc_ce_dt, fill = TRUE)
save(under_moc_cfactuals_dt, file = "counterfactuals_for_all_models/undersampling/CEs/under_moc_cfactuals_dt.rda")

### Extratrees ###

under_predictor_ext <- Predictor$new(model_under2_ext)
under_filtered_ext <- under_filtered_ext %>% filter(TICRC <= 0.0205772 & NIMY <= 11.9066 & ROE <= 70.36 & RBC1AAJ <= 84.4993 & INTEXPYQ>= -1.49012e-08)
#under_predictor_ext <- Predictor$new(
 # model = model_under2_ext,
 # data  = undersampling_train_data2 %>% dplyr::select(-Label),
#  y     = undersampling_train_data2$Label
#)
under_moc_ce_ext <- list()

for (i in 1:nrow(under_filtered_ext)) {
  x_interest <- under_filtered_ext[i,]
  print(under_predictor_ext$predict(x_interest))
  moc_classif <- MOCClassif$new(
    under_predictor_ext,
    epsilon = NULL,
    fixed_features = NULL,
    max_changed = NULL,
    mu = 20L,
    termination_crit = "gens",
    n_generations = 10L,
    p_rec = 0.71,
    p_rec_gen = 0.62,
    p_mut = 0.73,
    p_mut_gen = 0.5,
    p_mut_use_orig = 0.4,
    k = 1L,
    weights = NULL,
    lower = NULL,
    upper = NULL,
    init_strategy = "icecurve",
    use_conditional_mutator = FALSE,
    quiet = FALSE,
    distance_function = "gower"
  )
  
  moc_cfactuals <- moc_classif$find_counterfactuals(x_interest, desired_class = "X0", desired_prob = c(0.5, 1))
  
  under_moc_ce_ext[[i]] <- cbind(
    moc_cfactuals$evaluate(),
    moc_cfactuals$evaluate_set()
  )
  print(moc_cfactuals$predict())
}

under_moc_cfactuals_ext <- do.call(rbind, under_moc_ce_ext)
save(under_moc_cfactuals_ext, file = "counterfactuals_for_all_models/undersampling/CEs/under_moc_cfactuals_ext.rda")


### Randomforest ###

under_predictor_rf <- Predictor$new(model_under2_rf)
under_filtered_rf <- under_filtered_rf %>% filter(TICRC <= 0.0205772 & NIMY <= 11.9066 & ROE <= 70.36 & RBC1AAJ <= 84.4993 & INTEXPYQ>= -1.49012e-08)
under_moc_ce_rf <- list()

for (i in 1:nrow(under_filtered_rf)) {
  x_interest <- under_filtered_rf[i,]
  print(under_predictor_rf$predict(x_interest))
  moc_classif <- MOCClassif$new(
    under_predictor_rf,
    epsilon = NULL,
    fixed_features = NULL,
    max_changed = NULL,
    mu = 20L,
    termination_crit = "gens",
    n_generations = 10L,
    p_rec = 0.71,
    p_rec_gen = 0.62,
    p_mut = 0.73,
    p_mut_gen = 0.5,
    p_mut_use_orig = 0.4,
    k = 1L,
    weights = NULL,
    lower = NULL,
    upper = NULL,
    init_strategy = "icecurve",
    use_conditional_mutator = FALSE,
    quiet = FALSE,
    distance_function = "gower"
  )
  
  moc_cfactuals <- moc_classif$find_counterfactuals(x_interest, desired_class = "X0", desired_prob = c(0.5, 1))
  
  under_moc_ce_rf[[i]] <- cbind(
    moc_cfactuals$evaluate(),
    moc_cfactuals$evaluate_set()
  )
  print(moc_cfactuals$predict())
}

#under_moc_cfactuals_rf <- do.call(rbind, under_moc_ce_rf)
under_moc_cfactuals_rf <- rbindlist(under_moc_ce_rf, fill = TRUE)
save(under_moc_cfactuals_rf, file = "counterfactuals_for_all_models/undersampling/CEs/under_moc_cfactuals_rf.rda")


## XGBoost ###

# Creating a 'predictor' object, which serves as a wrapper for different model types.
under_predictor_xgb <- Predictor$new(model_smote2_xgb)
under_filtered_xgb <- under_filtered_xgb %>% filter(TICRC <= 0.0205772 & NIMY <= 11.9066 & ROE <= 70.36 & RBC1AAJ <= 84.4993 & INTEXPYQ>= -1.49012e-08)
under_moc_ce_xgb <- list()

for (i in 1:nrow(under_filtered_xgb)) {
  x_interest <- under_filtered_xgb[i,]
  print(under_predictor_xgb$predict(x_interest))
  moc_classif <- MOCClassif$new(
    under_predictor_xgb,
    epsilon = NULL,
    fixed_features = NULL,
    max_changed = NULL,
    mu = 20L,
    termination_crit = "gens",
    n_generations = 10L,
    p_rec = 0.71,
    p_rec_gen = 0.62,
    p_mut = 0.73,
    p_mut_gen = 0.5,
    p_mut_use_orig = 0.4,
    k = 1L,
    weights = NULL,
    lower = NULL,
    upper = NULL,
    init_strategy = "icecurve",
    use_conditional_mutator = FALSE,
    quiet = FALSE,
    distance_function = "gower"
  )
  
  moc_cfactuals <- moc_classif$find_counterfactuals(x_interest, desired_class ="0", desired_prob = c(0.5, 1))
  under_moc_ce_xgb[[i]] <- cbind(
    moc_cfactuals$evaluate(),
    moc_cfactuals$evaluate_set()
  )
  moc_cfactuals$predict()
  
}

under_moc_cfactuals_xgb <- do.call(rbind, under_moc_ce_xgb)
save(under_moc_cfactuals_xgb, file = "counterfactuals_for_all_models/undersampling/CEs/under_moc_cfactuals_xgb.rda")



# Explainable_bank_-failure_prediction_paper

This repository contains code and resources related to the implementation of counterfactual explanations for bank failure prediction models.

## Table of Contents

1. [Overview](#overview)
2. [Contents](#contents)
3. [Getting Started](#getting-started)
4. [References](#references)

## Overview <a name="overview"></a>

Predicting bank failures is a critical aspect of financial risk management. Advanced predictive models use various features and historical data to evaluate the probability of a bank's failure. However, it is equally important for stakeholders, including regulators, investors, and bank management, to understand the underlying reasons for these model predictions.

Counterfactual explanations play a vital role by identifying the minimal changes needed to modify the prediction outcome. In bank failure prediction, these explanations shed light on the factors influencing the model's decisions, enabling stakeholders to make informed decisions and implement strategies to reduce the risk of failure.

## Contents <a name="contents"></a>

- `data/`: This directory contains datasets used for training and evaluation.
- `model/`: Implementation of bank failure prediction models.
- `counterfactual_for_all_models/`: Codes for generating counterfactual explanations.

## Getting Started  <a name="getting-started"></a>

1. Clone this repository to your local machine.
2. Download the packages in the [libraries](https://github.com/seymagnn/UYIK2024_Counterfactual_Explanations_of_Bank_Failure_Prediction_Models/blob/main/libraries.R) script.
3. Complete data manipulation operations by pulling metrics from the [arranged data](https://github.com/seymagnn/UYIK2024_Counterfactual_Explanations_of_Bank_Failure_Prediction_Models/blob/main/data/arranging_data.R) script.
4. Splitting data into two subsets in [model partition](https://github.com/seymagnn/UYIK2024_Counterfactual_Explanations_of_Bank_Failure_Prediction_Models/blob/main/model/model_partition.R) script.
5. Each model is included in 3 separate methods for the original dataset, 3 resampling and weighting methods. You can get all the counterfactuals in [Original](https://github.com/seymagnn/Counterfactual_Explanations_of_Bank_Failure_Prediction_Models/tree/main/counterfactuals_for_all_models/original), [Oversampling](https://github.com/seymagnn/Counterfactual_Explanations_of_Bank_Failure_Prediction_Models/tree/main/counterfactuals_for_all_models/oversampling), [Undersampling](https://github.com/seymagnn/Counterfactual_Explanations_of_Bank_Failure_Prediction_Models/tree/main/counterfactuals_for_all_models/undersampling), [SMOTE](https://github.com/seymagnn/Counterfactual_Explanations_of_Bank_Failure_Prediction_Models/tree/main/counterfactuals_for_all_models/smote) and [Weighting](https://github.com/seymagnn/Counterfactual_Explanations_of_Bank_Failure_Prediction_Models/tree/main/counterfactuals_for_all_models/weighting) scripts.

## References  <a name="references"></a>

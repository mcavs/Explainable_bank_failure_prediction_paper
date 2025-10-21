# combining all the datasets
combined_datasets <- bind_rows(
  org_summary_metrics %>% mutate(Model = "Original"),
  undersamp_summary_metrics %>% mutate(Model = "Undersampling"),
  oversamp_summary_metrics %>% mutate(Model = "Oversampling"),
  smote_summary_metrics %>% mutate(Model = "SMOTE"),
  summary_metrics %>% mutate(Model = "Cost-sensitive")
) %>% mutate(Model = factor(Model, levels = c("Original", "Undersampling", "Oversampling", "SMOTE", "Cost-sensitive")))

# making graph (4x5)
ggplot(combined_datasets, aes(x = CE_Method, y = Mean_Values, color = Used_Model, group = Used_Model)) +
  geom_line(position = position_dodge(width = 0.5)) +
  geom_point(position = position_dodge(width = 0.5)) +
  geom_errorbar(aes(ymin = Mean_Values - StdDev_Values, ymax = Mean_Values + StdDev_Values), width = 0.2,
                position = position_dodge(width = 0.5)) +
  facet_grid(Quality_Metric ~ Model, scales = "free_y") +
  labs(x = "", y = "Mean Values", color = "Used Model") +
  theme_minimal() +
  theme(legend.position = "bottom") +
  theme(legend.title=element_blank()) +
  theme(axis.text.y = element_text(size = 13),
        axis.text.x = element_text(size = 13),
        axis.title.y = element_text(size = 13),
        strip.text = element_text(size = 13))

# 2
ggplot(combined_datasets, aes(x = CE_Method, y = Mean_Values, color = Used_Model, group = Used_Model)) +
  geom_line(position = position_dodge(width = 0.5), linewidth = 1) +
  geom_point(size = 2.5, position = position_dodge(width = 0.5)) +
  geom_errorbar(aes(ymin = Mean_Values - StdDev_Values, ymax = Mean_Values + StdDev_Values),
                width = 0.2, position = position_dodge(width = 0.5)) +
  facet_grid(Quality_Metric ~ Model, scales = "free_y") +
  labs(x = "", y = "Mean Values", color = "Used Model") +
  theme_minimal(base_size = 15) +
  theme(
    legend.position = "bottom",
    legend.title = element_blank(),
    axis.text.x = element_text(size = 13, angle = 45, hjust = 1, vjust = 1),
    axis.text.y = element_text(size = 13),
    axis.title.y = element_text(size = 15),
    strip.text = element_text(size = 15),
    strip.text.y = element_text(angle = 0),   
    panel.spacing = unit(0.8, "lines"),
    plot.margin = margin(10, 5, 10, 5)
  )


# making graph (5x4)
ggplot(combined_datasets, aes(x = CE_Method, y = Mean_Values, color = Used_Model, group = Used_Model)) +
  geom_line(position = position_dodge(width = 0.5)) +
  geom_point(position = position_dodge(width = 0.5)) +
  geom_errorbar(aes(ymin = Mean_Values - StdDev_Values, ymax = Mean_Values + StdDev_Values), width = 0.2,
                position = position_dodge(width = 0.5)) +
  facet_grid(Model ~ Quality_Metric, scales = "free_x") +
  labs(x = "", y = "Mean Values", color = "Used Model") +
  theme_minimal() +
  theme(legend.position = "bottom") +
  theme(legend.title=element_blank()) +
  theme(axis.text.y = element_text(size = 15),
        axis.text.x = element_text(size = 15),
        axis.title.y = element_text(size = 15),
        strip.text = element_text(size = 13))

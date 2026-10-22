
library(tidyverse)

# Data frame as per your timeline
tasks <-
  tribble(
    ~Task, ~Start, ~End,
    "Review of literature", "2023-10-01", "2025-12-08",
    "Protocol development & Submission", "2023-12-01", "2024-01-30",
    "IRC & IEC approval", " 2024-02-01", "2024-04-24",
    "CTRI registration", " 2024-04-24", "2024-06-15",
    "Enrollment & Data collection", "2024-06-15", "2025-08-28",
    "Analysis of data", "2025-08-28", "2025-11-30",
    "Thesis Writing, Reiew, & Finalization", "2025-11-01", "2025-12-10",
    "Thesis submission", "2025-12-10", "2025-12-25"
  ) %>%
  mutate(Task = factor(Task, levels = rev(Task)),
         Start = as.Date(Start),
         End = as.Date(End))


set.seed(123)
# Plot
g <- ggplot(tasks, aes(y = Task)) +
  geom_segment(aes(x = Start, xend = End, yend = Task, color = Task),
               linewidth = 18, lineend = "butt") +
  scale_colour_viridis_d(option = "H") +
  scale_x_date(date_breaks = "2 months", date_labels = "%b\n%Y") +
  labs(caption = "Gantt Chart: Activities related to Thesis", x = "Timeline", y = NULL) +
  theme_minimal(base_size = 12) +
  theme(
    legend.position = "none",
    panel.grid.minor = element_blank(),
    axis.text.y = element_text(size = 12, face = "bold"),
    plot.margin        = unit(c(0., 0., 0., 0.), "in"),
    panel.grid.major =  element_line(colour = "gray51")
  ) +
  scale_y_discrete(labels = function(x) str_wrap(x, width = 20))

g


ggsave(
  filename = "images/gantt_chart.png",
  plot     = g,
  device   = "png",
  width    = 11.69,
  height   = 8.27,
  units    = "in",
  bg = "white"
)

rm(g, tasks)

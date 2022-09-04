
library(dplyr)
library(stringr)
library(readr)
library(ggplot2)

source("plot_theme.R")

file_names <- dir("data/", full.names = TRUE)

# file_names <- c("races", "drivers", "results", "driverStandings")



for (f in file_names) {
    fn <- str_extract(f, "(?<=\\/)[a-zA-Z]+(?=\\.csv)")
    assign(fn, read_csv(f))
}

yr <- 2015

standings <- races %>%
    inner_join(driverStandings, by = "raceId") %>%
    inner_join(drivers, by = "driverId") %>%
    filter(year == yr) %>%
    select(round, position, code)

max_round <- max(standings$round)
top_n <- 8


p <- ggplot(data = standings, aes(x = round, y = position, group = code)) +
    geom_line(aes(color = code, alpha = 1), size = 2) +
    geom_point(aes(color = code), size = 3, shape = 21, fill = "white") +
    scale_y_reverse(breaks = 1:nrow(standings)) +
    scale_x_continuous(breaks = 1:max_round, expand = c(0.05, 0.05)) +
    geom_text(data = standings %>% filter(round == 1), aes(label = code, x = 0.5), hjust = 0.85,
              fontface = "bold", color = "#888888", size = 3) +
    geom_text(data = standings %>% filter(round == max_round), aes(label = code, x = max_round + 0.5), hjust = 0.15,
              fontface = "bold", color = "#888888", size = 3) +
    coord_cartesian(ylim = c(1, top_n)) +
    labs(x = "Grand Prix Rounds",
         y = "Driver Standing",
         title = "Driver Classification by Round",
         subtitle = paste(yr, "Formula One Season")) +
    my_theme()

p

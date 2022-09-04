
d <- select(races, -time, -url) %>%
    inner_join(qualifying, by = "raceId") %>%
    inner_join(results, by = c("raceId", "driverId")) %>%
    inner_join(drivers, by = "driverId")

yr <- 2017

rd <- filter(d, year == yr)


p <- ggplot(rd, aes(x = position.x, y = positionOrder)) +
    geom_point()

p

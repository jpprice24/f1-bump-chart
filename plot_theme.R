
my_theme <- function() {
    # COLORS
    color.background = "white"
    color.text = "#22211d"
    
    theme_bw(base_size = 15) +
        theme(panel.background = element_rect(fill = color.background,
                                              color = color.background)) +
        theme(plot.background = element_rect(fill = color.background,
                                              color = color.background)) +
        theme(panel.border = element_rect(color = color.background)) +
        theme(strip.background = element_rect(fill = color.background,
                                              color = color.background)) +
        theme(panel.grid.major.y = element_blank()) +
        theme(panel.grid.minor.y = element_blank()) +
        theme(axis.ticks = element_blank()) +
        theme(legend.position = "none") +
        theme(plot.title = element_text(color = color.text, size = 20, face = "bold")) +
        theme(axis.title.x = element_text(color = "black", size = 14, face = "bold")) +
        theme(axis.title.y = element_text(color = "black", size = 14, face = "bold", vjust = 1.25)) +
        theme(axis.text.x = element_text(size = 10, vjust = 0.5, hjust = 0.5, color = color.text)) +
        theme(axis.text.y = element_text(size = 10, color = color.text)) +
        theme(strip.text = element_text(face = "bold")) +
        theme(plot.margin = unit(c(0.35, 0.2, 0.3, 0.35), "cm"))
}

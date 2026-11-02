plot_verfahren <- function(start_year = 2012,
                           end_year = 2023) {
  
  av_periods <- tibble::tribble(
    ~Schulart,                                  ~von, ~bis,
    "Grund- und Mittelschule",                  2012, 2016,
    "Förderschule/SVE",                         2012, 2019,
    "Realschule",                               2012, 2013,
    "Realschule z. sp. F.",                     2012, 2013,
    "Abendrealschule",                          2012, 2013,
    "Wirtschaftsschule",                        2012, 2021,
    "Gymnasium",                               2012, 2013,
    "Abendgymnasium",                           2012, 2021,
    "Kolleg",                                   2012, 2021,
    "Schulartunabh. Orientstufe",               2012, 2018,
    "Integr. Gesamtschule",                     2012, 2018,
    "Freie Waldorfschule",                      2012, 2018,
    "Berufsschule",                             2012, 2021,
    "Berufsschulen zur sonderpäd. Förderung",   2012, 2023,
    "Fachoberschule",                           2012, 2023,
    "Berufsoberschule",                         2012, 2023,
    "Berufsfachschule",                         2012, 2021,
    "Berufsfachschule Gesundheit",              2012, 2023,
    "Fachschulen",                              2012, 2023,
    "Fachakademien",                            2012, 2023
  )
  
  av_periods <- av_periods |> dplyr::arrange(Schulart)
  
  data_long <- tidyr::expand_grid(Schulart = av_periods$Schulart, Jahr = start_year:end_year) |>
    dplyr::left_join(av_periods, by = "Schulart") |>
    dplyr::mutate(Verfahren = dplyr::case_when(Jahr >= von &
                                                 Jahr <= bis ~ "AV", TRUE ~ "NV")) |>
    dplyr::select(Schulart, Jahr, Verfahren)
  
  
  
  data_long <- data_long |>
    dplyr::mutate(
      Schulart = forcats::fct_rev(forcats::fct_inorder(Schulart)),
      Jahr = factor(Jahr, levels = start_year:end_year)
    )
  
  
  ggplot2::ggplot(data_long, ggplot2::aes(x = Jahr, y = Schulart, fill = Verfahren)) +
    ggplot2::geom_tile(color = "black", linewidth = 0.3) +
    ggplot2::scale_fill_manual(
      values = c("AV" = "darkgray", "NV" = "white"),
      name = "Verfahren",
      labels = c("AV" = "Altverfahren", "NV" = "Neuverfahren")
    ) +
    ggplot2::labs(title = "Schulen im Alt-/Neuverfahren", x = "Jahr", y = "Schulart") +
    ggplot2::theme_minimal(base_size = 14) +
    ggplot2::theme(
      panel.grid = ggplot2::element_blank(),
      axis.text.x = ggplot2::element_text(angle = 45, hjust = 1),
      legend.position = "bottom"
    )
}




plot_verfahren()

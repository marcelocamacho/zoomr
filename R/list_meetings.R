list_meetings <- function(user_id){

  meetings <- httr::GET(
    paste0('https://api.zoom.us/v2/users/',user_id,'/meetings'),
    httr::add_headers(authorization = paste("Bearer",Sys.getenv("ZOOM_API")))
  )
  ## Testando o objeto meetings
   mensagem <- httr::content(meetings)$message

  existing_meetings <- meetings %>%
    httr::content() %>%
    purrr::pluck("meetings") %>%
    purrr::map(unlist,recursive = TRUE) %>%
    purrr::map_dfr(tibble::enframe, .id = "order") %>%
    tidyr::pivot_wider(
      names_from = name,
      values_from = value, names_repair = "unique"
    )

  existing_meetings
}

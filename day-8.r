conus = USAboundaries::us_states() %>%
  filter(!state_name %in% c("Puerto Rico",
                            "Alaska",
                            "Hawaii"))
length(st_geometry(conus))

us_c_ml = st_combine(conus) %>%
  st_cast("MULTILINESTRING")

us_u_ml = st_union(conus) %>%
  st_cast("MULTILINESTRING")

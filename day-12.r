states = filter(us_states(), stusps %in% c("CO", "UT", "WY", "NE", "KS", "OK", "NM")) %>%
  select_name

co = filter(states, name == Colorado)

(mutate(states,
        deim9 = st_relate(states, co),
        touch = st_touches(states, co, sparse = FALSE)))

mutate(states, equalsCO = (name == "Colorado")) %>%
  st_drop_geometry()
filter(states, name == "Colorado") %>%
  st_drop_geometry()

mutate(states,
       touch = st_touches(states, co, sparse = FALSE))
st_filter(states, co, .predicate = st_touches)

ggplot(states) +
  geom_sf() +
  geom_sf(data = co, fill = "yellow", alpha = .5) +
  geom_sf(data = st_filter(states, co, .predicate = st_touches), fill = "red", alpha = .5) +
  theme_void()

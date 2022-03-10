# data
vaccine_data <- read.csv("data/vaccine_data/country_vaccinations.csv")

# widgets
# country choices
country_choices <- vaccine_data %>%
  select(country) %>% 
  distinct(country)

country_widget <- selectInput(
  inputId = "country",
  label = "Choose a Country",
  choices = country_choices
)

overview_page <- tabPanel(
  "Overview",
  
  titlePanel("Introduction")
)

deterministic_page <- tabPanel(
  "Deterministic Model",
  
  titlePanel("Deterministic Model"),
  
  sidebarLayout(
    sidebarPanel(
      country_widget,
      p("Use the widgets to select a country and vaccine brand to see the
        vaccination rate in that country.")
    ),
  
    mainPanel(
      p("The following graph shows the number of people vaccinated by a specific
        brand of vaccine within a specific country ")
    )
  )
)

stochastic_page <- tabPanel(
  "Stochastic Model",
  
  titlePanel("Stochastic Model")
)

interpretation_page <- tabPanel(
  "Interpretation",
  
  titlePanel("Interpretation")
)

ui <- navbarPage(
  "Covid-19 Disease Modeling",
  overview_page,
  deterministic_page,
  stochastic_page,
  interpretation_page
)

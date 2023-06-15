# Load libraries, data -----------------------------------------------
ccdata <- read.csv("ShinyCCData.csv")

# Page 1 - Introduction ----------------------------------------------
intro_panel <- tabPanel(
  "Introduction",
  
  titlePanel("Chronic Conditions Data"),
  
  img(src = "med.PNG", height = 400, width = 800),
  br(), br(),
  
  p("This is my first test R Shiny app using the Chronic Conditions PUF! The original
    data set can be found at the link below."),
  
  p(a(href = "https://www.cms.gov/Research-Statistics-Data-and-Systems/Downloadable-Public-Use-Files/BSAPUFS/Chronic_Conditions_PUF", "Data Source (CMS.gov)"))
)

# Page 2 - Vizualization -------------------------------------------
select_values_1 <- colnames(ccdata)
select_values_1 <- select_values_1[! select_values_1 %in% c('Sex', 'Age.Range')] # remove unwanted columns

sidebar_content_1 <- sidebarPanel(
  selectInput(
    "y_var",
    label = "Y Variable",
    choices = select_values_1,
    selected = "Drug.Cost"
  )
)

main_content_1 <- mainPanel(
  plotOutput("plot")
)

second_panel <- tabPanel(
  "Bar Graph",
  titlePanel("How much are costs for different age ranges and sex?"),
  p("Use the drop down menu to select a category! Each bar represents the 
    average for the indicated age range and sex."),
  sidebarLayout(
    sidebar_content_1, main_content_1
  )
)



# User Interface -----------------------------------------------------
ui <- navbarPage(
  "Chronic Conditions",
  intro_panel,
  second_panel
  #third_panel
)
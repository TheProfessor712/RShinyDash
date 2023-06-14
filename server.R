# Load libraries, data ------------------------------------------------
library(ggplot2)
library(shiny)
library(dplyr)

ccdata <- read.csv("ShinyCCData.csv")

aggdata<-ccdata %>% group_by(Age.Range, Sex) %>% 
  summarise(across(everything(),mean)) %>% as.data.frame()

# Create server -------------------------------------------------------
server <- function(input, output) {
  
    
    
    
    output$plot <- renderPlot({
    
    ggplot(data=aggdata, aes_string(x='Age.Range', y=input$y_var ,fill='Sex', shape='Sex', color='Sex')) +
      #geom_point(stat="identity", position='dodge')+
      geom_bar(stat="identity", position='dodge') +
      labs(x="Age Range", y=input$y_var) + 
      scale_x_discrete(limits=c("Under 65","65-69", "70-74", "75-79","80-84","85 and above"))
    
    #+ coord_flip() #horizontal vs vert bars
    
  })
}
library(shiny)
library(shinydashboard)

dashboardPage(
  dashboardHeader(title = "Exploring the 1973 US Arrest using R and Shiny Dashboard: ALBERTO MABJAIA",
                  titleWidth = 650,
                  tags$li(class="dropdown", tags$a(href="",icon("github"),"Profile"))),
  dashboardSidebar(
    #sidebarmenu
    sidebarMenu(
      id = "sidebar",
      
      #first menuItem
      menuItem("Dataset", tabName = "data", icon = icon("database")),
      menuItem(text = "Visualization", tabName = "viz", icon = icon("chart-lin")),
      selectInput(inputId = "var1", label = "Select de variable", choices = b, selected = "Rape"),
      menuItem(text = "Map", tabName = "map", icon = icon("map"))
    )
  ),
  dashboardBody(
    
    tabItems(
      #first tab Item
      tabItem(tabName = "data", 
              tabBox(id="t1", width =12,
                     tabPanel("About", icon = icon("address-card"), h4("Crime Analyses in US")),
                     tabPanel(title = "Data", icon = icon("address-card"), dataTableOutput("dataT")),
                     tabPanel(title = "Structure", icon = icon("address-card"), verbatimTextOutput("structure")),
                     tabPanel(title = "Summary Stats", icon = icon("address-card"), verbatimTextOutput("summary"))
                     
                     )),
      
      #second-tab item
      tabItem(tabName = "viz",
              
              tabBox(id="t2", width = 12,
                     tabPanel(title = "Crime trends by state", value = "trends", h4("Temporary text ")),
                     tabPanel(title = "Distribuition", value = "distro", plotlyOutput="histoplot"),
                     tabPanel(title = "Correlation Matrix", value = "trends", h4("Temporary text ")),
                     tabPanel(title = "Crime trends by state", value = "trends", h4("Temporary text "))
                     )
              ),
      
      #third-tab item
      
      tabItem(tabName = "map",
              box("Qualquer texto")
              
              )
    )
  )
)

#Dataset calling

library(dplyr)
library(plotly)

?USArrests

#create dataset object

data <- USArrests

#data struture 
data %>%
  str()

#Summary
data %>%
  summary()


#first few observations

data %>%
  head()

#Assigning row names to object

states = rownames(data)

data = data %>%
  mutate(State=states)
str(data)


#second menuItem Visualizatio
#creating histogram and boxplot for Distribuition tabPane

p1 = data %>%
  plot_ly() %>%
  add_histogram(get(input$var1)) %>%
  layout(xaxis = list(title = input$var1))

#Box plot
p2 = data %>%
  plot_ly() %>%
  add_boxplot(get(input$var1)) %>%
  layout(yaxis = list(showticklabes = F))

#Stacking plots
  subplot(p2,p1, nrows = 2) %>%
    hide_legend() %>%
    layout(title = "Distribuition Chart - Histogram and BoxPlot",
           yaxis = list(title="Frequency"))
  
  #choosing 
  
 b = data %>%
    select(-State) %>%
    names()
  

library(DT)
function(input, output,session){
  
  #Struture
  output$structure <- renderPrint(
    #data structure 
    data %>%
      str()
  )
  
  #summary
  output$summary <- renderPrint(
    #Summary
    data %>%
      summary()
  )
  
  #DataTable
  output$dataT <-renderDataTable(data)
  
}

#stacking histogram

output$histoplot <- renderPlotly({
  
  p1 = data %>%
    plot_ly() %>%
    add_histogram(~get(input$var1)) %>%
    layout(xaxis = list(title = input$var1))
  
  #Box plot
  p2 = data %>%
    plot_ly() %>%
    add_boxplot(~get(input$var1)) %>%
    layout(yaxis = list(showticklabes = F))
  
  #Stacking plots
  subplot(p2,p1, nrows = 2) %>%
    hide_legend() %>%
    layout(title = "Distribuition Chart - Histogram and BoxPlot",
           yaxis = list(title="Frequency"))
  
  
  
  
})


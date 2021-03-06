
#' This function draws a barplot of sales volume for three years with data
#'
#' @export
#' @param data A tibble object which has "name" & "value" columns
#' @import shiny
#' @import ggplot2
#' @import dplyr
#' @importFrom stringr str_glue
#' @examples \dontrun{
#' draw_barplot(sales)
#' }

draw_barplot <- function(data) {

  ui <- fluidPage(
    sidebarPanel(
      textInput(inputId = 'compName',
                label = 'Input Company Name',
                value = ''),
      submitButton(text = 'Submit',
                   icon = icon(name = 'submit'))
    ),
    mainPanel(uiOutput(outputId = 'mainUI'))
  )

  server <- function(input, output, session) {
    output$barplot <- renderPlot({
      df <- data[data$Company == input$compName, ]
      ggplot(mapping = aes(x = df$Year, y = df$Sales)) +
        geom_col(fill = 'gray80') +
        scale_y_continuous(expand = expansion(mult = 0.1)) +
        geom_text(mapping = aes(label = df$Sales, vjust = -1)) +
        ggtitle(label = str_glue('Sales volume of {input$compName}')) +
        theme_bw() +
        theme(text = element_text(family = 'NanumGothic'),
              plot.title = element_text(hjust = 0.5, face = 'bold'))
    })

    output$mainUI <- renderUI({
      if(input$compName == '') {
        h4('There is no plot before typing in Company Name!')
      } else {
        plotOutput(outputId = 'barplot', width = '100%')
      }
    })
  }

  shinyApp(ui = ui, server = server)
}


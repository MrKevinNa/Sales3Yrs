
draw_barplot <- function() {
  ui <- fluidPage(
    shiny::sidebarPanel(
      shiny::textInput(inputId = 'compName',
                       label = '회사명을 입력하세요.',
                       value = '삼성전자'),
      shiny::submitButton(text = '제출',
                          icon = icon(name = 'submit'))
    ),
    shiny::mainPanel(
      shiny::plotOutput(outputId = 'barplot', width = '100%')
    )
  )

  server <- function(input, output, session) {
    output$barplot <- shiny::renderPlot({
      title <- stringr::str_glue('최근 3년간 {input$compName} 매출액')
      df %>%
        dplyr::filter(Company == input$compName) %>%
        ggplot2::ggplot(mapping = ggplot2::aes(x = Year, y = Sales)) +
        ggplot2::geom_col(fill = 'gray80') +
        ggplot2::scale_y_continuous(expand = ggplot2::expansion(mult = 0.1)) +
        ggplot2::geom_text(mapping = ggplot2::aes(label = Sales, vjust = -1)) +
        ggplot2::ggtitle(label = title) +
        ggplot2::theme_bw() +
        ggplot2::theme(text = ggplot2::element_text(family = 'NanumGothic'),
                       plot.title = ggplot2::element_text(hjust = 0.5,
                                                          face = 'bold'))
    })
  }

  shiny::shinyApp(ui = ui, server = server)
}


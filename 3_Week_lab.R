rm(list=ls())
library(shiny)
#loading the data
data("iris")
#exploring the data
view(iris)
##creating vector for plots
# x <- iris$Sepal.Length
# y <- iris$Petal.Length
# z <- iris$Sepal.Width
#Creating UI and Server
#ui <- fluidPage()
#server <- function(input,output){}
#shinyApp(ui=ui,server = server)
#Exercise 1:
# ui <- fluidPage(
#   titlePanel("My first shiny app"),
#   sidebarLayout(
#     sidebarPanel(
#       textInput("myText","Enter text here:",
#                 "text here ....")
#     ),
#     mainPanel(
#       textOutput("output"))
#     )
#   )
#   server <- function(input,output){
#     output$output <- renderText({
#       paste("You entered the text:",input$myText)
#     })
#     }
#   shinyApp(ui=ui,server=server)
## Exercise_2
##Now lets create a ui with multiple inputs and outputs in a single ui
# ui <- fluidPage(
#   titlePanel("My second Shiny App!"),
#   sidebarLayout(
#     sidebarPanel(
#       textInput("myTextInput","Enter text here:"),
#       numericInput("myNumberInput",
#                    "Select a number:",
#                    value=50,min=0,max=100,step=1),
#       selectInput("mySelectInput",
#                   "Select from the dropdown:",
#                   choices = LETTERS[1:10])),
#     mainPanel(#OUTPUTS
#       h4("Using HTML in Shiny"),
#       p("This is a paragraph of text included in our panel.",
#         strong("This text will be in bold")),
#       textOutput("niceTextOutput"),
#       textOutput("niceSelectOutput"))
#     )
#   )
# server <- function(input,output){
#   output$niceTextOutput <- renderText({
#     paste("You entered text:",input$myTextInput)})
#   output$niceNumberOutput <- renderText({
#     paste("You selected the number:",input$myNumberInput)})
#   output$niceSelectOutput <- renderText({
#     paste("You selected option:",input$mySelectInput)})
# }
# shinyApp(ui=ui,server=server)
##Exercise_3
# ui <- fluidPage(
#   tags$h1("This is my App"),
#   tags$hr(),
#   tags$br(),
#   tags$p(strong("Shital Ghimire")),
#   tags$p(em("University of Canberra")),
#   tags$a(href="http://www.canberra.edu.au/","Link")
# )
# server <- function(input,output){}
# shinyApp(ui=ui,server=server)
#Exercise 4
# ui <- fluidPage(
#   numericInput(inputId = "n",
#                "Sample size",value = 25),
#   plotOutput(outputId = "hist")
#   )
# server <- function(input,output){
#   output$hist <- renderPlot({
#     hist(rnorm(input$n))
#   })
# }
# shinyApp(ui=ui,server=server)
#Exercise 5
library(rgl)
library(car)
# ui <- fluidPage(
#   rglwidgetOutput("plot",width = 800,height=600)
#   )
# server <- (function(input,output){
#   output$plot <- renderRglwidget({
#     rgl.open(useNULL=T)
#     scatter3d(x,y,z,
#               groups=iris$Species,
#               col=as.numerci(iris$Species),surface=FALSE)
#     rglwidget()
#   })
# })
# shinyApp(ui=ui, server=server)
#Exercise_6
library(rgl)
set.seed(100)
ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      sliderInput("n",label="n",
                  min=10,max=100,
                  value=10,step=10)),
    mainPanel(
      rglwidgetOutput("myplot",
                      width = 800,
                      height = 600))
    )
  )
server <- (function(input,output){
output$myPlot <- renderRglwidget({
  n <- input$n
  rgl.open(useNULL = T)
  scatter3d(rnorm(n),rnorm(n),rnorm(n))
  rglwidget()})
}
)
shinyApp(ui=ui,server=server)


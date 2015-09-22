library(shiny)
library(shinythemes)

shinyUI(fluidPage(theme = shinytheme("cerulean"),
  
  # Application title
  headerPanel("Text Predictor"),
  
  sidebarPanel(
        h3("About"),
        p("Text Predictor predicts the next word based on a user inputted text. 
          It uses a Back-off algorithm to estimate the next word."),
        br(),
        h3("Instructions"),
        p("Enter a text into the space provided. The top six possible 
          words that can follow your text will be displayed below the text box. 
          The first button displays the highest ranking prediction and 
          subsequent words follow in order of rank." ),
        p("The app allows users to auto fill. You may click on any of the predicted 
          words to enter text without typing.")
  
  ),
  mainPanel(
         #textInput("textIn", "Input your text here",""),
    tags$div(style="background-color: #f5f5f5;border:#e3e3e3 1px solid;border-radius: 5px;padding:10px;height:33%; box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.05);",
         h4("Type here..."),
         tags$textarea(id="textIn", "",style="width:310px;height:80px;-moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;border:#DBDBDB 1px solid; max-width: 310px; 
    max-height: 180px;display: inline-block;"),
         tags$style(type='text/css', "#textIn:focus { color: #000;
                    outline:none;
                    width: 310px;
                    border:#35a5e5 1px solid;
                    -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;
                    box-shadow: 0 0 5px rgba(81, 203, 238, 1);
                    -webkit-box-shadow: 0 0 7px rgba(81, 203, 238, 1);
                    -moz-box-shadow: 0 0 7px rgba(81, 203, 238, 1); }"
                    ),
         #actionButton(inputId="Clear", label="Clear",style="position:relative;top:-42px;"),
         #tags$style(type="text/css", "#Clear {height: 45px}; "),
         br(),
         actionButton(inputId="Clear", label="Clear"),
         br(),br(),
         h4("Predicted Words"),
         div(id="Word1",uiOutput("firstWord")),
         tags$head(tags$style(type="text/css", "#Word1 {display: inline-block}")),
         div(id="Word2",uiOutput("secondWord")),
         tags$head(tags$style(type="text/css", "#Word2 {display: inline-block}")),
         div(id="Word3",uiOutput("thirdWord")),
         tags$head(tags$style(type="text/css", "#Word3 {display: inline-block}")),
         div(id="Word4",uiOutput("fourthWord")),
         tags$head(tags$style(type="text/css", "#Word4 {display: inline-block}")),
         div(id="Word5",uiOutput("fifthWord")),
         tags$head(tags$style(type="text/css", "#Word5 {display: inline-block}")),
         div(id="Word6",uiOutput("sixthWord")),
         tags$head(tags$style(type="text/css", "#Word6 {display: inline-block}")),
         br(),br(),
         h4("Your Text"),
         strong(textOutput("text1")),
         br(),
         h4("Most likely next word predicted"),
         strong(textOutput("nextword"))
         ),
         tags$script(HTML("
            Shiny.addCustomMessageHandler('cursorEnd', function(message) {
            var input = $('#textIn');
            input[0].selectionStart = input[0].selectionEnd = input.val().length;
            input.focus()
        });
      "))
#  fluidRow(
#    column(12,
#           textOutput("out"))
#  ),
  
#  fluidRow(
#  column(4,
#         textOutput("firstWord")),
#  column(4,
#         textOutput("secondWord")),
#  column(4,
#         textOutput("thirdWord"))
#  ),

  )
))
  
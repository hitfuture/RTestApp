#` Launch the application
#`@export

launch_application <- function( ...)
{
  shiny::runApp(appDir = system.file("App", package = "RIntelligenceApp"),...
                )
}

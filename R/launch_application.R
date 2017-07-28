#' Launch the application
#' @param ... arguments to the shiny::runApp(...)
#' @export

launch_application <- function( ...)
{
  shiny::runApp(appDir = system.file("App", package = "RTestApp"),...
                )
}

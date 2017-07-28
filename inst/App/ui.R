library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  dateRangeInput("daterange1", "Date range:",
                 start = "2001-01-01",
                 end   = "2010-12-31"),

  textInput("myresults", "Results will be printed here", ""),
  textOutput("dateselected"),#Rendering Reactively
  textOutput("selecteddate"),#Not Rendering Reactively Populated only on appLoad
  textOutput("enddateselected"),#Not Rendering Reactively
  fluidRow(column(8,align = "center",tags$div(id = "reportrange",class = "pull-right",style = "background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc; width: 100%",icon("calendar"),textInput(inputId = "sdrangepicker",placeholder = "startdate",label = ""),tags$input(class = "input-sm form-control", type = "text",placeholder = "End Date",id = "enddate"),tags$b(class = "caret")))),
  tags$head(HTML(
    "<script>
    $(function() {

    var start = '2017-05-26';
    var end = '2017-06-26';

    function cb(start, end) {

    var months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
    var start = new Date(start);
    var end = new Date(end);
    s_month = start.getMonth();
    s_day = start.getDate();
    s_year = start.getFullYear();
    e_month = end.getMonth();
    e_day = end.getDate();
    e_year = end.getFullYear();
    //$('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
    $('#sdrangepicker').val(months[s_month] + ' ' + s_day + ',' +  s_year);
    $('#enddate').val(months[e_month] + ' ' + e_day + ',' +e_year);
    }

    $('#reportrange').daterangepicker({
    locale: {
    format: 'YYYY-MM-DD'
    },
    startDate: start,
    endDate: end,
    ranges: {
    'Today': [moment(), moment()],
    'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
    'Last 7 Days': [moment().subtract(6, 'days'), moment()],
    'Last 30 Days': [moment().subtract(29, 'days'), moment()],
    'This Month': [moment().startOf('month'), moment().endOf('month')],
    'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
    }
    }, cb);
    $('#reportrange').on('apply.daterangepicker', function(ev, picker){
    debugger
    alert(picker.startDate.format('YYYY-MM-DD') + picker.startDate.format('YYYY-MM-DD'));
    });

    cb(start, end);

    });
    </script>"
  ),
  tags$script(src = "//cdn.jsdelivr.net/jquery/1/jquery.min.js"),
  tags$script(src = "moment.min.js"),
  tags$link(rel = "stylesheet",href = "//cdn.jsdelivr.net/bootstrap/3/css/bootstrap.css"),
  tags$script(src = "//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"),
  tags$link(rel = "stylesheet",type = "text/css",href = "//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css")  )
))

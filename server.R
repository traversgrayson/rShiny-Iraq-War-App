# =========================
### Travers Parsons-Grayson
### Interactive Graph
### MATH 301: Spring 2019
# =========================

# -------------------------
# File for back-end server functions
# -------------------------

server <-  function(input,output,session) {
  
  # Save Inputs
  # ==================
  # =========================
   
  # Category
  catValue <- reactive({
   input$cat
  })
  
  # Years
  yearValues <- reactive({
    years = input$years
    first = years[1]
    second = years[2]
    c(first:second)
    
  })
  
  # Target
  targetValue <- reactive({
    input$attack
  })
  
  # Number Deaths
  deathValue <- reactive({
    input$mortality
  })
  

  # Build Interactive Map
  # ========================
  output$iraqMap <- renderLeaflet({
  
  # Convert inputs to usable values
  # ==============================
    
   # Target
   # ============
   if (targetValue() == 'All') 
    {myTarget = target}
   else 
     {myTarget = c(targetValue())}
   
   # Category 
   # ============
   myCat= switch(
      catValue(),
      'All' = tolower(iraq_stats$Category),
      'None' = c(),
      c(catValue())
    )
   
  # Build Reduced Dataset
  # =====================
    x <- iraq_stats %>% filter(year %in% yearValues(),
                               tolower(Category) %in% myCat,
                               `Attack on` %in% myTarget,
                               totalDeaths >= deathValue())
  # Map the data
  # =============
    m <- x %>% 
      leaflet(options = leafletOptions(preferCanvas = TRUE)) %>% 
      addProviderTiles(providers$Stamen.Terrain,options = providerTileOptions(  # map won't update tiles until zoom is done
        updateWhenIdle = TRUE)) %>% 
      addAwesomeMarkers(popup = ~popup_info,icon = ~icons,clusterOptions = markerClusterOptions())
  })  
  
  
  
  
 
}


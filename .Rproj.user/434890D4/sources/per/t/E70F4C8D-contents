# =========================
### Travers Parsons-Grayson
### Interactive Graph
### MATH 301: Spring 2019
# =========================

# --------------------------
# File for front-end display
# --------------------------

ui <- fluidPage(
  
  theme = shinytheme("journal"),
  
  # Add a Title
  titlePanel("Deaths During the Iraq War"),
  
  # Create side-navigation panel
  navlistPanel("Iraq War Visualizations",widths = c(2,10),
    
    # Page for background info    
    # ===========================
    tabPanel("Background",mainPanel(width = 6,
                                    h1("Overview"),
                                    p("There is no universal consensus on how many deaths occurred during the Iraq War.
                                      However, the US Military dataset that was uncovered during the Iraq War Documents 
                                      Leak provides us with a lower bound at the very least. "),
                                    p("My original goal with my data was to examine differences between deaths reported by 
                                      the media and the US Military. However due to data limitations this was not possible. 
                                      Working with the data available I sought to examine how different groups of people died 
                                      during the Iraq War. Dividing the data in this way provides some insight into how 
                                      different people experienced and were affected by the war. In the US Military dataset 
                                      deaths are divided into four categories: civilian, coalition (NATO) forces, enemy , 
                                      and Iraqi forces. What were the main causes of death for each one of these 
                                      respective parties?"),
                                    p("When looking at causes of death during the Iraq War it is important to remember that
                                      there were people dying in Iraq before the Iraq War. If one wishes to make inference 
                                      about the number of deaths caused by the Iraq War, then the data given must be compared
                                      to data on deaths in Iraq before the War. Unfortunately, such data is not readily available 
                                      and the best we can do is make educated guesses about what that data looks like."),
                                    p("With that limitation in mind, there are a few things we can say about our data. First note
                                      that each graph is not on a common scale. Civilian deaths were so much higher than the other
                                      three groups that putting all groups on a common scale negatively affects the visualization. 
                                      Further we are more concerned with the distribution of deaths than the magnitude. Among all 
                                      groups, IED explosions were a major cause of death. Civilians died of murder at a much higher 
                                      rate than any other group. The primary cause of death among Coalition forces was IED explosions,
                                      with accidents and direct fire as distant runner-ups. Among enemies and Iraqi forces, direct 
                                      fire killed a large amount of people. For enemies direct fire accounted for the majority of 
                                      deaths. Though many Iraqi forces were killed by direct fire, IED explosions were the major 
                                      cause of death.")
    )
             
             ),
    
    # Panel for Interactive Map
    # ==========================
    tabPanel ("Interactive Map", 
    sidebarLayout(
      
      sidebarPanel("Settings",
        
        # Year Slider
        sliderInput("years", "Years: ",
                    min = 2004,max = 2009,
                    value = c(2004,2009)),
        
        # Category Selection
        selectInput('cat',"Type of Event: ",
                    toppy,selected = 'All'),
        
        # Num Deaths Selection
        sliderInput('mortality',"Number of Deaths (at least): ",
                    min = 0,max = 450,value = 0),
        
        # Target Selection
        selectInput('attack',"Target of Attack: ",
                    c("Neutral" = "NEUTRAL",
                      "Enemy" = "ENEMY",
                      "Friend" = "FRIEND",
                      'All'),selected = "All")
      ),
      
      # Output the actual map
      mainPanel("Deaths in Iraq During Iraq War",
        leafletOutput("iraqMap",height= 1000)
      )
    )
    ),
    
    
    # Pages for static graphs
    # ========================
    
    tabPanel("Deaths By Affiliation",
                       img(src='type.png',height= "75%", width="75%")),
    
    tabPanel("Deaths By Year and Type",
             img(src='byYear.png',height= "75%", width="75%")),
    
    tabPanel("Incidents By Year and Type",
             img(src='typeByYear.png',height= "75%", width="75%")),
    
    tabPanel("Deaths By Year",
             img(src='type.png',height= "75%", width="75%")),
    
    tabPanel("Deaths By Category",
             img(src='sidebyside.png',height= "75%", width="75%")),
    
    tabPanel("Distribution by Affiliation",
             img(src='color.png',height= "75%", width="75%"))
    
            )
    
  )
  
  
  



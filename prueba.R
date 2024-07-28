library(tidyverse)
library(ggplot2)
sum(2+2)
library(MASS)
#Prueba prueba
library(dplyr)
#que andas cabeza
library(readr)
#1 Importamos Población.csv
poblacion <- read_csv("poblacion.csv")

#2 Filtramos por Haití
Haiti_poblacion <- poblacion %>% 
  filter(Location == "Haiti")

#3 Total de población por año en Haiti
pob_tot_Haiti <- Haiti_poblacion %>%
  group_by(Year) %>%
  summarise(Pob_Total = sum(Poblacion))

#3.1 Gráfico de líneas de población de Haití
lineas_Haiti <- ggplot(data = pob_tot_Haiti, aes(x = Year, y = Pob_Total)) +
  geom_line(color = "red") +            
  labs(title = "Población Total Haití 1950 - 2021",
       x = "Año",
       y = "Población Total") +     
  scale_x_continuous(breaks = seq(1950, 2021, by = 10)) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5),
    plot.background = element_rect(fill = "white", color = NA)
  )  
ggplotly(lineas_Haiti)

<img src="https://github.com/tn64/happy_places/blob/main/Resources/earth_from_space.png"></br>

<img src="https://github.com/tn64/happy_places/blob/main/Resources/earth_from_space.png"></br>

# Happy Places

## Project Goal
What factors lead to the greatest happiness among nations? For this project, we used data from Multiple sources listed below for the year 2019 to determine which factors are most highly correlated to happiness and, because nations have different scores related to these factors, whether or not it is possible to predict which nations will experience the most happiness.

The happiness score is taken from Gallup World Survey and is treated as the target of the machine learning model(s).

The predictors selected are:
- GDP per capita: GDP per capita is in terms of Purchasing Power Parity (PPP) adjusted to constant 2011 international dollars, taken from the World Development Indicators (WDI) released by the World Bank.

- Social support: Social support is the national average of the binary responses (0=no, 1=yes) to the Gallup World Poll (GWP) question, “If you were in trouble, do you have relatives or friends you can count on to help you whenever you need them, or not?”

- life expectancy: The time series of healthy life expectancy at birth are constructed based on data from the World Health Organization (WHO) Global Health Observatory data 
repository.

- freedom: Freedom to make life choices is the national average of binary responses to the GWP question, “Are you satisfied or dissatisfied with your freedom to choose what you do with your life?”


- Generosity: Generosity is the residual of regressing the national average of GWP responses to the question, “Have you donated money to a charity in the past month?” on GDP per capita. 


- Preception of corruption: Perceptions of corruption are the average of binary answers to two GWP questions: “Is corruption widespread throughout the government or not?” and “Is corruption widespread within businesses or not?” Where data for government corruption are missing, the perception of business corruption is used as the overall corruption-perception measure. 



## Question We Want to Answer
We want to determine the answer to the following questions:
- Which individual factors are most highly correlated to happiness?
- Is it possible to predict which countries will experience the greatest happiness based on the factors in the dataset?

## Source Data
Description of the source data

## Communication Protocols

Throughout this project, we will use the following for group communication
- Slack and Zoom: for messaging and meeting during class sessions
- Coda: for scheduling, polling, and progress tracking
- Discord: for screen sharing and voice calls outside of class sessions

## Team Responsibilties
Salih Mohammed - Database</br>
Jose Guerra - Database</br>
Henry Wang - Presentation</br>
Italia Cardenas - Machine Learning Model</br>
Tom Norris - Github, Machine Learning Model</br>

## First Steps

## Exploratory Data Analysis
Description of the data exploration phase of the project

## The Database
The Database was created Using `PostgresSQL` (PostgreSQL 11.11, compiled by Visual C++ build 1914, 64-bit). It consists of two tables:

-Countries
  ```
  country_code
  country (country name)
  
  ```
-whr_2019
  ```
  country
  happiness rank
  happiness score
  GDP
  family
  life expectancy
  freedom
  generosity
  trust
  lat
  LNG
  
  ```
The latitude and longitude are added solely for visualization and will not be included in the early stages of the analysis. The tables in this database have been exported to a CSV file and will be used for our machine learning module. The data file was not huge or confidential therefore we opted not to use cloud resources. 


## Data Analysis and Machine Learning
Description of the analysis phase of the project

## Project Dashboard

## Conclusions 

## Resources

Editors: John Helliwell, Richard Layard, Jeffrey D. Sachs, and Jan Emmanuel De Neve, Co-Editors; Lara Aknin, Haifang Huang and Shun Wang, Associate Editors; and Sharon Paculor, Production Editor

Citation:
Helliwell, John F., Richard Layard, Jeffrey Sachs, and Jan-Emmanuel De Neve, eds. 2020. World Happiness Report 2020. New York: Sustainable Development Solutions Network

https://www.kaggle.com/paultimothymooney/latitude-and-longitude-for-every-country-and-state
https://www.kaggle.com/mathurinache/world-happiness-report


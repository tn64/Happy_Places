
<img src="https://github.com/tn64/happy_places/blob/main/Resources/earth_from_space.png"></br>

# Happy Places

## Project Goal
We are the country that created the happiest place on Earth, but how happy are we as a nation?
Through machine learning, we’d like to explore how each of the factors impact the overall learning process. Also, how would each ML methodological approach take different effects on overall learning scheme. In doing so, we’d may find what US needs to improve overall happiness rank. This may be particularly interesting to those who are seeking public office during future elections. 

![HappyQuote](https://user-images.githubusercontent.com/80020446/127728745-da57e01a-a8c9-4420-b212-21c08e1d2f01.png)

The happiness score (`HappinessScore`) is taken from Gallup World Survey and is treated as the target of the machine learning model(s).

 In search of becoming one of the happiest countries in the world, we are exploring the following key factors:

- GDP per capita (`gdp`): GDP per capita is in terms of Purchasing Power Parity (PPP) adjusted to constant 2011 international dollars, taken from the World Development Indicators (WDI) released by the World Bank.

- Social support (`family`): Social support is the national average of the binary responses (0=no, 1=yes) to the Gallup World Poll (GWP) question, “If you were in trouble, do you have relatives or friends you can count on to help you whenever you need them, or not?”

- life expectancy (`life_expectancy`): The time series of healthy life expectancy at birth are constructed based on data from the World Health Organization (WHO) Global Health Observatory data 
repository.

- `freedom`: Freedom to make life choices is the national average of binary responses to the GWP question, “Are you satisfied or dissatisfied with your freedom to choose what you do with your life?”


- `Generosity`: Generosity is the residual of regressing the national average of GWP responses to the question, “Have you donated money to a charity in the past month?” on GDP per capita. 


- Preception of corruption (`trust`): Perceptions of corruption are the average of binary answers to two GWP questions: “Is corruption widespread throughout the government or not?” and “Is corruption widespread within businesses or not?” Where data for government corruption are missing, the perception of business corruption is used as the overall corruption-perception measure. 

- alcohol consumption (`alochol_LiPerYear`): This data is from the Global Health Observatory (GHO). The GHO data repository is WHO's gateway to health-related statistics for its 194 Member States

The latitude `(lat)` and longitude `(lng)` are added solely for visualization and will not be included in the early stages of the analysis.


## Questions We Want to Answer
We want to explore the following questions:
- Which individual factors are most highly correlated to happiness?
- Is it possible to predict which countries will experience the greatest happiness based on the factors in the dataset?
- How can US improve overall happiness?
- How does CCI (Consumer Confidence Index) and CPI (Consumer Price Index) play a part in predicting overall happiness?
- Does legalization of cannibis impact happiness?

## Source Data
- https://data.oecd.org/leadind/consumer-confidence-index-cci.htm
- https://www.bls.gov/cpi/
- https://www.kaggle.com/mathurinache/world-happiness-report
- https://www.who.int/data/gho/data/indicators/indicator-details/GHO/alcohol-recorded-per-capita-(15-)-consumption-(in-litres-of-pure-alcohol)

## Communication Protocols

Throughout this project we will use the following for group communication
- Slack and Zoom: for messaging and meeting during class sessions
- Coda: for scheduling, polling, and progress tracking
- Discord: for screen sharing and voice calls outside of class sessions

## Team Responsibilties
Part I

Salih Mohammed - Database</br>
Jose Guerra - Database</br>
Henry Wang - Presentation</br>
Italia Cardenas - Machine Learning Model</br>
Tom Norris - Github, Machine Learning Model</br>

Part II

Salih Mohammed - Database</br>
Jose Guerra - Database</br>
Henry Wang - Presentation</br>
Italia Cardenas - Machine Learning Model</br>
Tom Norris - Github, Machine Learning Model</br>

## First Steps

Due to prescence of the pandemic, we have decided to throw out year 2020 and the present year 2021. 
- Cleaned Wolrd Happiness Report Data from 2015 to 2019;
- Looked and removed null values;
- Cleaned CCI, CPI and alcohol databases;
- Loaded additional factor data into database; alcohol loaded in ERD as trial;

## Exploratory Data Analysis
Based on the World Happiness Report, the GDP, Family, Life expentancy and freedom seem to directly impact overall happiness of a country while trust and generosity do not. 
Money is the root of all evil, but without money, it's difficult to accomplish much. The way money impacts happiness is expressed in terms of GDP. 
Here we run into the problem of US having higher GDP than the world's happiness countries, but rank much lower on happiness score. 

## The Database
![Results](database_diagram.PNG)

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
  lng
  alcohol_cons
  
  ```

- Our Database is hosted by aws
- we formed the connection string with our Machine learning module using `Pgadmin` and The `sqlalchemy` Library.

## Data Analysis and Machine Learning
Based on the World Happiness Report, the GDP, Family, Life expentancy and freedom seem to directly impact overall happiness of a country while trust and generosity do not. The money is the root of all evil, but without money, it's difficult to accomplish much. The way money impacts happiness is expressed in terms of GDP. Here we run into the problem of US having higher GDP than the world's happiness countries, but rank much lower on happiness score. 
During the ML process, the Linear Regression model shows alcohol consumption may impact happiness only to certain level. 

![lr_alcohol_happiness](https://user-images.githubusercontent.com/80020446/128659360-0cc0197c-4a2a-4827-a4f3-c5b200b19634.png)

Between 10 to 20 liters per year seems to have most clustering with happiness on the Y axis. We will continue to explore other combinations and discover more underlying trends. 
## Project Dashboard
See Google Slide
https://docs.google.com/presentation/d/1KHBlzdOCCLyFK2nmcLZyR1_vxCX9v-C6a4RVpKL31c0/edit?usp=sharing

## Resources

Editors: John Helliwell, Richard Layard, Jeffrey D. Sachs, and Jan Emmanuel De Neve, Co-Editors; Lara Aknin, Haifang Huang and Shun Wang, Associate Editors; and Sharon Paculor, Production Editor

https://www.kaggle.com/paultimothymooney/latitude-and-longitude-for-every-country-and-state
https://www.kaggle.com/mathurinache/world-happiness-report
https://worldpopulationreview.com/country-rankings/alcohol-consumption-by-country

Citation:
Helliwell, John F., Richard Layard, Jeffrey Sachs, and Jan-Emmanuel De Neve, eds. 2020. World Happiness Report 2020. New York: Sustainable Development Solutions Network



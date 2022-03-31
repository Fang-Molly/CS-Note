Data Science for Everyone
==========================

# 1. Introduction to Data Science

## 1.1 What is data science?

* **What can data do?**

	* Describe the current state of an organization or process
    * Detect anomalous events
    * Diagnose the causes of events and behaviors
    * Predict future events
	
* **The data science workflow**

    * Data collection and storage
    * Data preparation
    * Exploration and visualization
    * Experimentation and prediction

## 1.2 Applications of data science

* **Traditional machine learning**

    * Fraud detection

* **Internet of Things (IoT)**

    * Refers to gadgets that aren't standard computers 
    * Smart watches； Internet-connected home security systems； Electronic toll collection systems； Building energy management systems

* **Deep Learning**

    * Many neurons work together
    * Requires much more training data
    * Used in complex problems
        * Image classification
        * Language learning / understanding

## 1.3 Data science roles and tools

* Data Engineer
    * Control the flow of information
        * Information architects
   	  	* Build data pipelines and storage solutions
   	  	* Maintain data access
    * Tools
        * SQL
            * Store and organize large quantities of data
        * Java, Scala, or Python
            * Programming languages for processing data and automating tasks
        * Shell
            * Command line to automate and run tasks

* Data Analyst
    * Data Preparation
        * Perform simpler analyses that describe data
            * Creating reports and dashboards to summarize data
            * Clean data for analysis
    	  * Tools
            * Spreadsheets(Excel or Google Sheets)
          	    * Simple storage and analysis
          	* SQL
          		  * Retrive and aggregate data
      	    * BI Tools (Tableau, Power BI, Looker)
                * Dashboarding and sharing information
            * May have: Python or R
                * Clean and analyze data
							
* Data Scientist
    * Exploration and Visualization
        * Versed in statistical methods
			  * Run experiments and analyses for insights
				* Traditional machine learning
    * Tools
        * SQL
            * Retrive and aggregate data
        * Python and/or R
            * Data science libraries, e.g., `pandas` (Python) and `tidyverse` (R)

* Machine Learning Scientist
    * Model and predict with data
        * Predictions and extrapolations
        * Classification
        * Deep learning
            * Image processing
        		* Natural language processing
    * Tools
        * Python and/or R
            * Machine learning libraries, e.g., TensorFlow or Spark

# 2. Data Collection and Storage

## 2.1 Data sources

* Company data   
	* Collected by companies
	* Helps them make data-driven decisions
	* Web events
		* Events - Timestamps - User information
	* Survey data
		 * Asking people for their opinions
		 * Methods:
		     * Face-to-face interview
		     * Online questionnaire
	* Customer data
	* Logistics data
	* Financial transactions
* Open data
    * Free, open data sources
    * Can be used, shared, and built-on by anyone
    * Public data APIs
        * Application Programming Interface
        * Request data over the internet
    * Public records
        * International organizations
            * e.g.: World Bank, UN, WTO
        * National statistical offices
            * e.g.: censuses, surveys
        * Government agencies
            * e.g.: weather, environment, population

## 2.2 Data types

* Why care about data types?
	* Important later on when:
		* Storing the data
		* Visualizing/analyzing the data
		
* Quantitative vs qualitative data
	* Quantitative data
		* Deals with numbers
		* Data can be measured
	* Qualitative data
		* Deals with descriptions
		* Data can be observed but not measured

* Other data types
	* Image data
	* Text data
	* Geospatial data
	* Network data
	* ...

## 2.3 Data storage and retrieval

* Things to consider when storing data
	* Location
		* Parallel storage solutions: cluter or server
		* The cloud
	* Data type
		* Unstructured: Document Database
			* Email, text, video and audio files, web pages, social media
		* Tabular: Relational Database
	* Retrieval: Data querying
		*  Document database: NoSQL
		*  Relational database: SQL(Structured Query Language)

## 2.4 Data Pipelines

* What is a data pipeline
	* Moves data into defined stages
	* Automated collection and storage
		* Scheduled hourly, daily, weekly, etc
		* Triggered by an event
    * Monitored with generated alerts
    * Necessary for big data projects
    * Data engineers work to customize solutions
    * Extract Transform Load (ETL) 

# 3. Preparation, Exploration, and Visualization

## 3.1 Data preparation

* **Why prepare data?**
	* Real-life data is messy  
	* Preparation is done to prevent:  
		* errors  
		* incorrect results  
		* biasing algorithms  
		
* **Cleaning data**
	* Tidy data
	* Remove duplicates
	* Assign a unique ID
	* Homogeneity
	* Data types
	* Missing values
		* reasons:
			* data entry
			* error
			* valid missing value
		* solutions:
			* impute
			* drop
			* keep
		
## 3.2 Exploratory Data Analysis

* **What is Exploratory Data Analysis (EDA)?**

	* Promoted by John Tukev, a respected statistician
	* Consist in:
		* Exploring the data
		* Formulating hypotheses
		* Assessing characteristics
		* Visualizing

## 3.3 Visualization

* Use color purposefully
* Colorblindness
	* Red and green is the most common (but not the only one)
	* Information and simulators online
	* Existing color palettes accessible to everyone
* Readable fonts
	* sans-serif
* Label
	* title
	* x axis label
	* y axis label
	* legend
* Axes

* Dashboard
	* group all the relevant information in one place to make it easier to gather insights and act on them

* Business Intelligence (BI) tools
	* Let you clean, explore, visualize data and build dashboards, without requiring any programming knowledge
	* Tableau, Looker, Power BI

# 4. Experimentation and Prediction

## 4.1 A/B Testing

* **What are experiments in data science?**
	* Form a question
	* Form a hypothesis
	* Collect data
	* Test the hypothesis with a statistical test
	* Interpret results

* **What is A/B Testing?**

	* AKA Champion/Challenger Testing, it's used to make a choice between two options

* **A/B Testing Steps**

	* Picking a metric to track
	* Calculating sample size
	* Running the experiment
	* Checking for significance

## 4.2 Time series forecasting

* **Modeling in data science - What is a statistical model?**

	* represent a real-world process with statistics
	* mathematical relationships between variables, including random variables
	* based on statistical assumptions and historical data
 
* **Predictive modeling**

	* enter new inputs and model predicts an outcome
		* probability of an outcome
	* Ranges in complexity, from a linear equation to a deep learning algorithm

* **Time series data**

* a series of data points sequenced by time. 
* Examples: 
	* stock prices 
	* gas prices 
	* unemployment rates
	* heart rate
	* CO2 levels
	* height of tides

* **Seasonality in time series**
Often times when plotting time series, you can find patterns. For example, this plot graphs the average temperature in Boston over three years. Can you figure out the pattern here?

* **Forecasting time series**


## 4.3 Supervised machine learning



## 4.4 Clustering




    





















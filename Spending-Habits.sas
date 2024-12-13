/* Step 1: Load the dataset and define variable names */
DATA spending;
/* Specify the location of the dataset */
INFILE '\\apporto.com\dfs\CLT\Users\enguye16_clt\Desktop\STAT2223_SAS\spending.txt'
DELIMITER='09'x /* Tab-delimited file */
DSD /* Allow missing values */
FIRSTOBS=2; /* Skip the first row (header) */
/* Define variable names */
INPUT Age18_24 Age25_31 Age32_38 Age39_45 Age45PLUS Gender Employment Eating_Out
Hobbies Leisure_Activities Shopping Subscriptions Technology Travel Income Budget Spending;
RUN;

/* Step 2: Print the first 50 observations to ensure the dataset looks correct */
PROC PRINT DATA=spending (OBS=50);
/* Print only the first 50 observations for review */
RUN;

/* Step 3: Perform regression analysis with all predictors */
PROC REG DATA=spending;
/* Specify the dependent variable (Spending) and all potential predictors */
MODEL Spending = Age18_24 Age25_31 Age32_38 Age39_45 Age45PLUS Gender Employment Eating_Out
Hobbies Leisure_Activities Shopping Subscriptions Technology Travel Income Budget;
RUN;

/* Step 4: Conduct stepwise regression to identify significant predictors */
PROC REG DATA=spending;
/* Use stepwise selection to add/remove variables based on significance levels */
MODEL Spending = Age18_24 Age25_31 Age32_38 Age39_45 Age45PLUS Gender Employment Eating_Out
Hobbies Leisure_Activities Shopping Subscriptions Technology Travel Income Budget / SELECTION=STEPWISE; /* Stepwise regression selection */
RUN;

/* Step 5: Run regression with only significant predictors */
PROC REG DATA=spending;
/* Include only predictors found significant in the stepwise selection process */
MODEL Spending = Age18_24 Hobbies;
RUN;
PROC REG DATA=spending;
/* Specify the dependent variable (Spending) and all potential predictors */
MODEL Spending = Age18_24 Age25_31 Age32_38 Age39_45 Gender Employment Income;
RUN;

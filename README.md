Twitter Data Cleaning
Simple Twitter Data Cleaning and Analysis Using Python in Google Colab and PostgreSQL
This repository contains scripts and instructions for cleaning and analyzing a dataset of Twitter data. The project involves data preprocessing using Python in Google Colab, importing the cleaned data into a PostgreSQL database, and executing SQL queries to generate insights.

To Simply Run This Project:
Step 1: Clone the Repository
sh
Download
Copy code
git clone https://github.com/your-username/TwitterCleaningData.git
Step 2: Install Dependencies
Ensure you have Python and PostgreSQL installed on your system.

Step 3: Clean the Data Using Google Colab
Open Google Colab and upload your correct_twitter_201904.tsv file.
Run the clean_twitter_data.py script in Google Colab to clean the data.
python
Download
Copy code
# Upload file if not already done
uploaded = files.upload()

# Rest of your cleaning script...
Step 4: Download Cleaned Data
Download the cleaned trimmed_twitter_201904.csv file from Google Colab.
Step 5: Create Database and Table
Run the SQL script to create the table:

sql
Download
Copy code
psql -d twitter_data -f sql/create_table.sql
Step 6: Load Data into Database
Load the cleaned data into PostgreSQL:

sql
Download
Copy code
psql -d twitter_data -c "COPY tweets (id, event, ts1, from_stream, directly_from_stream, from_search, directly_from_search, from_quote_search, directly_from_quote_search, from_convo_search, directly_from_convo_search, from_timeline_search, directly_from_timeline_search, text, author_id, created_at, like_count, place_id) FROM 'path/to/trimmed_twitter_201904.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',');"
Step 7: Execute Queries
Run queries using either SQL directly or through Python scripts:

python
Download
Copy code
python scripts/query_tweets.py 'music'# TwitterDataCleaning


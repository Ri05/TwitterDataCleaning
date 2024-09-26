import csv
from google.colab import files
uploaded = files.upload()

input_file = 'correct_twitter_201904.tsv'
output_file = 'trimmed_twitter_201904.csv'

necessary_columns = [
    'id',
    'event',
    'ts1',
    'ts2',
    'from_stream',
    'directly_from_stream',
    'from_search',
    'directly_from_search',
    'from_quote_search',
    'directly_from_quote_search',
    'from_convo_search',
    'directly_from_convo_search',
    'from_timeline_search',
    'directly_from_timeline_search',
    'text',  
    'author_id',  
    'created_at', 
    'like_count', 
    'place_id'   
]

with open(input_file, 'r', newline='') as input_tsv, open(output_file, 'w', newline='') as output_csv:
    reader = csv.reader(input_tsv, delimiter='\t')
    writer = csv.writer(output_csv, delimiter=',')
  
    header_row = next(reader)
  
    necessary_column_indices = [header_row.index(column) for column in necessary_columns]
  
    writer.writerow([header_row[index] for index in necessary_column_indices])

    for row in reader:
        trimmed_row = [row[index] for index in necessary_column_indices]
        writer.writerow(trimmed_row)

print("Trimming complete")

files.download(output_file)

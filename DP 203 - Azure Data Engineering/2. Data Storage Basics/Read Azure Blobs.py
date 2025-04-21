import pandas as pd

url = "https://testingtiku1.blob.core.windows.net/data/ActivityLog-01.csv"
df = pd.read_csv(url)

print(df)
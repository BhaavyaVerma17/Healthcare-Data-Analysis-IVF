
# IVF Project - EDA & Data Cleaning 1


import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

# 1. Load Data
file_path = (r"C:\Users\Administrator\Downloads\Reports and Dashboard\Data\Reports and Dashboards Data1.xlsx")
df = pd.read_excel(file_path)

# 2. Basic Exploration
print("Shape of data:", df.shape)
print("\nColumn Names:\n", df.columns)
print("\nData Info:")
print(df.info())

# 3. Statistical Summary
print("\nStatistical Summary:")
print(df.describe(include='all'))

# 4. Missing Values Check
print("\nMissing Values per column:")
print(df.isnull().sum())

# 5. Duplicate Records
print("\nDuplicate rows:", df.duplicated().sum())

# 6. Data Cleaning
num_cols = df.select_dtypes(include=['int64','float64']).columns
cat_cols = df.select_dtypes(include=['object']).columns

for col in num_cols:
    df[col] = df[col].fillna(df[col].median())

for col in cat_cols:
    df[col] = df[col].fillna(df[col].mode()[0])

# 7. Post Cleaning Check
print("\nMissing values after cleaning:")
print(df.isnull().sum())

# 8. Save Cleaned Data

df.to_excel(r"C:\Users\Administrator\Downloads\Reports and Dashboard\Data\Reports_and_Dashboards_Data1_Cleaned.xlsx", index=False)

print("\nEDA and Data Cleaning Completed Successfully")

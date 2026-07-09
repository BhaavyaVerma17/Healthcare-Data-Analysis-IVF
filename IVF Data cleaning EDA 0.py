
# IVF Fertility Project
# EDA + Data Cleaning Script
# Dataset: Reports and Dashboards Data.xlsx

import pandas as pd
import numpy as np

# 1. Load Dataset
file_path = (r"C:\Users\Administrator\Downloads\Reports and Dashboard\Data\Reports and Dashboards Data.xlsx")  
df = pd.read_excel(file_path)

# 2. Basic Exploration
print("First 5 rows")
print(df.head())

print("\nShape of dataset:", df.shape)

print("\nColumn names")
print(df.columns.tolist())

print("\nDataset Info")
print(df.info())

# 3. Statistical Summary
print("\nStatistical Summary")
print(df.describe(include='all'))

# 4. Missing Values
print("\nMissing Values Count")
print(df.isnull().sum())

# 5. Duplicate Rows
print("\nDuplicate Rows:", df.duplicated().sum())

# 6. Data Cleaning

# Numerical columns -> fill with median
num_cols = df.select_dtypes(include=['int64', 'float64']).columns
for col in num_cols:
    df[col] = df[col].fillna(df[col].median())

# Categorical columns -> fill with mode
cat_cols = df.select_dtypes(include=['object']).columns
for col in cat_cols:
    if not df[col].mode().empty:
        df[col] = df[col].fillna(df[col].mode()[0])

# 7. Post-cleaning check
print("\nMissing Values After Cleaning")
print(df.isnull().sum())

print("\nFinal Dataset Info")
print(df.info())

# 8. Save cleaned data
df.to_excel(r"C:\Users\Administrator\Downloads\Reports and Dashboard\Data\Reports and Dashboards Data.xlsx", index=False)

print("\nEDA and Data Cleaning Completed")

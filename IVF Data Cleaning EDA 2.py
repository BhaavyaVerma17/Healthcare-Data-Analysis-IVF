# IVF DATA - EDA & DATA CLEANING SCRIPT

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

# 1. Load Data
file_path = (r"C:\Users\Administrator\Downloads\Reports and Dashboard\Data\Reports and Dashboards Data2.xlsx")
df = pd.read_excel(file_path)

print("Data Loaded Successfully")
print(df.head())

# 2. Basic Data Info
print("\nShape of Data:", df.shape)
print("\nColumn Names:\n", df.columns)
print("\nData Types:\n")
print(df.dtypes)

# 3. Missing Values Check
print("\nMissing Values Count:\n")
print(df.isnull().sum())

# 4. Handle Missing Values
num_cols = df.select_dtypes(include=np.number).columns
df[num_cols] = df[num_cols].fillna(df[num_cols].median())

cat_cols = df.select_dtypes(include='object').columns
df[cat_cols] = df[cat_cols].fillna("Not Available")

print("\nMissing values handled")

# 5. Duplicate Records
duplicates = df.duplicated().sum()
print("\nDuplicate Rows:", duplicates)
df = df.drop_duplicates()

# 6. Outlier Detection (IQR Method)
for col in num_cols:
    Q1 = df[col].quantile(0.25)
    Q3 = df[col].quantile(0.75)
    IQR = Q3 - Q1
    df = df[(df[col] >= Q1 - 1.5 * IQR) & (df[col] <= Q3 + 1.5 * IQR)]

print("\nOutliers handled")

# 7. Descriptive Statistics
print("\nDescriptive Statistics:\n")
print(df.describe())


# 8. Save Cleaned Data

save_path = r"C:\Users\Administrator\Downloads\Reports and Dashboard\Data\Reports_and_Dashboards_Data2_Cleaned.xlsx"
df.to_excel(save_path, index=False)

print("\nEDA and Data Cleaning Completed Successfully")

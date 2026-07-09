
# IVF EDA + Data Cleaning

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

# 1. Load Data
file_path = r"C:\Users\Administrator\Downloads\Reports and Dashboard\Data\Reports and Dashboards Data3.xlsx"
df = pd.read_excel(file_path)

print("Data Loaded Successfully")
print(df.shape)
print(df.head())

# 2. Basic Info
print("\nData Info:")
print(df.info())

# 3. Missing Values Check
print("\nMissing Values:")
print(df.isnull().sum())

# 4. Duplicate Rows
duplicates = df.duplicated().sum()
print(f"\nDuplicate rows: {duplicates}")

if duplicates > 0:
    df = df.drop_duplicates()

# 5. Column Name Cleaning
df.columns = df.columns.str.strip().str.lower().str.replace(' ', '_')
print("\nCleaned Column Names")

# 6. Handling Missing Values
num_cols = df.select_dtypes(include=['int64','float64']).columns
cat_cols = df.select_dtypes(include=['object']).columns

for col in num_cols:
    df[col].fillna(df[col].median(), inplace=True)

for col in cat_cols:
    df[col].fillna(df[col].mode()[0], inplace=True)

print("\nMissing values handled")

# 7. Outlier Check (IQR)
for col in num_cols:
    Q1 = df[col].quantile(0.25)
    Q3 = df[col].quantile(0.75)
    IQR = Q3 - Q1
    df = df[(df[col] >= Q1 - 1.5*IQR) & (df[col] <= Q3 + 1.5*IQR)]

print("\nOutliers handled")

# 8. EDA Plots
plt.figure(figsize=(6,4))
sns.histplot(df[num_cols[0]], kde=True)
plt.title("Sample Numeric Column Distribution")
plt.show()

# 9. Correlation Heatmap
plt.figure(figsize=(10,6))
sns.heatmap(df[num_cols].corr(), annot=False, cmap="coolwarm")
plt.title("Correlation Heatmap")
plt.show()

# 10. Save Cleaned Data
save_path = r"C:\Users\Administrator\Downloads\Reports and Dashboard\Data\Reports and Dashboards Data3.xlsx"
df.to_excel(save_path, index=False)

print("\nEDA and Data Cleaning Completed Successfully")

import pandas as pd

# Read data from the CSV file
file_path = 'superstore.csv'
df = pd.read_csv(file_path, sep=';')

# Display the original DataFrame
print("Original DataFrame:")
print(df)

# Save the DataFrame to a new Excel file
output_excel_path = 'output_file.xlsx'  
df.to_excel(output_excel_path, index=False)

print(f"\nDataFrame has been saved to {output_excel_path}")

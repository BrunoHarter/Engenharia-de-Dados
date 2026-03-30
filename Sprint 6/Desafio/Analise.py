import boto3
import pandas as pd
from io import StringIO

s3 = boto3.client('s3')

bucket_name = 'bucket-bruno-123'

response = s3.get_object(
    Bucket=bucket_name,
    Key='dados/dados.csv'
)

data = response['Body'].read().decode('utf-8')

df = pd.read_csv(StringIO(data))

filtro = df[(df['casos'] > 1000) & (df['estado'] == 'SP')]

media = df.groupby('estado')['casos'].mean()

df['nivel'] = df['casos'].apply(lambda x: 'alto' if x > 3000 else 'baixo')

df['casos'] = df['casos'].astype(int)

df['data'] = pd.to_datetime(df['data'])
df['ano'] = df['data'].dt.year

df['estado'] = df['estado'].str.lower()

csv_final = df.to_csv(index=False)

s3.put_object(
    Bucket=bucket_name,
    Key='resultado/resultado.csv',
    Body=csv_final
)

print(df)
print("Arquivo salvo no S3!")
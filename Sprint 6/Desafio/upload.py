import boto3

s3 = boto3.client('s3')

s3.upload_file(
    'dados.csv',
    'bucket-bruno-123',
    'dados/dados.csv'
)

print("Upload feito!")
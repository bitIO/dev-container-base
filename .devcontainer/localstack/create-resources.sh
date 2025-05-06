#!/bin/sh

# only remove and create the resources if they don't exist
if [ -z "$(awslocal s3api list-buckets --query 'Buckets[?Name==`demo`].Name' --output text)" ]; then
    # awslocal s3api delete-bucket --bucket=demo --region=us-east-1 > /dev/null 2>&1
    awslocal s3api create-bucket --bucket=demo --region=us-east-1 > /dev/null 2>&1
else
    echo "Bucket uploads exists"
fi


# only remove and create the table if it doesn't exist
if [ -z "$(awslocal dynamodb list-tables --query 'TableNames[?Name==`demo-table`].Name' --output text)" ]; then
    # awslocal dynamodb delete-table --table-name demo-table --region=us-east-1 > /dev/null 2>&1
    awslocal dynamodb create-table \
        --table-name demo-table --region=us-east-1 > /dev/null 2>&1 \
        --key-schema "[
            {
                \"AttributeName\":\"pk\",
                \"KeyType\":\"HASH\"
            },
            {
                \"AttributeName\":\"sk\",
                \"KeyType\":\"RANGE\"
            }
        ]" \
        --attribute-definitions "[
            {\"AttributeName\":\"pk\",\"AttributeType\":\"S\"},
            {\"AttributeName\":\"sk\",\"AttributeType\":\"S\"},
            {\"AttributeName\":\"gs1pk\",\"AttributeType\":\"S\"},
            {\"AttributeName\":\"gs1sk\",\"AttributeType\":\"S\"}
        ]" \
        --global-secondary-indexes "[{
            \"IndexName\": \"gs1\",
            \"KeySchema\": [{\"AttributeName\":\"gs1pk\",\"KeyType\":\"HASH\"},{\"AttributeName\":\"gs1sk\",\"KeyType\":\"RANGE\"}],
            \"Projection\": {\"ProjectionType\":\"ALL\"}
        }]" \
        --billing-mode PAY_PER_REQUEST \
        --region us-east-1
else
    echo "Table demo-table exists"
fi
# create security policy

# create security role

aws iam create-role \
	--role-name lambda-exemplo \
	--assume-role-policy-document file://policy.json \
	| tee logs/role.log

# create zipped file
zip function.zip index.js

aws lambda create-function \ 
	--function-name  hello-cli \
	--zip-file fileb://function.zip \ 
	--handler index.handler \
	--runtime nodejs14.x \
	--role arn:aws:iam::795473997661:role/lambda-example \
	| tee logs/lambda-create.log

# invoke lambda function

aws lambda invoke --function-name hello-cli --log-type Tail logs/lambda-exec.log

# Updating operation
# zip file
zip function.zip index.js

# update and publish
aws lambda update-function-code --zip-file fileb://function.zip --function-name hello-cli --publish | tee logs/lambda-update.log

# invoke updated lambda function
aws lambda invoke --function-name hello-cli --log-type Tail logs/lambda-exec-update.log

# remove role and function
aws lambda delete-function --function-name hello-cli
aws iam delete-role --role-name lambda-exemplo
# install serverless framework

npm i -g serverless

# begin project

sls

# deploy

sls deploy

# invoking function on AWS

sls invoke -f hello

# invoking function on local

sls invoke local -f hello

# Configure dashboard

sls dashboard

# checking any function invoking

sls logs -f hello --tail



{
# Build your docker image
docker build -t <YOUR_IMAGE_NAME>:<YOUR_IMAGE_TAG(optional)> .
# Run your dbt inside docker container
docker run -it <YOUR_IMAGE_NAME>:<YOUR_IMAGE_TAG(if any)> <ARGS FOR dbt: run, debug, test, docs serve>
}
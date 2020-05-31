#!/usr/bin/env bash

set -e
set -x

validate_inputs(){
  #ToDO: find a better way of user input validation
  true
}

validate_inputs(){
  #ToDO: improved dependency packaging
  true
}

echo "Create dependency package"
mkdir -p dependencies
python3 -m pip install --target=dependencies -r "${INPUT_DEPENDENCY_LIST}"
zip -r dependencies.zip requirements.txt # changed for debugging

echo "Setup AWS profile and push dependencies to layer"
aws configure set aws_access_key_id "${INPUT_AWS_ACCESS_KEY_ID}"
aws configure set aws_secret_access_key "${INPUT_AWS_SECRET_ACCESS_KEY}"
aws configure set default.region "${INPUT_AWS_REGION}"
aws lambda publish-layer-version --layer-name "${INPUT_LAYER_NAME}" --zip-file fileb://dependencies.zip

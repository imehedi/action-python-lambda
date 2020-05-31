#!/usr/bin/env bash

set -e
set -x

if [ -z [[ ${INPUT_LAMBDA_REGION} || -z ${INPUT_LAMBDA_REGION} ]] ]
then
  echo "var is unset"
else
  echo "var is set to '$var'"
fi


echo "Create dependency package"
mkdir -p dependencies
python3 -m pip install --target=dependencies -r "requirements.txt"
zip -r dependencies.zip requirements.txt # changed for debugging

    - ${{ inputs.AWS_REGION }}
    - ${{ inputs.ACCOUNT_NUMBER }}
    - ${{ inputs.AWS_ACCESS_KEY_ID }}
    - ${{ inputs.AWS_SECRET_ACCESS_KEY }}
    - ${{ inputs.LAMBDA_LAYER_NAME }}
    - ${{ inputs.DEPENDENCY_LIST }}
    - ${{ inputs.LAMBDA_FUNCTION_NAME }}
    - ${{ inputs.LAMBDA_HANDLER_NAME }}
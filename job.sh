env
mkdir -p /onedata/output

ONECLIENT_AUTHORIZATION_TOKEN="$INPUT_ONEDATA_TOKEN" PROVIDER_HOSTNAME="$ONEDATA_PROVIDERS" oneclient --no_check_certificate --authentication token -o rw /onedata/output || exit 1

echo Start at $(date)

OUTPUTDIR="/onedata/output/$ONEDATA_SPACE/$MODEL_PATH"
python3 xdc_lfw_sat/sat_server/xdc_lfw_sat.py -sd $START_DATE -ed $END_DATE --region $REGION -sat $SAT -path $SAT_PATH
mv "$SAT_PATH" "$OUTPUTDIR"
echo End at $(date)
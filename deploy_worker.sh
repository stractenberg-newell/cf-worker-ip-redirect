CF_API_TOKEN="<api_token>"
ACCOUNT_ID="<cf_account_id>"
SCRIPT_NAME="<script_name>"

curl -X PUT "https://api.cloudflare.com/client/v4/accounts/$ACCOUNT_ID/workers/scripts/$SCRIPT_NAME" \
     -H  "Authorization: Bearer $CF_API_TOKEN" \
     -F "metadata=@metadata.json;type=application/json" \
     -F "script=@ip_redirect.js;type=application/javascript"

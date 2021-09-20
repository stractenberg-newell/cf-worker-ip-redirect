ACCOUNT_ID="<cf_account_id>"
CLOUDFLARE_EMAIL="<cf_email_address>"
CLOUDFLARE_AUTH_KEY="<cf_auth_key>"
SCRIPT_NAME="<script_name>"

curl -X PUT "https://api.cloudflare.com/client/v4/accounts/$ACCOUNT_ID/workers/scripts/$SCRIPT_NAME" \
    -H "X-Auth-Email: $CLOUDFLARE_EMAIL" \
    -H "X-Auth-Key: $CLOUDFLARE_AUTH_KEY" \
    -F "metadata=@metadata.json;type=application/json" \
    -F "script=@ip_redirect.js;type=application/javascript"

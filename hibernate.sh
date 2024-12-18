#!/bin/bash

# 引数の確認
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <instance_id>"
  exit 1
fi

# インスタンスID
INSTANCE_ID="$1"

# クレデンシャル情報
CLIENT_ID="EQkFXb4eEVTit6hjX7PBe"
CLIENT_SECRET="51qHz2K0zyGrM7EV3vHw9s8vDyrms7kuaROloXP5mT"

# アクセストークンを取得
ACCESS_TOKEN=$(curl --silent --request POST \
  --url https://api.datacrunch.io/v1/oauth2/token \
  --header 'Content-Type: application/json' \
  --data "{
    \"grant_type\": \"client_credentials\",
    \"client_id\": \"$CLIENT_ID\",
    \"client_secret\": \"$CLIENT_SECRET\"
  }" | jq -r '.access_token')

# アクセストークンが取得できたか確認
if [ -z "$ACCESS_TOKEN" ] || [ "$ACCESS_TOKEN" == "null" ]; then
  echo "Failed to obtain access token."
  exit 1
fi

echo "Access Token: $ACCESS_TOKEN"

# Hibernate APIを呼び出す
RESPONSE=$(curl --silent --request POST \
  --url https://api.datacrunch.io/v1/instances/action \
  --header "Authorization: Bearer $ACCESS_TOKEN" \
  --header 'Content-Type: application/json' \
  --data "{
    \"id\": \"$INSTANCE_ID\",
    \"action\": \"hibernate\"
  }")

# 結果を表示
echo "Response from hibernate API:"
echo "$RESPONSE"

source config

read -p "Enter bot token: " bot_token
read -p "Enter techsupport chat-id: " techsupport_chat_id
read -p "Enter mgmt chat-id: " mgmt_chat_id

echo "SECRET=\"$bot_token\"" >> $BOT_CONFIG
echo "CHAT_ID=$techsupport_chat_id" >> $BOT_CONFIG
echo "MGMT_CHAT_ID=$mgmt_chat_id" >> $BOT_CONFIG

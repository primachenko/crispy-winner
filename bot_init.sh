source config

read -p "Enter bot token: " token
read -p "Enter techsupport chat-id: " chat_id

echo "SECRET=\"$token\"" >> $BOT_CONFIG
echo "CHAT_ID=$chat_id" >> $BOT_CONFIG

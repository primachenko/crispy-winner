source config

read -p "Enter bot token: " bot_token
read -p "Enter techsupport chat-id: " techsupport_chat_id
read -p "Enter mgmt chat-id: " mgmt_chat_id

read -p "Enter QNAP URL: " qnap_url
read -p "Enter QNAP user: " qnap_user
read -p "Enter QNAP password: " qnap_password

read -p "Enter Google Tables users table name: " google_users_table_name
read -p "Enter Google Tables schedule table name: " google_schedule_table_name

echo "SECRET=\"$bot_token\"" > $BOT_CONFIG
echo "CHAT_ID=$techsupport_chat_id" >> $BOT_CONFIG
echo "MGMT_CHAT_ID=$mgmt_chat_id" >> $BOT_CONFIG

echo "QTS_HOST=\"$qnap_url\"" >> $BOT_CONFIG
echo "QTS_USER=\"$qnap_user\"" >> $BOT_CONFIG
echo "QTS_PASSWORD=\"$qnap_password\"" >> $BOT_CONFIG

echo "GOOGLE_USERS_TABLE_NAME=\"$google_users_table_name\"" >> $BOT_CONFIG
echo "GOOGLE_SCHEDULE_TABLE_NAME=\"$google_schedule_table_name\"" >> $BOT_CONFIG

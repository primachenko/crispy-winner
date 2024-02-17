source config

echo "Downgrading ..."

VER=$(docker images | awk '($1 == "tsbot" && $2 != "latest") {print $2;}' | sort -r | head -1)

if [[ -z $VER ]] ; then
	echo "Not installed. Exit ..."
	exit 1
elif [[ $VER == "latest" ]]; then
	echo "Invalid tagging. Exit ..."
	exit 1
fi

echo "Current version $VER"
PREV_VER=$(echo $VER | awk '{print $1-0.1; exit}')
if [[ $PREV_VER == "0" ]]; then
	echo "No previous version. Exit ..."
	exit 1
fi

echo "Target version $PREV_VER"

echo "Create tag tsbot:latest from tsbot:$PREV_VER"
docker tag tsbot:$PREV_VER tsbot:latest
if [[ $? != 0 ]]; then
	echo "Failed. Exit ..."
	exit 1
fi

echo "Remove image tsbot:$VER"
docker rmi tsbot:$VER -f

echo "Downgrade completed current image tsbot:$PREV_VER"

bash bot_restart.sh

source config

echo "Extracting ..."

VER=$(docker images | awk '($1 == "tsbot" && $2 != "latest") {print $2 += .1;}' | sort -r | head -1)
cat $UPDATE_FILE | docker load

if [[ -z $VER ]] ; then
	echo "Install bot ..."
	VER=$VER_MAJ_START.$VER_MIN_START
else
	echo "Update bot ..."
fi

echo "Create tag tsbot:$VER from tsbot:latest"
docker tag tsbot:latest tsbot:$VER

bash bot_restart.sh

rm -rf $UPDATE_FILE

if [ -z $UPSTREAM_REPO ]
then
  echo "Cloning main Repository"
  git clone https://github.com/Jayanth14072003/MJ-Filter-Bot.git /MJ_FILTER_BOT 
else
  echo "Cloning Custom Repo from $UPSTREAM_REPO "
  git clone $UPSTREAM_REPO /MJ_FILTER_BOT 
fi
cd /MJ_FILTER_BOT 
pip3 install -U -r requirements.txt
echo "Starting Bot...."
python3 bot.py

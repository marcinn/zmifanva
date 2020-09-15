cd zmifanva
python2 moses_server.py &
sleep 5
cd web
source env/bin/activate && pserve development.ini

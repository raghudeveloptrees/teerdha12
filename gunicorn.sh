
#!/bin/bash

cd /var/lib/jenkins/workspace/teerdha12

$PWD

source ram/bin/activate
pip3 install gunicorn
sudo apt-get install libmysqlclient-dev
sudo yum install mysql-devel  
sudo apt install pkg-config --exists mysqlclient
sudo apt install pkg-config --exists libmariadb
python3 manage.py makemigrations
python3 manage.py migrate
python3 manage.py collectstatic 

echo "Migrations done"


sudo rm /etc/systemd/system/gunicorn.service
sudo cp -rf gunicorn.socket /etc/systemd/system/
sudo cp -rf gunicorn.service /etc/systemd/system/

echo "$USER"
echo "$PWD"



sudo systemctl daemon-reload
sudo systemctl start gunicorn

echo "Gunicorn has started."

sudo systemctl enable gunicorn

echo "Gunicorn has been enabled."

sudo systemctl restart gunicorn


sudo systemctl status gunicorn

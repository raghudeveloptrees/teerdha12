
#!/bin/bash

# Check if virtualenv is installed
if command -v virtualenv &> /dev/null; then
    echo "virtualenv is already installed."
else
    echo "Installing virtualenv......"
    sudo apt update
    sudo apt install -y python3-virtualenv
    sudo apt install virtualenv -y
    sudo apt install python3-venv -y
    sudo apt install python3-pip -y
    sudo apt install nginx -y
    sudo apt install gunicorn -y
    sudo apt install supervisor -y
    sudo apt install libmysqlclient-dev -y
    sudo apt install pkg-config -y
    sudo apt install libpq-dev -y
    
    
fi

    python3 -m venv krishna
    
if [ -d "krishna" ]
then
    echo "Python virtual environment exists."
else
    echo "Creating a virtual environment"
    python3 -m venv krishna
fi

echo "The current directory"
echo $PWD
echo -e "\n\n\n"

echo "Activating the virtual environment"
source krishna/bin/activate
echo -e "\n\n\n"

echo -e "\n\n\n"
echo "Installing Requirements...."
pip install -r requirements.txt
echo "Requirements Installed."
echo -e "\n\n\n"

python3 -c "import psycopg2"


echo "Checking for logs"
if [ -d "logs" ]
then
    echo "Log folder exists."
else
    echo "Creating Logs"
    mkdir logs
    touch logs/error.log logs/access.log
fi

echo -e "\n\n\n"
echo "Giving Permission"
sudo chmod -R 777 logs
echo -e "\n\n\n"
echo "*********Script Ended************"

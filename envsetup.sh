
#!/bin/bash

# Check if virtualenv is installed
if command -v virtualenv &> /dev/null; then
    echo "virtualenv is already installed."
else
    echo "Installing virtualenv......"
    sudo apt install -y python3-virtualenv
    sudo apt install virtualenv -y
    sudo apt install python3-venv -y
    sudo apt install python3-pip -y
    sudo apt install nginx -y
    sudo apt install gunicorn -y
fi

    python3 -m venv ram
    
if [ -d "ram" ]
then
    echo "Python virtual environment exists."
else
    echo "Creating a virtual environment"
    python3 -m venv ram
fi

echo "The current directory"
echo $PWD
echo -e "\n\n\n"

echo "Activating the virtual environment"
source ram/bin/activate
echo -e "\n\n\n"

echo -e "\n\n\n"
echo "Installing Requirements...."
pip3 install -r requirements.txt
pip3 install django
pip install requests
pip install mysqlclient
pip install django-rest-framework
echo "Requirements Installed."
echo -e "\n\n\n"

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

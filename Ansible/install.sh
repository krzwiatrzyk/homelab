sudo apt-get install curl -y 
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo apt-get install python3-distutils -y
sudo apt-get install python3-apt -y
python3 get-pip.py 
python3 -m pip install --user ansible

echo "PATH=$PATH:/home/krzwiatrzyk/.local/bin" >> ~/.bashrc
rm get-pip.py

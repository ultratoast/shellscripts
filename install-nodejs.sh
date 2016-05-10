#!/bin/bash
#Install Nodejs on Linux
sudo apt-get update
sudo apt-get install git
cd
#check website for latest version
wget https://nodejs.org/dist/v6.1.0/node-v6.1.0-linux-x64.tar.gz
tar -xvf node*
cd node-*
cp -r bin/* /usr/local/bin/
cp -r lib/* /usr/local/lib/
cp -r share/* /usr/local/share/
cp -r include/* /usr/local/include/
cd ..
rm -rf node*
##verify installation
npm --version
node --version
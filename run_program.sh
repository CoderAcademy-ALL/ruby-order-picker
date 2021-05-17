#!/bin/bash
echo "Hello, welcome to Order Picker 9000"
echo "Please type the file name to select a group"
read GROUP
GROUP_PATH="./groups/$GROUP"

ruby index.rb -path $GROUP_PATH

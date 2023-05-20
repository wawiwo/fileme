#!/bin/bash 

Banner() {
    echo "Usage : ${0} <google_drive_file_id> <saved_file_name_with_extension>"   
} 

## Below fuction is taken from 
## https://askubuntu.com/questions/770753/how-to-download-large-google-drive-file-with-resume-support-in-ubuntu
gdrive_download () {
  CONFIRM=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate "https://docs.google.com/uc?export=download&id=$1" -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')
  wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$CONFIRM&id=$1" -O $2
  rm -rf /tmp/cookies.txt
} 

## Main Func
if [ ${#} != 2 ] 
then
    Banner
else
    gdrive_download $1 $2 
fi

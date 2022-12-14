#!/usr/bin/bash
set -e

cd _site
echo "-------- Configuration start -----------"
aws configure set aws_access_key_id $1
aws configure set aws_secret_access_key $2
aws configure set region $3
echo "-------- Configuration Complete -----------"
echo " "
# Check to be sure source directory exists before removing remote files
if [ ! -d "${4}" ] 
then
    echo "Directory ${4} DOES NOT exist!" 
    exit 9999 # die with error code 9999
fi
echo "Removing assets....."
aws s3 rm $5 --recursive
echo "Uploading....."
aws s3 cp $4 $5 --exclude ".github/*" --exclude ".git/*" $6
echo "Upload complete"
# TODO: Add the appropriate permissions for this and re-implement
#echo "Clearing cache...."
#aws cloudfront create-invalidation --distribution-id $7 --paths "/*"
#echo "Cache cleared......"
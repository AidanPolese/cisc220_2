#!/bin/bash
#Manvir Grewal : 10193283
#Aiden Polese : 10197342
#Kathleen Abols : 10179548
#The cron job command for this script would be
# * 1 * * * /home/user/pathToScript /pathToRepoFolder github.com/repoURL.git git-username git-password

#takes all the args in the order specified by the assignment
repo=$1
github=$2
user=$3
pass=$4

#Creates the current date to the hour
date=$(date +%Y%m%d%H)

#Creates the compressed backup of the specified directory
tar -czf backup$date.tar $repo
printf '\nBackup backup'$date
echo ' created successfully!'

#adds and commits the backup locally
git add backup$date.tar
git commit -m 'auto commit run by script'

printf '\nBackup backup'$date
echo ' commited to the local git repository'

#pushes the backup to the specified git repo
git push https://$user:$pass@$github --all

printf '\nBackup backup'$date
echo ' pushed to the remote git repository'




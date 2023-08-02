#!/bin/bash
Name=$1
LastName=$2
Age=$3
Visible=$4

if [ "$Visble" = "true" ]; then 
	echo "Hello I am $Name $LastName, and I am $Age years old."
else
	echo "Please pass Visible True!!!"
fi
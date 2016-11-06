#!/bin/bash

WEBSITE='chef.io'
TIME=100

function download() {
  wget $WEBSITE -O /dev/null
}

function help_function() {
cat << EOF
Welcome to TimeWaster. TimeWaster is a script that enables you to appear to be doing work while in fact you are not.
It repeatedly downloads websites and copies files to /dev/null.
Version: 0.0.1
Usage: ./scriptname -w [site] -t [number]

Options:
  -h, - Display this message
  -w, - Pick a site
  -t, - Amount of times to perform action

Arguments:
Passing a number in will tell this script how many times to run through its sequence of downloading the website.
If you do not chose a value, it will be set to chef.io by default.

Warnings:
It is recommended that this script name be changed after download and that the default website is specified so as to not arouse suspecion when the proxy logs are checked.
EOF
}

while getopts ":hw:t:" opt; do
  case $opt in
    w )
      WEBSITE=$OPTARG
      ;;
    t )
      TIME=$OPTARG
      for (( c=1; c<=$TIME; c++ ))
      do
        download
      done
      ;;
    h )
      help_function
      exit 0
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      ;;
  esac
done

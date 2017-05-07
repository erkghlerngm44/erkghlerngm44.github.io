#!/bin/bash

# Vars
VER=2.0.0
REPO=https://github.com/erkghlerngm44/r-anime-soulmate-finder
SCRIPT=$REPO/archive/v$VER.zip
USAGE=$REPO/blob/master/README.md#usage
PRAWFILE=https://gist.githubusercontent.com/erkghlerngm44/036c29ba03d7a1c8ddb37220cfde1674/raw/praw.ini

# Download and extract the affinity gatherer script
wget $SCRIPT
unzip v$VER.zip

# Navigate to the dir
cd r-anime-soulmate-finder-$VER 

# Install dependencies
# These things usually have outdated stuff, 
# so it's best to just force update everything
# Also upgrade pip because that's usually outdated as well
# And also sudo it because fuck venv
sudo python3 -m pip install --upgrade pip
sudo python3 -m pip install --upgrade -r requirements.txt

# Get the praw file
wget $PRAWFILE

echo ""
echo "All ready. Type 'python3 ' followed by any command listed here:"
echo "$USAGE"

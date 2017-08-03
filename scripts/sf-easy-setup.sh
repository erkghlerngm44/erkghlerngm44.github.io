#!/bin/bash

# Vars
VER=3.0.0
VVER=v$VER
REPO=https://github.com/erkghlerngm44/r-anime-soulmate-finder
SCRIPT=$REPO/archive/$VVER.zip
USAGE=$REPO/blob/$VVER/README.md
PRAWFILE=https://gist.githubusercontent.com/erkghlerngm44/036c29ba03d7a1c8ddb37220cfde1674/raw/praw.ini

# Download and extract the affinity gatherer script
wget $SCRIPT
unzip $VVER.zip

# Create venv and activate
# Fuck venv. Use virtualenv instead. It actually works...
virtualenv -p python3 venv
source venv/bin/activate

# Navigate to the dir
cd r-anime-soulmate-finder-$VER 

# Install dependencies and force update it all (including pip)
pip install --upgrade pip
pip install --upgrade -r requirements.txt

# Get the praw file
wget $PRAWFILE

# Edit the version in the prawfile
sed -i s/x.x.x/$VER/g praw.ini

echo ""
echo "All ready. Installed /r/anime soulmate finder $VVER and all its dependencies."
echo "Type any command listed here to run it:"
echo "$USAGE"

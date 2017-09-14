#!/bin/bash

echo "Setting up r-anime-soulmate-finder so you don't have to!"

# Vars
PRAWFILE=https://gist.githubusercontent.com/erkghlerngm44/036c29ba03d7a1c8ddb37220cfde1674/raw/praw.ini


# Clone if not done already
if cd r-anime-soulmate-finder; then
    echo "r-anime-soulmate-finder directory already exists; not cloning"
else
    echo "Cloning r-anime-soulmate-finder"
    git clone https://github.com/erkghlerngm44/r-anime-soulmate-finder.git
fi

# Create venv and activate
virtualenv -p python3 venv
source venv/bin/activate

# Navigate to cloned dir
cd r-anime-soulmate-finder

# Make sure it's up to date
git fetch origin
git rebase origin/master

# Checkout the latest tag (release) as master may not be stable
latest=$(git describe --tags --abbrev=0)
echo "Checking out $latest"
git checkout $latest

# Install dependencies and force update everything
pip install --upgrade pip
pip install --upgrade -r requirements.txt

# Get the praw file
wget $PRAWFILE

# Edit the version in the prawfile (doesnt do this properly but whatever).
# User agent automatically specified in v4.2.0+, no need to do this now.
# sed -i s/x.x.x/$latest/g praw.ini

echo ""
echo "All ready. Installed /r/anime soulmate finder $latest and all of its dependencies"
echo "Type any command listed here to run it:"
echo "https://github.com/erkghlerngm44/r-anime-soulmate-finder/blob/$latest/README.md"

#!/usr/bin/bash
# In case submodules weren't recursively cloned
git submodule init
git submodule update
# Pull the latest commit from each site
git submodule foreach git pull
# Add every submodule
git add assets awesome blog calendar foro home
# Push to github
git commit -m "Update sites (auto)"
git push

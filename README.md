
# SimpleInstaller #

Install packages and clone github repositories that are necessary to run your projects. Just make a packages.txt and repositories.txt file respectively and run ./installer.sh.

NOTE: Make sure repos in repositories.txt are valid github urls.

# Installation #
Step 1 - Clone this repo
```
git clone https://github.com/SirWasp/SimpleInstaller/
```
Step 2 - Make installer executable
```
chmod +x installer.sh
```

# Important! #
This script requires that there is a packages.txt and repositories.txt present in the current working directory.

Example:
For package.txt, should only contain:
```
git
grep
figlet
```

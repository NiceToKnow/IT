#!/bin/sh

echo "\033[0;32mDeploying updates to GitHub...\033[0m"

echo "\033[2m"
# Build the project.
hugooutput="$(hugo)"
echo "$hugooutput"
echo "\033[0m"

if echo "$hugooutput" | grep "ERROR"
  then echo "\033[31mError during build, cancelling deployment. 🙁\033[0m"
  exit
fi

# Add changes to git.
git add -A

# Commit changes.
if [ $# -eq 1 ]
    then msg="$1"
else
    echo "\033[1mCommit message: "
    read "newmsg"
    echo "\033[0m"
    msg="$newmsg"
fi

git commit -m "$msg"

# Push source and build repos.
git push origin master
git subtree push --prefix=public git@github.com:NiceToKnow/IT.git gh-pages
echo "New version is deployed 👍"

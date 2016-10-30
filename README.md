# Nice To Know IT

## How do I update stuff?
Content is placed in the `content` folder. Every item has its own Markdown-file (`.md`). 
You can bundle items in a folder. The only real important thing is the header (or *front matter*):

    +++
    [menu.main]
    Name = "My Item"
    identifier = "My Item" // uniqe
    parent = "My Parent" // another item's identifier
    +++

## Committing
The repository uses github-pages, which requires a `gh-pages` branch.
Hugo however outputs everything into to `public` folder.
The `deploy.sh` script and git subtree magic merge these two. All you have to do is run Hugo

    hugo

and run the `deploy.sh` script

    bash deploy.sh "My commit message"

# git
A few useful commands that I tend to use over and over again. I expect this list to continue to grow as I work on additional projects. Use with caution as these may not pertain to your project or git flow.

### Create a New Feature Branch
```git
git checkout -b feature_branch
git add .
git commit -m 'Create feature X.'
```
### Merge Feature back into Dev
```git
git checkout dev
git merge --no-ff feature_branch -m 'Merge from feature_branch.'
git push origin dev
```

### Tag a release
```git
git tag -a x.x -m 'Release candidate x.x.'
git push origin x.x
```

### Delete an Old Branch
```git
git branch -d feature_branch
```

### Pull my dev branch back down into a new dev branch
```git
git checkout --track -b dev origin/dev
```

### Clone Between Repositories
```git
git clone --bare git@.........git
cd ...git
git push --mirror git@........git
```

### Squash Repository History
```git
git checkout -- orphan temp_branch
git add -A
git commit -am 'Initial commit after squash.'
git branch -D master
gti branch -m master
git push -f origin master
git gc --aggressive --prune=all
```

### Recover From Bad Commit to a Feature (Use with caution - not completely tested)
This assumes you're currently on a feature branch and want to save your work by killing off the old branch to begin again.
```git
git stash save 'LABEL/MESSAGE FOR THE STASH'
git checkout dev
git checkout -b NEW_FEATURE_BRANCH
git stash list
```
This should list the stash ID of your previous stash.  Use it in the next command.
```git
git stash apply stash@{ID}
```
You could optionally do the following if you haven't stashed anything else since.
```git
git stash pop
```
Now fix and re-commit your changes.
```git
vi src/XXXX
git add .
git commit -m 'Implement Feature XXXX.'
git checkout dev
git merge --no-ff NEW_FEATURE_BRANCH -m 'Merge from NEW_FEATURE_BRANCH.'
git push origin dev
```

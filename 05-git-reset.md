`git reset` allows you to reset your local repository to an earlier commit and it works in two modes: `--soft` or `--hard`. This command is useful if you want to undo changes to your local repo or remove particular changes from a previous commit and move them into a separate commit

The `--soft` mode will reset the repository back to the specified commit:

```
git reset --soft HEAD~1
```

The `HEAD~1` here means "the previous commit". The changes that were contained in that commit are now still staged.

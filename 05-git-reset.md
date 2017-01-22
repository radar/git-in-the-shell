`git reset` allows you to reset your local repository to an earlier commit and it works in two modes: `--soft` or `--hard`. This command is useful if you want to undo changes to your local repo or remove particular changes from a previous commit and move them into a separate commit.

## Soft

The `--soft` mode will reset the repository back to the specified commit:

```
git reset --soft HEAD~1
```

The `HEAD~1` here means "the previous commit". The changes that were contained in that commit are now still staged, which we can see with a call to `git status`:

```
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

  modified:   05-git-reset.md
```

We can unstage these changes if we wish by running the `git reset` command as advised:

```
git reset HEAD 05-git-reset.md
```

Running `git status` again will show that the changes are now unstaged:

```
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

  modified:   05-git-reset.md
```

## Hard

`git reset` allows you to reset your local repository to an earlier commit and it works in two modes: `--soft` or `--hard`. This command is useful if you want to undo changes to your local repo or remove particular changes from a previous commit and move them into a separate commit.

## Soft

`git reset --soft <ref>` will reset the repository back to the specified commit:

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

The `git reset --hard <ref>` variant of this command will reset the repository back to that specific commit:

```
git reset --hard HEAD~1
```

**This will lose _all current changes_ to files, so be careful when you do run it!**

If you didn't mean to run `git reset --hard HEAD~1`, you can reset the repo back to the previous commit again, if you know the commit's ref. If you didn't write that ref down, then `reflog` will come in handy:

```
git reflog
```

```
5852c8d HEAD@{0}: reset: moving to HEAD~1
3d5f58c HEAD@{1}: commit: hard documentation
5852c8d HEAD@{2}: commit (amend): Soft documentation
```

In this output, we can see that `3d5f58c` was the commit we were on before we ran `git reset --hard HEAD~1`. When we ran that command, we can then see that our repo moved back to `5852c8d`, which was the commit prior to `3d5f58c`. We can undo our mistaken run of `git reset --hard` by running it again and specifying the commit we want to move to:

```
git reset --hard 3d5f58c
```

The repo's state will now be reset back to where it was before.



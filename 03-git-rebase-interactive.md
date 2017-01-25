`git rebase -i HEAD~<n>` will allow you to effectively rewrite the history of your repository. Interactive rebasing has several useful features.

**Rewriting the history of a Git repository is dangerous! Only rebase like this on a branch that is not shared by other people, or when you have not committed the code to GitHub yet.**

It allows you to:

* Rewrite commit messages earlier than the last commit
* Squash several commits together and either preserve their commit messages (`squash`), or choose to discard the messages but squash the commits anyway (`fixup`).
* Remove commits that really shouldn't have been there.

What I'd like to show today is the `fixup` command. This command may be helpful if you have several commits which are all related to the same piece of work and may look something like this messy list:

```
d827b66 patch description
637bc76 More on patch
417c9f2 git add -p
```

Running `git rebase -i HEAD~4` will allow me to work with the last 4 commits of this repo:

```
pick d827b66 patch description
pick 637bc76 More on patch
pick 417c9f2 git add -p
pick fd3281d Add git checkout patch
```

This command list tells `git rebase` what to do once I close my editor window. It's currently waiting obediently in a terminal for that to happen. The top three commits here all look like they're related, so I can merged them all together by using the `fixup` command:

```
pick d827b66 patch description
fixup 637bc76 More on patch
fixup 417c9f2 git add -p
pick fd3281d Add git checkout patch
```

I can also use `f` for short:

```
pick d827b66 patch description
f 637bc76 More on patch
f 417c9f2 git add -p
pick fd3281d Add git checkout patch
```

What this will do is squash the commits `d827b66`, `637bc76` and `417c9f2` into a brand new commit, and then it will place the commit in the same position in the history as that first `pick` commit.

Closing my editor's window now will cause `git rebase` to run. We'll see that commit being created in the output:

```
[detached HEAD dcb69a1] patch description
 Date: Mon Jan 23 09:35:11 2017 +1100
 1 file changed, 35 insertions(+)
```

If I now do `git log --oneline --reverse` I can see this new commit in the history:

```
c10be43 git add patch placeholder
dcb69a1 patch description
6311d2a Add git checkout patch
```






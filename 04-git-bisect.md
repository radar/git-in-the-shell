`git bisect` provides a nice way to find when a particular change was introduced to a repository. This can be useful for tracking down bugs which may have happened within a range of commits and you're not sure what that commit was.

In `01-git-add-patch.md` of this repo, the second paragraph is:

> This text shouldn't be here.

While `git blame` will very easily show when this change was introduced because this is a contrived example...

```
2d02040f (Ryan Bigg 2017-01-23 10:01:00 +1100  3) This text shouldn't be here.
2d02040f (Ryan Bigg 2017-01-23 10:01:00 +1100  4)
```

...let's use `git bisect` instead to track it down.

The first step is to find a known "good" revision of the repo which has a version of that document where that sentence wasn't there. If we checkout to the 2nd commit in this repo, we can see that the text _isn't_ there:

```
git checkout dcb69a
```

This is our "good" commit. We then need to know a "bad" commit. The current commit is "bad" because the sentence is there.

We now know the "good" and "bad" commits, and so we can start the bisecting process by running these commands:

```
git bisect good dcb69a
git bisect bad HEAD
```

Because this is a contrived example, there aren't that many commits to bisect through. `bisect` will take a commit somewhere in the middle of the "good" and "bad" commits and wait for verification if that commit is good or bad.

```
Bisecting: 0 revisions left to test after this (roughly 1 step)
[2d02040fa83e02545d6479eac1d0dedb265f9100] trouble
```

In this case, it's picked `2d02040` as the middle commit. `git bisect` will automatically `checkout` our codebase to this commit.

Let's say that we've had 128 commits in between the "good" and "bad" revisions. What `git bisect` will do is pick a commit in the middle -- something like Commit #64 -- and then will wait for us to determine if that commit was "good" or "bad".

If we say that Commit #64 and Commit #128 was "bad", then Git will know that the "bad" thing was somewhere in the range of the 1-64th commits; the "bad" change existed around the 64th commit, so it had to have been introduced earlier. If we said that commit was good, then it would know that it's somewhere in the 64th-128th commit range; the change was introduced later than the 64th commit.

Let's say that we think that this 64th commit is "bad", and so the "bad" commit lies somewhere in the 1-64th commit range. `bisect` will then take that range of commits, find a middle point and repeat the process.

Let's go back to our `live` example now. We're checked out to `2d02040` now and the change exists, and so this commit can be considered "bad":

```
git bisect bad
```

Once we do this, `git bisect` will halve the commits it is bisecting through and wait for our input again:

```
Bisecting: 0 revisions left to test after this (roughly 0 steps)
[6311d2a783a552366093a9154522ebadca550e9e] Add git checkout patch
```

This time, `git bisect` has picked the `6311d2` commit, which _doesn't_ have this change. This commit can therefore be considered "good":

```
git bisect good
```

Because this is the last step in our `git bisect` process, `bisect` will now know what the commit that introduced the change was:

```
2d02040fa83e02545d6479eac1d0dedb265f9100 is the first bad commit
commit 2d02040fa83e02545d6479eac1d0dedb265f9100
Author: Ryan Bigg <git@ryanbigg.com>
Date:   Mon Jan 23 10:01:00 2017 +1100

    trouble
```

We can speed up this whole process if we create a small shell script to run these verification steps:

```
grep -q 'This text' 01-git-add-patch.md

if [ $? -eq 0 ]; then
  exit 1
else
  exit 0
fi
```

And then we use `git bisect run ./test.sh`:

```
running ./test.sh
Bisecting: 0 revisions left to test after this (roughly 0 steps)
[6311d2a783a552366093a9154522ebadca550e9e] Add git checkout patch
running ./test.sh
2d02040fa83e02545d6479eac1d0dedb265f9100 is the first bad commit
commit 2d02040fa83e02545d6479eac1d0dedb265f9100
Author: Ryan Bigg <git@ryanbigg.com>
Date:   Mon Jan 23 10:01:00 2017 +1100

    trouble

:100644 100644 8b6d5a4ad495d23d8b9c048c15d7f86a57ba485c 17e58bc6a5984f163c475acfa181ca196282e939 M  01-git-add-patch.md
bisect run success
```

We can see here that `git bisect` has run `./test.sh` twice. `git bisect` is using the exit status of my little shell script to determine if a commit is "good" or "bad". If the shell script exits with a status of 0, then the commit is "good", otherwise the commit is "bad".




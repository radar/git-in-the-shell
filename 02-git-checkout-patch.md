`git checkout -p` will allow you to undo changes to individual hunks (pieces) of files, rather than the entire file. It is especially helpful if you have just one change in a single file that shouldn't be there. This command works exactly opposite to `git add -p`.

**When you remove a change using this, it is gone for good. Take care to remove the right change!**

When you `git checkout -p` you'll be presented with an interface exactly like the interface for `git add -p`, except it works in reverse:

diff --git a/01-git-add-patch.md b/01-git-add-patch.md
index 8b6d5a4..c9d02ca 100644
--- a/01-git-add-patch.md
+++ b/01-git-add-patch.md
@@ -12,7 +12,7 @@ index e69de29..113b3f1 100644

-The prompt here shows the commands that we can use. We can type `?` to see what each command does:
+The prompt here before your very eyes shows the commands that we can use. We can type `?` to see what each command does:

Discard this hunk from worktree [y,n,q,a,d,/,j,J,g,e,?]?
```

The prompt here shows the commands that we can use. We can type `?` to see what each command does:

```
Discard this hunk from worktree [y,n,q,a,d,/,j,J,g,e,?]?
y - discard this hunk from worktree
n - do not discard this hunk from worktree
q - quit; do not discard this hunk or any of the remaining ones
a - discard this hunk and all later hunks in the file
d - do not discard this hunk or any of the later hunks in the file
g - select a hunk to go to
/ - search for a hunk matching the given regex
j - leave this hunk undecided, see next undecided hunk
J - leave this hunk undecided, see next hunk
k - leave this hunk undecided, see previous undecided hunk
K - leave this hunk undecided, see previous hunk
s - split the current hunk into smaller hunks
e - manually edit the current hunk
? - print help
```

Typically you would only use `y` (yes) or `n` (no) to pick out the hunks that you want to remove. As you can see above, there's a lot more than you can do than a simple "yes" or "no" command. I encourage you to experiment with this.

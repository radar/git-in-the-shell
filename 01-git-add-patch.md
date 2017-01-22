`git add -p` will allow you to add individual hunks (pieces) of files, rather than the entire file. It is especially helpful if you have several unrelated changes to the same file which you want to commit sepearately.

When you `git add -p` you'll be presented with an interface like this:

```diff
diff --git a/01-git-add-patch.md b/01-git-add-patch.md
index e69de29..113b3f1 100644
--- a/01-git-add-patch.md
+++ b/01-git-add-patch.md
@@ -0,0 +1 @@
+`git add -p` will allow you to add individual hunks of files, rather than the entire file. It is especially helpful if you have several unrelated changes to the same file which you want to commit sepearately.
Stage this hunk [y,n,q,a,d,/,e,?]?
```

The prompt here shows the commands that we can use. We can type `?` to see what each command does:

```
Stage this hunk [y,n,q,a,d,/,e,?]? ?
y - stage this hunk
n - do not stage this hunk
q - quit; do not stage this hunk or any of the remaining ones
a - stage this hunk and all later hunks in the file
d - do not stage this hunk or any of the later hunks in the file
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

Typically you would only use `y` (yes) or `n` (no) to pick out the hunks that you want to add to a commit. As you can see above, there's a lot more than you can do than a simple "yes" or "no" command. I encourage you to experiment with this.

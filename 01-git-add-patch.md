`git add -p` will allow you to add individual chunks of files, rather than the entire file. It is especially helpful if you have several unrelated changes to the same file which you want to commit sepearately.

When you `git add -p` you'll be presented with an interface like this:

```diff
diff --git a/01-git-add-patch.md b/01-git-add-patch.md
index e69de29..113b3f1 100644
--- a/01-git-add-patch.md
+++ b/01-git-add-patch.md
@@ -0,0 +1 @@
+`git add -p` will allow you to add individual chunks of files, rather than the entire file. It is especially helpful if you have several unrelated changes to the same file which you want to commit sepearately.
Stage this hunk [y,n,q,a,d,/,e,?]?
```

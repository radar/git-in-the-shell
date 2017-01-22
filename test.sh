grep -q 'This text' 01-git-add-patch.md

if [ $? -eq 0 ]; then
  exit 1
else
  exit 0
fi

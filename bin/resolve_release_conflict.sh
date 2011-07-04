head -4 config/RELEASE.yml | tail -1 > /tmp/fixed
mv /tmp/fixed config/RELEASE.yml
git add config/RELEASE.yml
git rebase --continue

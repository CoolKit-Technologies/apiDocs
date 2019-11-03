bundle exec jekyll clean
bundle exec jekyll build
git add .
# git status
git commit -m "同步语雀更新"
git push -u origin master
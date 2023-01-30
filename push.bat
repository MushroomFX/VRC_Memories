echo var data = ` > data.js
tree /f /a >> data.js
echo ` >> data.js

git pull
git add -A
git commit -m %date%
git push

timeout -1
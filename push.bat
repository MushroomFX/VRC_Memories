git pull
git add -A
git commit -m %date%
git push

echo "var data = `" > data.js
tree /f >> data.js
echo "`" > data.js

timeout -1
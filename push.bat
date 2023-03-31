set current_dir=%cd%
set source_dir=C:\Program Files (x86)\Steam\userdata\895010532\760\remote\438100\screenshots
set dest_dir=%cd%\steam_screenshots

for %%i in ("%source_dir%\*.jpg") do (
    echo %%i | findstr vr || move "%%i" "%dest_dir%"
)

pushd C:\Program Files (x86)\Steam\userdata\895010532\760\remote\438100\screenshots
mkdir vr
move * .\vr
pushd %current_dir%

timeout -1

echo var data = ` > data.js
tree /f /a >> data.js
echo ` >> data.js

git pull
git add -A
git commit -m %date%
git push
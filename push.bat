set current_dir=%cd%
set source_dir=C:\Program Files (x86)\Steam\userdata\895010532\760\remote\438100\screenshots
set dest_dir=%cd%\steam_screenshots

for %%i in ("%source_dir%\*.jpg") do (
    echo %%i | findstr vr || move "%%i" "%dest_dir%"
)

pushd %source_dir%
mkdir vr
move * .\vr
pushd %current_dir%

echo var data = ` > data.js
tree /f /a >> data.js
echo ` >> data.js

git pull
git add -A
git commit -m %date% > commit.log
git push
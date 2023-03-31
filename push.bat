setlocal

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
git commit -m %date% > lastCommit.log
echo %time:~0,-3% >>lastCommit.log

type lastCommit.log >> commit.log
echo. >> commit.log
echo. >> commit.log
echo. >> commit.log

git push



set "file_contents="

for /f "usebackq delims=" %%a in ("lastCommit.log") do set "file_contents=!file_contents!%%a

msg * %file_contents%
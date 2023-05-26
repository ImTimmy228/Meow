@echo off

timeout /t 1 >nul /nobreak
powershell -WindowStyle hidden -command "Start-Process -FilePath 'Loader.bat' -Verb runas -WindowStyle Maximized"

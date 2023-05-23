timeout /t 2 >nul /nobreak
powershell -WindowStyle hidden -command "Start-Process -FilePath 'Loader.bat' -Verb runas -WindowStyle Maximized"

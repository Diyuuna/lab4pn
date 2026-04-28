@echo off
set /p IP=Введите IP сервера: 

set HOSTS=C:\Windows\System32\drivers\etc\hosts
set TEMP=%TEMP%\hosts_temp

echo 🔧 Обновляем hosts...

:: Удаляем старые записи company.local
findstr /V "company.local" %HOSTS% > %TEMP%

:: Перезаписываем hosts
copy /Y %TEMP% %HOSTS% > nul

:: Добавляем новые
echo %IP% portal.company.local >> %HOSTS%
echo %IP% files.company.local >> %HOSTS%
echo %IP% dev.company.local >> %HOSTS%
echo %IP% design.company.local >> %HOSTS%
echo %IP% docs.company.local >> %HOSTS%
echo %IP% tracker.company.local >> %HOSTS%
echo %IP% hr.company.local >> %HOSTS%
echo %IP% accounting.company.local >> %HOSTS%
echo %IP% sales.company.local >> %HOSTS%
echo %IP% support.company.local >> %HOSTS%
echo %IP% auth.company.local >> %HOSTS%

ipconfig /flushdns

echo.
echo ✅ Готово! Hosts обновлён
pause
@echo off
setlocal
cd /d %~dp0

echo ------------------------------------------
echo Gerando executavel com Flutter...
echo ------------------------------------------
call flutter build windows
IF %ERRORLEVEL% NEQ 0 (
    echo ❌ Erro ao gerar o executavel!
    pause
    exit /b %ERRORLEVEL%
)

echo ------------------------------------------
echo Executavel gerado com sucesso!
echo ------------------------------------------

echo ------------------------------------------
echo Empacotando arquivos com Enigma...
echo ------------------------------------------
powershell -ExecutionPolicy Bypass -File .\generate_project.ps1
IF %ERRORLEVEL% NEQ 0 (
    echo ❌ Erro ao empacotar os arquivos!
    pause
    exit /b %ERRORLEVEL%
)

echo -------------------------------
echo ✅ Arquivos empacotados com sucesso!
echo -------------------------------

pause

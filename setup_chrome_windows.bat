@echo off
REM Setup script to install Chrome and ChromeDriver on Windows for local development

echo ====================================
echo Chrome Setup for Windows
echo ====================================
echo.

REM Check if Chrome is installed
where chrome >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    echo [✓] Chrome is already installed
    chrome --version
) else (
    echo [!] Chrome is not installed
    echo [→] Please install Chrome from: https://www.google.com/chrome/
    echo [→] After installation, rerun this script
    pause
    exit /b 1
)

echo.
echo ====================================
echo Installing ChromeDriver via pip
echo ====================================
echo.

REM Install webdriver-manager which will auto-download ChromeDriver
python -m pip install webdriver-manager --upgrade

echo.
echo ====================================
echo Setting Environment Variable
echo ====================================
echo.

REM Disable Playwright for local Windows testing (use Selenium instead)
setx USE_PLAYWRIGHT "0"
echo [✓] Set USE_PLAYWRIGHT=0 for local development

echo.
echo ====================================
echo Setup Complete!
echo ====================================
echo.
echo You can now run: python main.py
echo.
echo Note: The app will automatically download ChromeDriver on first run
echo       using webdriver-manager.
echo.
pause


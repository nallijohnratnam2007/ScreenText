
@echo off
setlocal
cd /d "%~dp0"

echo Building ScreenText...

if not exist ".venv\Scripts\python.exe" (
    echo ERROR: Virtual environment not found.
    echo Run: python -m venv .venv
    pause
    exit /b 1
)

if not exist "vendor\Tesseract-OCR\tesseract.exe" (
    echo ERROR: Bundled Tesseract not found.
    echo Copy Tesseract into vendor\Tesseract-OCR
    pause
    exit /b 1
)

if not exist "vendor\Tesseract-OCR\tessdata\eng.traineddata" (
    echo ERROR: English language data is missing.
    pause
    exit /b 1
)

".venv\Scripts\python.exe" -m pip install -r requirements.txt
if errorlevel 1 goto failed

".venv\Scripts\python.exe" -m pip install pyinstaller
if errorlevel 1 goto failed

".venv\Scripts\python.exe" -m PyInstaller ^
 --noconfirm ^
 --clean ^
 --windowed ^
 --onedir ^
 --name ScreenText ^
 --add-data "vendor\Tesseract-OCR;tesseract" ^
 app.py

if errorlevel 1 goto failed

echo.
echo Build finished. Check dist\ScreenText\
echo Test ScreenText.exe before publishing.
pause
exit /b 0

:failed
echo.
echo BUILD FAILED. Check the error messages above.
pause
exit /b 1

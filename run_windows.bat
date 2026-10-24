@echo off
setlocal
cd /d "%~dp0"
title IncuBrix PS2 - Setup, test, and start
echo ==================================================
echo IncuBrix PS2 - one-click Windows launcher
echo ==================================================
if not exist ".venv\Scripts\python.exe" (
  echo [1/4] Creating Python virtual environment...
  py -3 -m venv .venv
  if errorlevel 1 (
    echo Could not create venv. Install Python 3.11+ from https://www.python.org/downloads/windows/
    pause
    exit /b 1
  )
)
echo [2/4] Installing project dependencies...
".venv\Scripts\python.exe" -m pip install --upgrade pip
".venv\Scripts\python.exe" -m pip install -r requirements.txt
if errorlevel 1 (
  echo Dependency installation failed.
  pause
  exit /b 1
)
echo [3/4] Running automated tests...
".venv\Scripts\python.exe" -m pytest -q
if errorlevel 1 (
  echo One or more tests failed. Fix them before claiming the test suite passes.
  pause
  exit /b 1
)
echo [4/4] Starting API server...
echo Swagger docs: http://127.0.0.1:8000/docs
echo Health check: http://127.0.0.1:8000/health
echo Stop with Ctrl+C.
".venv\Scripts\python.exe" -m uvicorn app.main:app --host 127.0.0.1 --port 8000
pause

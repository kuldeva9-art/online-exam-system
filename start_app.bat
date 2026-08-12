@echo off
title ExamFlow Pro - Online Examination System
echo ========================================================
echo   Starting ExamFlow Pro Local Server...
echo ========================================================
powershell -ExecutionPolicy Bypass -File "%~dp0run_server.ps1"
pause

@echo off
powershell -Command "Start-Process powershell -ArgumentList '-ExecutionPolicy Bypass -File \"%~dp0KillProcessesForGaming.ps1\"' -Verb RunAs"
@echo off
powershell %userprofile%\dotfiles\win\scripts\ps\addPath.ps1 %cd%
set PATH=%PATH%%CD%;

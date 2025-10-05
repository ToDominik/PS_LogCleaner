# PS_LogCleaner

A simple PowerShell script to automatically find and remove old log files  
based on retention rules defined in a CSV file.

## Description

This project was created as a learning exercise for PowerShell automation and Windows scripting.

It scans directories defined in a `LogDirectories.csv` file, finds files older than the configured number of days (`KeepForDays`), and can optionally delete them using the `-Delete` parameter.

## How to Run

preview only:
.\CleanLogs.ps1

Delete mode:
.\CleanLogs.ps1 -Delete


Default mode only lists files.
Use -Delete to actually remove files older than KeepForDays.

## Test Data

You can create example log files using:

`New-Item -ItemType Directory -Force -Path .\App1`
`New-Item -Path .\App1\app1-1.log -ItemType File`
`New-Item -Path .\App1\app1-2.log -ItemType File`
`New-Item -Path .\App1\app1-3.log -ItemType File`

`(Get-Item .\App1\app1-1.log).LastWriteTime = (Get-Date).AddDays(-40)`
`(Get-Item .\App1\app1-2.log).LastWriteTime = (Get-Date).AddDays(-20)`
`(Get-Item .\App1\app1-3.log).LastWriteTime = (Get-Date).AddDays(-5)`

# PS_LogCleaner

A simple PowerShell script to automatically find and remove old log files  
based on retention rules defined in a CSV file.

## Description

This project was created as a learning exercise for PowerShell automation and Windows scripting.

It scans directories defined in a `LogDirectories.csv` file, finds files older than the configured number of days (`KeepForDays`), and can optionally delete them using the `-Delete` parameter.


REM   --------------------------------------------
REM   |  # Open http://localhost:4000
REM   --------------------------------------------
@echo off
MODE con:cols=180 lines=500

echo Preview at http://localhost:4000

C:
cd C:\gitrepo\mark-5-9\mark59-site
bundle exec jekyll serve

PAUSE
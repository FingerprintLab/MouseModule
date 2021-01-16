#!/bin/bash
#This script opens a chromium window in kiosk mode redirecting to window.htm

#It is mandatory to close all chromium instances before
pkill -o chromium || pkill -o chromium-browser

#Open the new browser window
chromium -kiosk window.htm || chromium-browser -kiosk window.htm

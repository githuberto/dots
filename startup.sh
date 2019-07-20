#!/bin/bash

# Treat caps lock as escape when tapped, control when held.
setxkbmap -option 'caps:ctrl_modifier'
xcape -e 'Caps_Lock=Escape;Control_L=Escape;Control_R=Escape'

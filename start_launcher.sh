#!/bin/bash

### this file is used internally by the image

mkdir -p ~/.config/ngdstudios
/regnum/rolauncher
tail --pid="$(pgrep game)" -f /dev/null

#!/bin/bash
 
grim -g "$(slurp)" - | tee ~/Screenshots/$(date +%Y%m%d_%H%M%S).png | wl-copy

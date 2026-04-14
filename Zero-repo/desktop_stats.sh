#!/bin/bash
time=$(date +%H:%M)
temp=$(sensors | grep 'Core 0' | cut -d+ -f2 | cut -d. -f1)
echo "<span foreground='#cdd6f4' font='JetBrains Mono 80'>$time</span>"
echo "<span foreground='#89b4fa' font='JetBrains Mono 20'>\n                     $temp°C KING</span>"

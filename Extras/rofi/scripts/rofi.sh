#!/usr/bin/env bash
killall rofi || rofi -show "$1" -config "$XDG_CONFIG_HOME"/rofi/"$2".rasi

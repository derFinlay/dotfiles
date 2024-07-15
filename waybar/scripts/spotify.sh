#!/usr/bin/env bash

song_info=$(playerctl -p spotify metadata --format '{{title}}  ' 2> /dev/null)

echo "$song_info"

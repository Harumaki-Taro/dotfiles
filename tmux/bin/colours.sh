#!/bin/bash

colour_green="#3d541b"
colour_yellow="#54461b"
colour_red="#541f1b"

print_green_string() {
    echo "#[fg=${colour_green}]$1"
}

print_yellow_string() {
    echo "#[fg=${colour_yellow}]$1"
}

print_red_string() {
    echo "#[fg=${colour_red}]$1"
}


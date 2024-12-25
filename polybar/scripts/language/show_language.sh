#!/bin/bash
lang=$(ibus engine)

if [[ $lang == "Bamboo" ]]; then
    echo "VI"
else
    echo "EN"
fi

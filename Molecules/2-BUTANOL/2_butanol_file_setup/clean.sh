#!/bin/bash

# Delete temps
find -type f -name '*#*' -delete
find -type f -name 'em*' -delete

# Delete intermediate files
rm processed.gro
rm newbox.gro
rm solv.gro
rm ions.gro

rm ions.tpr

sed -i 's/SOL.*//g' topol.top

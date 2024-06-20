#!/bin/bash

# Setup everything ready for running energy minimization (gmx mdrun -v -deffnm em).


# Gromacs executable to use
GMX_EXEC=$1

# File name to start with
PDB_FILENAME=$2

# Length of the box dim. Has to be at least 2x the cutoff value.
BOX_SIDE_LENGTH=$3

# Modify to .gro
$GMX_EXEC editconf -f $PDB_FILENAME -o processed.gro

# Define the box
$GMX_EXEC editconf -f processed.gro -o newbox.gro -c -d 1.0 -bt cubic -box $BOX_SIDE_LENGTH 

# Solvate
$GMX_EXEC solvate -cp newbox.gro -cs spc216.gro -o solv.gro -p topol.top

# Add ions
$GMX_EXEC grompp -f ions.mdp -c solv.gro -p topol.top -o ions.tpr

$GMX_EXEC genion -s ions.tpr -o ions.gro -p topol.top -pname NA -nname CL -neutral

$GMX_EXEC grompp -f minim.mdp -c ions.gro -p topol.top -o em.tpr 

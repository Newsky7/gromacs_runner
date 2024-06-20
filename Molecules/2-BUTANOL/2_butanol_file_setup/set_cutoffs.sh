#!/bin/bash

SET_VALUE="$1"
sed -i "s/rcoulomb.*/rcoulomb 	= $SET_VALUE/g" ions.mdp
sed -i "s/rvdw.*/rvdw 		= $SET_VALUE/g" ions.mdp

sed -i "s/rcoulomb.*/rcoulomb   = $SET_VALUE/g" minim.mdp
sed -i "s/rvdw.*/rvdw           = $SET_VALUE/g" minim.mdp

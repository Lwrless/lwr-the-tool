#!/bin/bash

if [[ $1 == "eat" ]]; then
	rm $2
else
	echo "Usage: lwr eat FILE"
fi
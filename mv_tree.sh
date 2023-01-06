#!/bin/bash

#### This scripts move every files in working directory and sub-directories
#### by writing the hierarchy tree in filenames

### Get the character number of working directory path ###
PWD_LENGTH=$(echo ${#PWD})+1

### Rename every files ###
for dirname in $(find "$PWD" -name "*.*")
do
  NEW_DIRNAME=$(echo ${dirname:PWD_LENGTH})
  NEW_DIRNAME=$(echo ${NEW_DIRNAME//\//__})
  mv $dirname $NEW_DIRNAME
done

### Remove the empty directories ###
find $PWD -type d -empty -delete
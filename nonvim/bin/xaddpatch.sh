#!/bin/bash


git diff master > ~/temp/temp.patch
git co master
patch -p1 < ~/temp/temp.patch

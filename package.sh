#!/bin/bash -xeu
ROOT=$(pwd)
rm -rf _pkg
mkdir -p _pkg/DEBIAN
cp -r data/* _pkg/
cd _pkg
../../create_digsums.sh | tee DEBIAN/digsigsums
cd $ROOT
cp -r control/* _pkg/DEBIAN
dpkg-deb -Zgzip --root-owner-group --build _pkg 
ar r _pkg.deb _aegis
mv _pkg.deb ../chrony.deb
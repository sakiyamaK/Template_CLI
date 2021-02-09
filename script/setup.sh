#!/bin/sh
swift package init --type executable 
mkdir Sources/$1Core
cp -f tmp/main.swift Sources/$1
cp -f tmp/Package.swift ./
sed -i -e "s/Template_CLI/$1/" Sources/$1/main.swift Package.swift 
rm -rf Sources/$1/main.swift-e Package.swift-e
swift package generate-xcodeproj --skip-extra-files

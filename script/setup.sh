#!/bin/sh
name=(`echo $1|awk '$0=tolower(substr($0,1,1))substr($0,2)'`)
Name=(`echo $1|awk '$0=toupper(substr($0,1,1))substr($0,2)'`)

echo "swift package init --type executable"
swift package init --type executable

mkdir Sources/${Name}Core

echo "cp -f tmp/main.swift Sources/${Name}"
cp -f tmp/main.swift Sources/${Name}

echo "cp -f tmp/Template_CLICore.swift Sources/${Name}Core/${Name}Core.swift"
cp -f tmp/Template_CLICore.swift Sources/${Name}Core/${Name}Core.swift

echo "cp -f tmp/Package.swift ./"
cp -f tmp/Package.swift ./

echo "sed Template_CLI"
sed -i -e "s/Template_CLI/${Name}/" Sources/${Name}/main.swift
sed -i -e "s/Template_CLI/${Name}/" Package.swift
sed -i -e "s/Template_CLI/${Name}/" Sources/${Name}Core/${Name}Core.swift

echo "sed template_CLI"
sed -i -e "s/template_CLI/${name}/" Sources/${Name}/main.swift
sed -i -e "s/template_CLI/${name}/" Package.swift 
sed -i -e "s/template_CLI/${Name}/" Sources/${Name}Core/${Name}Core.swift

rm -rf Sources/${Name}/main.swift-e Package.swift-e Sources/${Name}Core/${Name}Core.swift-e

swift package generate-xcodeproj --skip-extra-files

open ${Name}.xcodeproj
#!/bin/sh
name=$1
Name=(`echo ${name}|awk '$0=toupper(substr($0,1,1))substr($0,2)'`)

echo "swift package init --type executable"
swift package init --type executable

echo "mkdir Sources/${Name}Core"
mkdir Sources/${Name}Core

echo "cp -f tmp/main.swift Sources/${Name}"
cp -f tmp/main.swift Sources/${Name}

echo "cp -f tmp/Template_CLICore.swift Sources/${Name}Core/${Name}Core.swift"
cp -f tmp/Template_CLICore.swift Sources/${Name}Core/${Name}Core.swift

echo "cp -f tmp/Package.swift ./"
cp -f tmp/Package.swift ./

echo "sed -i -e \"s/Template_CLI/${name}/\" Sources/${Name}/main.swift Package.swift"
sed -i -e "s/Template_CLI/${name}/" Sources/${Name}/main.swift Package.swift

echo "sed -i -e \"s/Template_CLI/${Name}/\" Sources/${Name}/main.swift Package.swift"
sed -i -e "s/${name}Core/${Name}Core/" Sources/${Name}/main.swift Package.swift

echo "sed -i -e \"s/Template_CLI/${Name}/\" Sources/${Name}Core/${Name}Core.swift"
sed -i -e "s/Template_CLI/${Name}/" Sources/${Name}Core/${Name}Core.swift

echo "rm -rf Sources/$1/main.swift-e Package.swift-e"
rm -rf Sources/$1/main.swift-e Package.swift-e Sources/$1Core/$1Core.swift-e

echo "swift package generate-xcodeproj --skip-extra-files"
swift package generate-xcodeproj --skip-extra-files
#!/bin/sh

xcodebuild -sdk iphoneos6.1 "ARCHS=armv6 armv7 armv7s" build > /dev/null
xcodebuild -sdk iphonesimulator6.1 "ARCHS=i386 x86_64" "VALID_ARCHS=i386 x86_64" build > /dev/null

rm -rf fat_binary
mkdir fat_binary

lipo -output fat_binary/libLinq2NSObjects.a -create build/Release-iphoneos/libLinq2NSObjects.a build/Release-iphonesimulator/libLinq2NSObjects.a

cp -R build/Release-iphoneos/include fat_binary

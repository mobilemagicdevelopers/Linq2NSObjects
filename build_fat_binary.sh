#!/bin/sh

TARGET=Linq2NSObjects

echo "Clean up build folder."
rm -rf build
mkdir build

echo "Building $TARGET."
xcodebuild -target "$TARGET" -sdk iphoneos6.1 "ARCHS=armv6 armv7 armv7s" -configuration "Release" clean build > /dev/null
xcodebuild -target "$TARGET" -sdk iphonesimulator6.1 "ARCHS=i386 x86_64" "VALID_ARCHS=i386 x86_64" -configuration "Release" clean build > /dev/null

echo "Clean up output folder."
rm -rf fat_binary
mkdir fat_binary

echo "Lipo!"
lipo -output fat_binary/libLinq2NSObjects.a -create build/Release-iphoneos/libLinq2NSObjects.a build/Release-iphonesimulator/libLinq2NSObjects.a

echo "Copy includes."
cp -R build/Release-iphoneos/include/$TARGET/* fat_binary/

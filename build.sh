#!/bin/bash

# Build script for open-links macOS app using Command Line Tools
set -e

echo "🔨 Building open-links macOS app..."

# Create build directory
mkdir -p build

# Compile the Swift files
echo "📝 Compiling Swift files..."
swiftc -o build/open-links \
    -target arm64-apple-macos14.0 \
    -sdk $(xcrun --show-sdk-path) \
    -framework AppKit \
    -framework SwiftUI \
    -framework UniformTypeIdentifiers \
    open-links/ContentView.swift \
    open-links/open_linksApp.swift

# Create app bundle structure
echo "📦 Creating app bundle..."
mkdir -p "build/open-links.app/Contents/MacOS"
mkdir -p "build/open-links.app/Contents/Resources"

# Move the binary
mv build/open-links "build/open-links.app/Contents/MacOS/"

# Create Info.plist
cat > "build/open-links.app/Contents/Info.plist" << EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>CFBundleExecutable</key>
    <string>open-links</string>
    <key>CFBundleIdentifier</key>
    <string>com.example.open-links</string>
    <key>CFBundleName</key>
    <string>open-links</string>
    <key>CFBundleVersion</key>
    <string>1.0</string>
    <key>CFBundleShortVersionString</key>
    <string>1.0</string>
    <key>CFBundlePackageType</key>
    <string>APPL</string>
    <key>LSMinimumSystemVersion</key>
    <string>14.0</string>
    <key>NSHighResolutionCapable</key>
    <true/>
</dict>
</plist>
EOF

echo "✅ Build successful!"
echo "📱 App bundle created at: build/open-links.app"
echo "🚀 To run: open build/open-links.app"

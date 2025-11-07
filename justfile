# Xcode builds (requires full Xcode installation)
build-dev:
        xcodebuild -project open-links.xcodeproj -scheme open-links -configuration Debug build

build-release:
        xcodebuild -project open-links.xcodeproj -scheme open-links -configuration Release build

clean:
        xcodebuild -project open-links.xcodeproj -scheme open-links clean

build-archive:
        xcodebuild -project open-links.xcodeproj -scheme open-links -configuration Release archive -archivePath ./open-links.xcarchive

# Swift Package Manager builds (works with Command Line Tools)
build-spm:
        swift build -c release

build-spm-debug:
        swift build -c debug

run-spm:
        swift run -c release

run-spm-debug:
        swift run -c debug

clean-spm:
        swift package clean

clean-app:
        rm -rf build/

# Alternative: Build with swiftc directly (creates proper app bundle)
build-app:
        ./build.sh

# Simple swiftc build (may not work for GUI apps)
build-direct:
        swiftc -o open-links open-links/ContentView.swift open-links/open_linksApp.swift -framework AppKit -framework SwiftUI

# Check if Xcode is available
check-xcode:
        #!/usr/bin/env bash
        if command -v xcodebuild >/dev/null 2>&1; then
            echo "✅ Xcode available"
            xcodebuild -version
        else
            echo "❌ Xcode not available, use SPM commands instead"
        fi

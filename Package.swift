// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "open-links",
    platforms: [
        .macOS(.v14)
    ],
    products: [
        .executable(
            name: "open-links",
            targets: ["open-links"]
        )
    ],
    targets: [
        .executableTarget(
            name: "open-links",
            path: "open-links",
            sources: ["ContentView.swift", "open_linksApp.swift"],
            resources: [
                .process("Assets.xcassets"),
                .process("Info.plist")
            ]
        )
    ]
)

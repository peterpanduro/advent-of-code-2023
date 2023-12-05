// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Day05",
    targets: [
        .executableTarget(
            name: "Day05",
            path: "Sources"),
        .testTarget(
            name: "Day05Tests",
            dependencies: ["Day05"]),
    ]
)

// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Day08",
    targets: [
        .executableTarget(
            name: "Day08",
            path: "Sources"),
        .testTarget(
            name: "Day08Tests",
            dependencies: ["Day08"]),
    ]
)

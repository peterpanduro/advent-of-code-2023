// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Day07",
    targets: [
        .executableTarget(
            name: "Day07",
            path: "Sources"),
        .testTarget(
            name: "Day07Tests",
            dependencies: ["Day07"]),
    ]
)
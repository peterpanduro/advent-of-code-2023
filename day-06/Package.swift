// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Day06",
    targets: [
        .executableTarget(
            name: "Day06",
            path: "Sources"),
        .testTarget(
            name: "Day06Tests",
            dependencies: ["Day06"]),
    ]
)

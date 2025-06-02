// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftUIPlus",
    platforms: [
        .macOS(.v11),
        .iOS(.v14)
    ],
    products: [
        .library(name: "SwiftUIPlus", targets: ["SwiftUIPlus"])
    ],
    targets: [
        .target(name: "SwiftUIPlus"),
        .testTarget(name: "SwiftUIPlusTests", dependencies: ["SwiftUIPlus"])
    ]
)

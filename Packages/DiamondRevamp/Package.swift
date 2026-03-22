// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DiamondRevamp",
    platforms: [
        .iOS(.v16),
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "DiamondRevamp",
            targets: ["DiamondRevamp"]),
    ],
    dependencies: [
        .package(url: "https://github.com/mohamedsalahnassar/ScrollAnimationKit.git", branch: "main"),
        .package(url: "https://github.com/mohamedsalahnassar/LiquidGlassKit.git", branch: "main"),
    ],
    targets: [
        .target(
            name: "DiamondRevamp",
            dependencies: [
                "ScrollAnimationKit",
                .product(name: "LiquidGlassKit", package: "LiquidGlassKit")
            ]
        )
    ]
)

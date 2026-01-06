// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "iosMath",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v12),
        .macOS(.v10_13),
        .tvOS(.v13),
        .visionOS(.v1),
    ],
    products: [
        .library(
            name: "iosMath",
            targets: ["iosMath", "IosMathSupport"]
        ),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "iosMath",
            dependencies: [],
            path: "iosMath",
            exclude: ["IosMathBundle.swift"],
            publicHeadersPath: "include",
            cSettings: [
                .define("SWIFT_PACKAGE"),
                .headerSearchPath("include"),
                .headerSearchPath("lib"),
                .headerSearchPath("render"),
                .headerSearchPath("render/internal")
            ],
            linkerSettings: [
                .linkedFramework("CoreGraphics"),
                .linkedFramework("QuartzCore"),
                .linkedFramework("CoreText"),
                .linkedFramework("UIKit", .when(platforms: [.iOS, .tvOS])),
                .linkedFramework("AppKit", .when(platforms: [.macOS]))
            ]
        ),
        .target(
            name: "IosMathSupport",
            dependencies: [],
            path: "spm",
            resources: [ .process("fonts") ]
        ),
        .testTarget(
            name: "iosMathTests",
            dependencies: ["iosMath"],
            path: "iosMathTests"
        )
    ]
)

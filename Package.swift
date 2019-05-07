// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "FlexibleInputStackBar",
    products: [
        .library(
            name: "FlexibleInputStackBar",
            targets: ["FlexibleInputStackBar"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "FlexibleInputStackBar",
            dependencies: []
        ),
        .testTarget(
            name: "FlexibleInputStackBarTests",
            dependencies: ["FlexibleInputStackBar"]
        ),
    ]
)

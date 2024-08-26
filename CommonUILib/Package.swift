// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CommonUILib",
    platforms: [
        .iOS(.v16),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "CommonUILib",
            targets: ["CommonUILib"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/pointfreeco/swift-snapshot-testing",
            from: "1.12.0"
          )
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "CommonUILib",
            dependencies: [],
            resources: [
                .process("Resources"),
            ]
        ),
        .testTarget(
            name: "CommonUILibTests",
            dependencies: [
                "CommonUILib",
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing"),
            ]),
    ]
)

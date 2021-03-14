// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "4.4.0-b.2"

let package = Package(
    name: "AirTurnUI",
    defaultLocalization: "en",
    platforms: [.iOS(.v9)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "AirTurnUI",
            targets: ["AirTurnUI"]
        ),
    ],
    dependencies: [
        .package(name: "AirTurnInterface",
                         url: "git@github.com:AirTurn/AirTurnInterface-dynamic-SP.git",
                         from: Version(version)!
        )
    ],
    targets: [
        .target(name: "AirTurnUI",
                        dependencies: [
                            .product(name: "AirTurnInterface", package: "AirTurnInterface")
                        ],
                        path: "Sources",
                        resources: [
                            .process("Resources")
                        ]
        )
    ]
)

// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "4.6.0-b.1"

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
                         url: "https://github.com/AirTurn/AirTurnInterface-dynamic-SP.git",
                         from: Version(version)!
        )
    ],
    targets: [
        .target(name: "AirTurnUIObjC",
                        dependencies: [
                            .product(name: "AirTurnInterface", package: "AirTurnInterface")
                        ],
                        path: "AirTurnUI",
                        exclude: ["../SwiftSources"],
                        resources: [
                            .process("../Resources")
                        ]
        ),
        .target(name: "AirTurnUI",
                        dependencies: ["AirTurnUIObjC"],
                        path: "SwiftSources"
        )
    ]
)

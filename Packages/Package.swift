// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Main",
    platforms: [
        .iOS(.v18)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .singleTargetLibrary("MyStandupsFeature"),
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture", from: "1.0.0"),
    ],
    targets: [
        //Top lelvel Targets
        .target(
            name: "MyStandupsFeature",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                "StandupsListFeature",
                "StandupFormFeature"
            ]
        ),
        //Features
        .target(
            name: "StandupsListFeature",
            dependencies: [
                "StandupModels",
                "StandupFormFeature",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
            ]
        ),
        .target(
            name: "StandupFormFeature",
            dependencies: [
                "StandupModels",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
            ]
        ),
        // Core Modules
        .target(
            name: "StandupModels",
            dependencies: []
        ),
        // Tests
        .testTarget(
            name: "MyStandupsFeatureTests",
            dependencies: [
                "MyStandupsFeature"
            ]
        ),
        .testTarget(
            name: "StandupFormFeatureTests",
            dependencies: [
                "StandupFormFeature"
            ]
        ),
        .testTarget(
            name: "StandupsListFeatureTests",
            dependencies: [
                "StandupsListFeature"
            ]
        ),
    ]
)

// Notice the following convenience wrapper
extension Product {
    static func singleTargetLibrary(_ name: String) -> Product {
        .library(name: name, targets: [name])
    }
}

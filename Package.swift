// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RW-iOS-SPM",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "RW-iOS-SPM",
            targets: ["RW-iOS-SPM","CouchbaseLite","DOTSession","DOT"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "RW-iOS-SPM",
            dependencies: []),
        .testTarget(
            name: "RW-iOS-SPMTests",
            dependencies: ["RW-iOS-SPM"]),
        .binaryTarget(name: "CouchbaseLite", path: "Artifacts/CouchbaseLite.xcframework"),
        .binaryTarget(name: "DOTSession", path: "Artifacts/DOTSession.xcframework"),
        .binaryTarget(name: "DOT", path: "Artifacts/DOT.xcframework"),
    ]
)

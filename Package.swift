// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RW-iOS-SPM",
    // CouchbaseLite 3.4 가 iOS 15 이상을 요구함. 2026-09-23
    platforms: [.iOS(.v15)],
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
        // 2026-09-23: 번들 2.8.4 → Couchbase 공식 3.4.2 로 교체. CocoaPods(RW ~> 3.4)와 버전을 맞춰
        // 3.x 로 생성된 DOT 로컬 DB 를 열 수 있게 한다(2.8.4 는 "newer file format" 오류).
        // 4.x 는 DOT 가 호출하는 CBLDatabase API(saveDocument:error:, documentWithID:) 가 없어 사용 불가.
        .binaryTarget(
            name: "CouchbaseLite",
            url: "https://packages.couchbase.com/releases/couchbase-lite-ios/3.4.2/couchbase-lite-objc_xc_community_3.4.2.zip",
            checksum: "86d3516229473a10f0e969b903afcbb15324f4a6a076f608debee9317d3ea9a8"),
        .binaryTarget(name: "DOTSession", path: "Artifacts/DOTSession.xcframework"),
        .binaryTarget(name: "DOT", path: "Artifacts/DOT.xcframework"),
    ]
)

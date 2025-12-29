// swift-tools-version:5.9

import PackageDescription

#if os(Linux) || os(Windows)
let platformExcludes = ["Apple", "Mac", "iOS"]
#else
let platformExcludes: [String] = []
#endif

let package = Package(
    name: "SwiftTerm",
    platforms: [
        .iOS(.v13),
        .macOS(.v13),
        .tvOS(.v13),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "SwiftTerm",
            targets: ["SwiftTerm"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/swiftlang/swift-subprocess", branch: "main")
    ],
    targets: [
        .target(
            name: "SwiftTerm",
            dependencies: [
                .product(name: "Subprocess", package: "swift-subprocess", condition: .when(platforms: [.macOS, .linux]))
            ],
            path: "Sources/SwiftTerm",
            exclude: platformExcludes
        ),
    ],
    swiftLanguageVersions: [.v5]
)

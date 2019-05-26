// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required t

import PackageDescription

let package = Package(
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-prelude.git", .branch("master")),
    ]
)

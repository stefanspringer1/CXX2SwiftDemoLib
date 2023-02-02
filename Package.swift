// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "CXX2SwiftDemoLib",
    products: [
        .library(
            name: "CXX2SwiftDemoLib",
            type: .dynamic,
            targets: ["CXX2SwiftDemoLib"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "CXX2SwiftDemoLib",
            swiftSettings: [
                .unsafeFlags([
                    "-enable-experimental-cxx-interop",
                    "-emit-objc-header",
                    "-Xfrontend",
                    "-clang-header-expose-decls=all-public"
                ])
            ]
        )
    ]
)

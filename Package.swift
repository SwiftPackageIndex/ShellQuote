// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "ShellQuote",
    products: [
        .library(name: "ShellQuote", targets: ["ShellQuote"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "ShellQuote", dependencies: []),
        .testTarget(name: "ShellQuoteTests", dependencies: ["ShellQuote"]),
    ]
)

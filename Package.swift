// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TCPClient",
    dependencies: [
        .package(url: "https://github.com/apple/swift-nio.git", from: "2.0.0"),
    ],
    targets: [
        .executableTarget(
            name: "TCPClient",
            dependencies: [
                .product(name: "NIO", package: "swift-nio"),
                //.product(name: "NIOCore", package: "swift-nio"),
                //.product(name: "NIOPosix", package: "swift-nio"),
                //.product(name: "NIOSSL", package: "swift-nio-ssl")
            ]),
    ]
)

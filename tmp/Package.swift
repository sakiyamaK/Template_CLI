// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Template_CLI",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
         .executable(name: "template_CLI", targets: ["Template_CLI"]),
        .library(
            name: "Template_CLICore",
            targets: ["Template_CLICore"]),
        .executable(
            name: "Template_CLI",
            targets: ["Template_CLI"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.3.2")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Template_CLI",
            dependencies: [
              .product(name: "ArgumentParser", package: "swift-argument-parser"), 
              "Template_CLICore"]
        ),
        .target(name: "Template_CLICore",
                dependencies: []),
        .testTarget(
            name: "Template_CLITests",
            dependencies: ["Template_CLICore"]),
    ]
)

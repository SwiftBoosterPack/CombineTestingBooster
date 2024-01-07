// swift-tools-version: 5.7

import PackageDescription

let package = Package(
  name: "CombineTesting",
  platforms: [
    .iOS(.v16), .macOS(.v12), .macCatalyst(.v13),
  ],
  products: [
    .library(
      name: "CombineTesting",
      targets: ["CombineTesting"]
    ),
  ],
  targets: [
    .target(
      name: "CombineTesting",
      path: "CombineTesting",
      exclude: [],
      swiftSettings: []
    ),
    .testTarget(
      name: "CombineTestingTests",
      dependencies: ["CombineTesting"],
      path: "CombineTestingTests"
    ),
  ]
)


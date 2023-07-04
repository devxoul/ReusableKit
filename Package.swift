// swift-tools-version:5.0

import PackageDescription

let package = Package(
  name: "ReusableKit",
  platforms: [
    .iOS(.v9), .tvOS(.v9)
  ],
  products: [
    .library(name: "ReusableKit", targets: ["ReusableKit"]),
    .library(name: "RxReusableKit", targets: ["RxReusableKit"]),
  ],
  dependencies: [
    .package(url: "https://github.com/ReactiveX/RxSwift.git", .upToNextMajor(from: "6.0.0")),
  ],
  targets: [
    .target(name: "ReusableKit"),
    .target(name: "RxReusableKit", dependencies: ["ReusableKit", "RxSwift", "RxCocoa"]),
    .testTarget(name: "ReusableKitTests", dependencies: ["ReusableKit"]),
    .testTarget(name: "RxReusableKitTests", dependencies: ["RxReusableKit"]),
  ],
  swiftLanguageVersions: [.v5]
)

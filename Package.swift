// swift-tools-version:3.1

import PackageDescription

let package = Package(
  name: "ReusableKit",
  targets: [
    Target(name: "ReusableKit"),
    Target(name: "RxReusableKit", dependencies: ["ReusableKit"]),
  ],
  dependencies: [
    .Package(url: "https://github.com/ReactiveX/RxSwift.git", majorVersion: 3)
  ]
)

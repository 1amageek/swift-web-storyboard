// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "SwiftWebStoryboard",
    platforms: [.macOS("26.2")],
    products: [
        .library(name: "SwiftWebStoryboard", targets: ["SwiftWebStoryboard"]),
    ],
    dependencies: [
        .package(url: "https://github.com/1amageek/swift-web.git", revision: "72fdf905469e3e6f38fc8c72e79e7200efd11159"),
        .package(url: "https://github.com/1amageek/swift-html.git", from: "0.16.1"),
    ],
    targets: [
        .target(
            name: "SwiftWebStoryboard",
            dependencies: [
                .product(name: "SwiftHTML", package: "swift-html"),
                .product(name: "SwiftWeb", package: "swift-web"),
                .product(name: "SwiftWebStyle", package: "swift-web"),
                .product(name: "SwiftWebUI", package: "swift-web"),
                .product(name: "SwiftWebUIRuntime", package: "swift-web"),
            ],
            exclude: ["DESIGN.md", "INFORMATION_ARCHITECTURE.md", "Catalog/DESIGN.md", "Routes/DESIGN.md"],
            swiftSettings: [.enableUpcomingFeature("ApproachableConcurrency")]
        ),
        .testTarget(
            name: "SwiftWebStoryboardTests",
            dependencies: [
                "SwiftWebStoryboard",
                .product(name: "SwiftHTML", package: "swift-html"),
                .product(name: "SwiftWebStyle", package: "swift-web"),
                .product(name: "SwiftWebUIRuntime", package: "swift-web"),
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

```swift
You can use resources in the Bundle of your package's tests by including them as resources in your test taget (in Package.swift):

import PackageDescription

let package = Package(
    name: "ID3TagEditor",
    products: [
        .library(
            name: "ID3TagEditor",
            targets: ["ID3TagEditor"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "ID3TagEditor",
            dependencies: [],
            path: "./Source",
            exclude: ["Info.plist"]
        ),
        .testTarget(
            name: "ID3TagEditorTests",
            dependencies: ["ID3TagEditor"],
            path: "./Tests",
            exclude: ["Utils/PathLoaderXcodeProj.swift", "Info.plist"],
            resources: [.process("Examples")]
        )
    ],
    swiftLanguageVersions: [.v5]
)

Using them in your test is as simple as using the implementation below in your tests: 

guard let url = Bundle.module.url(forResource: "foo", withExtension: "xml") else { return }
guard let contents = try? String(contentsOf: url) else { return }
```

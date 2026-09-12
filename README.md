# SwiftWeb Storyboard

Independent SwiftWebUI catalog application. SwiftWeb supplies rendering, browser
runtime, and CLI contracts; this repository owns the App, routes, and tests.

```text
swift-web-storyboard -> public swift-web dependency
sweb storyboard -> sweb.json -> this application -> shared lifecycle
```

Use the pinned Swift 6.4 snapshot in `.swift-version` and its matching WASM SDK.
See the [toolchain contract](https://github.com/1amageek/swift-web/blob/main/docs/Toolchain.md).

```bash
git clone https://github.com/1amageek/swift-web-storyboard.git
cd swift-web-storyboard
swift run sweb storyboard
swift test
```

Open `/storyboard`. `sweb.json` selects this package through `packagePath: "."`.
Generated outputs stay under `.swiftweb`. `sweb storyboard prepare` prepares
outputs; `sweb storyboard build` builds production artifacts.

The SwiftWeb dependency pins the public commit introducing the selection
contract; no local checkout or dependency override is required.

For browser verification, run `npm ci` in `Tests/BrowserE2E`, install Chromium
with `npx playwright install chromium`, then run `npm run storyboard-navigation`.
`SWIFTWEB_CLI_EXECUTABLE` can select an already built CLI;
`SWIFTWEB_E2E_BROWSER_EXECUTABLE_PATH` can select installed Chrome.

See [DESIGN.md](DESIGN.md) for contracts and verification ownership.

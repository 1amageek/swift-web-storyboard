# Storyboard

## Purpose and Scope

Independent application repository and package for the SwiftWebUI catalog. System root (no parent). Child: [application module](Sources/SwiftWebStoryboard/DESIGN.md).

## Responsibilities and Boundaries

Owns the app manifest, catalog sources, and catalog tests. Consumes public
SwiftWeb products through a pinned public Git dependency; the SwiftWeb SwiftPM
graph does not depend on this package. Framework rendering and generation remain
owned by SwiftWeb.

## Related Designs

| Design | Relationship | Contract used | Summary | Cautions |
|---|---|---|---|---|
| [SwiftWeb](https://github.com/1amageek/swift-web/blob/main/DESIGN.md) | depends on | App, UI, styles, runtime | Supplies framework products | Preserve pinned toolchain and SDK tuple |
| [Application](Sources/SwiftWebStoryboard/DESIGN.md) | child | App scenes | Owns catalog composition | Sources must remain in the application target for client discovery |
| [Generation](https://github.com/1amageek/swift-web/blob/main/Sources/SwiftWebDevelopment/PackageGeneration/DESIGN.md) | depends on | Source discovery and materialization | Builds Native and WASM consumers | Recheck relocated client source discovery |

## Architecture

```text
Storyboard package -> SwiftWeb products
    sweb.json -> generic sweb dev/build -> generated server/WASM
sweb storyboard -> declared package path -> generic lifecycle
```

## Contracts and Invariants

- SwiftWeb neither publishes nor tests this application target.
- Package, product, target, and App type are named `SwiftWebStoryboard`, as required
  by the existing generated development/server launcher contract.
- Catalog Swift sources remain unchanged; routes, styles, state, and failure semantics remain intact.
- The authored app owns `/` redirect, `/storyboard`, and `/storyboard/:selection`.
- This repository selects itself with `storyboard.packagePath: "."` using the [CLI selector contract](https://github.com/1amageek/swift-web/blob/main/Sources/SwiftWebCLI/DESIGN.md); the command does not know its source layout.
- The standalone package uses the repository's pinned 2026-08-14 toolchain and matching SDKs.

## Verification and Change Impact

`swift test` owns catalog rendering, invalid-selection,
and hydration-index dispatch evidence. The CLI tests own package selection and failure contracts. `Tests/BrowserE2E/storyboard-client-navigation-e2e.mjs`
launches this package via `sweb storyboard` and checks real WASM navigation,
history, color-scheme state, and diagnostics. Source moves must preserve existing
catalog bytes; framework changes require their own owner tests.

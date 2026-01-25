# Personal AGENTS.md

## Projects I work on
- **zaino** - Zcash indexer (Rust)
- **zcashd** - Zcash node (C++)
- **zebra** - Zcash node in Rust
- **lightwalletd** - Light wallet daemon (Go)

## Preferences
- Minimalist code, avoid over-engineering
- Prefer explicit over implicit
- Tests are important but don't over-test

## Rust conventions
- Use `clippy` with all lints
- Prefer `thiserror` for library errors, `anyhow` for binaries
- Run `cargo check` and `cargo clippy` before committing

## Go conventions
- Use `gofumpt` for formatting
- Run `go vet` and `staticcheck`
- Prefer table-driven tests

## When reviewing PRs
- Check for breaking changes
- Look for missing error handling
- Verify tests cover edge cases

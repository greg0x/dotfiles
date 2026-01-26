# Personal AGENTS.md

## Projects I work on

- **zaino** - Zcash indexer (Rust)
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

## Git commit conventions

- Clean commit titles without conventional commit prefixes (no feat:, fix:, chore:, etc.)
- Focus on "why" and context in the commit body
- List of changes is optional (the diff shows what changed)
- Chunk commits as meaningful units of work (logical groupings)
- Don't overdo granularity, but aim for step-by-step logical commits
- If changes are too tangled, it's ok to combine multiple units into one commit

## When reviewing PRs

- Check for breaking changes
- Look for missing error handling
- Verify tests cover edge cases

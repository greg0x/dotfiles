⏺ ┌───────────────┬───────┬──────────────────┐
  │    Buffer     │  Key  │      Action      │
  ├───────────────┼───────┼──────────────────┤
  │ Snacks picker │ <C-b> │ Open in browser  │
  ├───────────────┼───────┼──────────────────┤
  │               │ <C-y> │ Copy URL         │
  ├───────────────┼───────┼──────────────────┤
  │               │ <C-e> │ Copy commit SHA  │
  ├───────────────┼───────┼──────────────────┤
  │               │ <C-o> │ Checkout PR      │
  ├───────────────┼───────┼──────────────────┤
  │               │ <C-r> │ Merge PR         │
  ├───────────────┼───────┼──────────────────┤
  │ Issue         │ <C-r> │ Reload           │
  ├───────────────┼───────┼──────────────────┤
  │               │ <C-b> │ Open in browser  │
  ├───────────────┼───────┼──────────────────┤
  │               │ <C-y> │ Copy URL         │
  ├───────────────┼───────┼──────────────────┤
  │ Pull request  │ <C-r> │ Reload           │
  ├───────────────┼───────┼──────────────────┤
  │               │ <C-b> │ Open in browser  │
  ├───────────────┼───────┼──────────────────┤
  │               │ <C-y> │ Copy URL         │
  ├───────────────┼───────┼──────────────────┤
  │               │ <C-e> │ Copy commit SHA  │
  ├───────────────┼───────┼──────────────────┤
  │ Discussion    │ <C-b> │ Open in browser  │
  ├───────────────┼───────┼──────────────────┤
  │               │ <C-y> │ Copy URL         │
  ├───────────────┼───────┼──────────────────┤
  │ Runs          │ <C-b> │ Open in browser  │
  ├───────────────┼───────┼──────────────────┤
  │               │ <C-r> │ Refresh          │
  ├───────────────┼───────┼──────────────────┤
  │               │ <C-o> │ Rerun            │
  ├───────────────┼───────┼──────────────────┤
  │               │ <C-f> │ Rerun failed     │
  ├───────────────┼───────┼──────────────────┤
  │               │ <C-x> │ Cancel           │
  ├───────────────┼───────┼──────────────────┤
  │               │ <C-y> │ Copy URL         │
  ├───────────────┼───────┼──────────────────┤
  │ Review diff   │ <C-c> │ Close review tab │
  ├───────────────┼───────┼──────────────────┤
  │               │ <C-e> │ Copy commit SHA  │
  ├───────────────┼───────┼──────────────────┤
  │ Review thread │ <C-c> │ Close review tab │
  ├───────────────┼───────┼──────────────────┤
  │ File panel    │ <C-c> │ Close review tab │
  ├───────────────┼───────┼──────────────────┤
  │ Submit window │ <C-a> │ Approve review   │
  ├───────────────┼───────┼──────────────────┤
  │               │ <C-m> │ Comment review   │
  ├───────────────┼───────┼──────────────────┤
  │               │ <C-r> │ Request changes  │
  ├───────────────┼───────┼──────────────────┤
  │               │ <C-c> │ Close review tab │
  ├───────────────┼───────┼──────────────────┤
  │ Repo          │ <C-b> │ Open in browser  │
  ├───────────────┼───────┼──────────────────┤
  │ Release       │ <C-b> │ Open in browser  │
  └───────────────┴───────┴──────────────────┘

## Review diff window (side-by-side panes)

### Navigation
| Key                   | Action                              |
| --------------------- | ----------------------------------- |
| `gf`                  | Open the real file at this line     |
| `]q` / `[q`           | Next / prev changed file            |
| `]Q` / `[Q`           | Last / first changed file           |
| `]u` / `[u`           | Next / prev unviewed file           |
| `]t` / `[t`           | Next / prev review thread           |
| `<localleader>e`      | Focus the changed-files panel       |
| `<localleader>b`      | Toggle the changed-files panel      |
| `<C-c>`               | Close the review tab                |

### Reviewing
| Key                     | Action                                                  |
| ----------------------- | ------------------------------------------------------- |
| `<localleader>ca`       | Add a review comment (normal or visual for multi-line)  |
| `<localleader>sa`       | Add a review suggestion (normal or visual)              |
| `<localleader><space>`  | Toggle file's viewed state                              |
| `<localleader>vs`       | Submit review                                           |
| `<localleader>vd`       | Discard review                                          |
| `<localleader>C`        | Review by commits                                       |
| `<C-e>`                 | Copy commit SHA                                         |

## PR buffer

| Key                | Action                              |
| ------------------ | ----------------------------------- |
| `<localleader>po`  | Checkout PR                         |
| `<localleader>pf`  | Picker of changed files             |
| `<localleader>pd`  | Show full PR diff                   |
| `<localleader>pc`  | List PR commits                     |
| `<localleader>vs`  | Start a review                      |
| `<localleader>vr`  | Resume a pending review             |
| `<leader>qa`       | Approve PR                          |
| `<C-b>`            | Open in browser                     |
| `<C-y>`            | Copy URL                            |
| `<C-e>`            | Copy commit SHA                     |
| `<C-r>`            | Reload                              |
| `]c` / `[c`        | Next / prev comment                 |
| `gf`               | Go to file                          |

## File panel

| Key                     | Action                              |
| ----------------------- | ----------------------------------- |
| `j` / `k`               | Next / prev entry                   |
| `<cr>`                  | Open the diff for selected file     |
| `R`                     | Refresh the panel                   |
| `]q` / `[q`             | Next / prev changed file            |
| `]u` / `[u`             | Next / prev unviewed file           |
| `<localleader><space>`  | Toggle viewed state                 |
| `<localleader>e`        | Focus the panel                     |
| `<localleader>b`        | Toggle the panel                    |
| `<localleader>vs`       | Submit review                       |
| `<localleader>vd`       | Discard review                      |
| `<localleader>C`        | Review by commits                   |
| `<C-c>`                 | Close the review tab                |

> Source: `~/dev/devenv/octo.nvim/lua/octo/config.lua` (`mappings.review_diff`, `mappings.pull_request`, `mappings.file_panel`). Override via `mappings = { review_diff = { goto_file = { lhs = "..." } } }` in `setup()`.

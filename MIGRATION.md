# Migration Notes

## Intentional removals

- `org-roam` is not part of this config.
- No `emacsql` or SQLite-backed notes database is used.
- Runtime state and downloaded packages are intentionally ignored.

## Testing approach

Keep your existing `/Users/bcrabtree/.emacs.d` as the fallback. Launch the new config with `--init-directory` and compare startup, theme behavior, Org basics, and export behavior before deciding whether to adopt it as your primary setup.

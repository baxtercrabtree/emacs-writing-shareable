# AGENTS

## Maintainer Start Here

This file is the quick-start guide for a maintainer agent working in this
repository.

- Read `NOTES.md` first for the current maintainer handoff and active cleanup
  targets.
- Read `README.md` for the public architecture, setup flow, and repository
  conventions.

## Current Default Next Step

Start with the `README.md` cleanup work recorded in `NOTES.md`:

1. tighten wording after recent upstream edits so the tone stays conversational
   but rigorous
2. decide whether to keep or simplify migration and adoption language
3. consider rewording the `early-init.el` description to make it more
   user-facing

After that, revisit the open structural decisions in `NOTES.md`:

- whether `scroll-step` belongs in `lisp/core/core-defaults.el`
- whether `MIGRATION.md` should remain separate
- whether `ido` should remain the default completion choice

## Working Rules

- Keep shared startup-wide behavior in `lisp/core/`.
- Keep opt-in workflows and features in `lisp/modules/`.
- Keep machine-specific paths, fonts, and local preferences in `local/init.el`.
- Treat generated runtime state such as `elpa/`, `var/`, and `local/custom.el`
  as untracked state, not committed source.
- Preserve the shared naming convention: `ews-` for public symbols and `ews--`
  for internal helpers.

## Change Safety

- Do not overwrite or revert user-authored changes unless explicitly asked.
- Prefer small, explainable changes that preserve startup resilience.
- Startup should continue to work even when optional local settings are unset.

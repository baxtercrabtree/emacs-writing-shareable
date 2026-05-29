# NOTES

This file is the maintainer handoff for future chats and for continuing this
project on another machine. The next machine is expected to be a PC, so do not
assume macOS paths, fonts, shell behavior, or installed tools are available. It
captures the current state, completed cleanup, and the next useful decisions
without trying to become a full roadmap.

## Current Project Shape

This repository is now a shareable, writing-focused Emacs configuration. It is
meant to be reusable rather than a dump of one machine's Emacs state.

The public setup is documented in `README.md`. Maintainer rules and boundaries
live in `AGENTS.md`. This file is the active pickup note for the next agent.

## Completed Work

- Split the config into startup-wide core layers under `lisp/core/` and opt-in
  workflow modules under `lisp/modules/`.
- Kept `init.el` thin: it establishes the config root, updates `load-path`, and
  loads the core startup files in order.
- Added the `ews-` namespace for public variables, commands, and setup helpers;
  internal helpers should use `ews--`.
- Moved machine-specific paths, fonts, enabled modules, and local preferences
  into untracked `local/init.el`, with `local/init.example.el` as the template.
- Made optional behavior load through `ews-enabled-modules`; current modules are
  `theme-modus`, `org-base`, and `org-writing`.
- Kept generated runtime state out of source control, including `elpa/`, `var/`,
  `local/custom.el`, `bookmarks`, `diary`, `ido.last`, and compiled files.
- Cleaned up the README, added maintainer guidance in `AGENTS.md`, and recorded
  hygiene rules for keeping the repo shareable.

## Architecture Notes

Startup flow:

1. `init.el` sets `ews-config-root` and adds `lisp/core/` and `lisp/modules/`
   to `load-path`.
2. `core-bootstrap` prepares package management and `use-package`.
3. `core-settings` defines user-facing settings and loads `local/init.el` when
   present.
4. `core-os`, `core-defaults`, `core-ui`, and `core-editing` apply shared
   behavior for all sessions.
5. `core-modules` loads optional modules listed in `ews-enabled-modules`.

Placement rules:

- Put startup-wide behavior in `lisp/core/`.
- Put opt-in workflows and features in `lisp/modules/`.
- Put personal paths, fonts, local tool paths, and one-off preferences in
  `local/init.el`.
- Keep generated runtime state ignored rather than designing around it.

## Next Session

- Tighten README wording after recent edits so the tone stays conversational but
  rigorous.
- Decide whether to keep, simplify, or remove the migration and adoption
  language in `README.md`.
- Reword the `early-init.el` description in `README.md` so it is more
  user-facing.
- Resolve whether `scroll-step` belongs in `lisp/core/core-defaults.el` or
  should move to a more specific layer.
- Decide whether `MIGRATION.md` should stay separate, be renamed, or be folded
  into `README.md`.
- Revisit whether `ido` remains the right default completion choice.

## Transfer Notes

On the next machine, assume a PC/Windows environment unless proven otherwise:

1. Clone the repo or pull the latest `main`.
2. Copy `local/init.example.el` to `local/init.el`.
3. Edit `local/init.el` for that machine's paths, fonts, enabled modules, Org
   directories, and optional circadian settings. Translate the example Unix-like
   paths to the target environment instead of copying local macOS paths.
4. Start Emacs with:

   ```sh
   emacs --init-directory=/path/to/this/repo
   ```

   On Windows, use the equivalent path syntax for the installed Emacs build and
   shell, for example a `C:/...` or PowerShell-friendly path.

Do not copy generated state such as `elpa/`, `var/`, `local/custom.el`,
`bookmarks`, `diary`, `ido.last`, autosaves, caches, or backup snapshots unless
there is a deliberate personal reason outside the repo history.

Before making code changes on the PC, re-check OS-sensitive behavior in
`lisp/core/core-os.el`, external tools such as spell-check executables, and any
font names or Org paths configured in `local/init.el`.

## Provenance

This handoff is based on the repository files and local git history. No external
references were used for this closeout note.

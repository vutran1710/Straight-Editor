# Global Packages Cheat Sheet

This file summarizes the core UX stack, key bindings, and common commands from your Emacs `global-packages-setup.el`.

> Package management is handled by [straight.el](https://github.com/radian-software/straight.el), so packages are cloned via Git on first launch and cached in `~/.emacs.d/straight/`.

> Updated: 2025‑09‑18

---

## Completion & Minibuffer Stack

- **Vertico**: vertical candidate UI in the minibuffer.
  - Toggle: `M-x vertico-mode`
- **Orderless**: space-separated fuzzy matching across components.
  - Works automatically with completion.
- **Consult**: search & pickers (ripgrep/line/buffer/imenu/etc.).
  - `C-s` → `consult-line` (search in buffer)
  - `C-c r` → `consult-ripgrep` (search project / dir)
  - `C-x b` → `consult-buffer`
  - `M-g i` → `consult-imenu` (jump by symbols)
- **Marginalia**: rich annotations in minibuffer (file sizes, docstrings…).
  - Cycle styles: `M-A` while in minibuffer

### Tips
- Type multiple words to match in any order with Orderless: `srv auth handler`.
- Consult preview keys: use arrow keys to preview, `RET` to accept.

---

## In‑Buffer Completion

- **Corfu**: popup completion at point.
  - Auto popup as you type; accepts with `RET` or `TAB`.
- **Corfu Popupinfo**: small docs tooltip for the current candidate.
- **Cape**: extra completion sources (file, dabbrev, symbol).
  - Manually invoke: `M-x cape-dabbrev`, `cape-file`, etc.

### Tips
- If LSP is active (Eglot), LSP completions come first; Cape sources are tried after.
- If completions feel noisy, temporarily disable dabbrev: `M-: (setq-local completion-at-point-functions (remq #'cape-dabbrev completion-at-point-functions))`

---

## LSP & Diagnostics

- **Eglot** (preferred): auto-starts on `prog-mode`.
  - Start/ensure: `M-x eglot`
  - Rename symbol: `M-x eglot-rename`
  - Format buffer (if server supports): `M-x eglot-format`
  - Code actions: `M-x eglot-code-actions`
- **Flymake**: diagnostics UI used by Eglot (built-in).
  - List errors: `M-x consult-flymake`
- **Flycheck** (optional, not global)**: available for non-LSP modes.
  - Toggle: `M-x flycheck-mode`
  - List errors: `M-x flycheck-list-errors`

> **Note**: Avoid enabling global Flycheck with Eglot to prevent conflicts.

---

## Selection, Editing & Motion

- **Expand Region**: grow selection outward (your favorite).
  - **Key**: `C-]` to expand, `C-M-]` to contract (as configured below)
- **Avy**: quick jump to char/word/line.
  - Examples: `M-x avy-goto-char`, `avy-goto-word-1`, `avy-goto-line`
- **Iedit**: edit all occurrences simultaneously.
  - Start: `M-x iedit-mode`
- **Smartparens**: structural pairs; auto-insert/skip.
  - Toggle: `M-x smartparens-mode`
- **Aggressive Indent**: keeps code aligned while typing (certain modes).
  - Toggle: `M-x aggressive-indent-mode`
- **Undo Tree**: visual undo/redo.
  - Toggle global: `M-x global-undo-tree-mode`

---

## Projects & VCS

- **project.el** (built-in, replaces Projectile)
  - Find file in project: `C-x p f`
  - Switch project: `C-x p p`
  - Search (ripgrep fallback): `C-x p s`
  - Run shell in project: `C-x p !`
- **Magit**
  - Status: `M-x magit-status`
  - Blame: `M-x magit-blame-addition`
- **diff-hl**
  - Fringe diffs in buffers; updates after Magit ops.

### Tips
- `project.el` uses VC root detection; add `.project` file or `.git` root if needed.
- To change default project search backend, customize `project-find-regexp` / Consult bindings.

---

## Shell Path (GUI)

- **exec-path-from-shell**: in GUI, imports your shell’s PATH and env vars.
  - Only runs on macOS/Linux GUI frames.
  - If something is missing, check your login shell rc files.

---

## Treesitter

- **treesit-auto**: prompts to install missing grammars; auto-associates modes.
  - Global mode enabled.
  - Rust example pinned to `v0.23.3` for reproducibility.

---

## Files, HTTP, Proto, Markdown

- **dotenv-mode**: highlights `.env.*` files.
- **restclient**: edit/run HTTP requests in `.http` / `.api` files.
- **protobuf-mode**: `.proto` syntax.
- **markdown-mode**: `README.md` opens in GitHub-flavored mode (gfm).

---

## Docker & Kubernetes

- **docker**: TUI (`C-c d`) for images/containers/volumes.
- **dockerfile-mode** and **docker-compose-mode**: syntax for Dockerfile/compose.
- **kubernetes** + **k8s-mode**: overview and YAML editing helpers.

---

## Dired & Sidebar

- **dired-sidebar**: toggle sidebar with `M-x dired-sidebar-toggle-sidebar`.

---

## Icons & Themes

- **all-the-icons** (run once): `M-x all-the-icons-install-fonts`
- Themes: `ayu-theme`, `zenburn-theme`, `tango-plus-theme`, `solo-jazz-theme`, `catppuccin-theme`
  - Catppuccin flavor set to `latte` by default (light).

---

## Troubleshooting

- **LSP not starting** → `M-x eglot` manually; check `*eglot-events*` buffer size is nonzero.
- **PATH missing** (Mac/GUI) → verify `exec-path-from-shell-initialize` ran; open `M-x getenv` to inspect.
- **Too many completions** → temporarily disable `cape-dabbrev`, or raise `corfu-auto-prefix`.
- **Slow ripgrep** → restrict directory (`consult-ripgrep` with a narrowed `default-directory`).

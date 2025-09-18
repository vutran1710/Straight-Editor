# User-Defined Functions

This file (`lisp/user-defined.el`) contains custom utility functions that enhance the Emacs editing experience with convenient shortcuts and improved behavior.

## Dired Enhancements

### `mydired-sort`
Sorts dired listings with directories first, making directory navigation more intuitive.

### `dired-readin` (advice)
Automatically applies the directory-first sorting whenever dired buffers are refreshed.

## Editing Functions

### `my-fancy-newline`
**Interactive function** - Intelligently adds newlines when cursor is between matching pairs:
- `{}` (curly braces)
- `()` (parentheses) 
- `[]` (square brackets)

Creates proper indentation between the pairs, otherwise acts like `newline-and-indent`.

### `smart-kill-whole-line (&optional arg)`
**Interactive function** - Enhanced version of `kill-whole-line` that:
- Kills the entire line including newline
- Automatically moves cursor back to proper indentation
- Accepts optional argument for number of lines to kill

### `duplicate-line-or-region (&optional n)`
**Interactive function** - Duplicates current line or active region:
- **Without argument**: Duplicates once
- **With positive N**: Makes N copies
- **With negative N**: Comments out original and duplicates the absolute value
- **With active region**: Duplicates the selected region instead of current line

### `smarter-move-beginning-of-line (arg)`
**Interactive function** - Enhanced `C-a` behavior:
- First press: Move to first non-whitespace character
- Second press: Move to actual beginning of line
- Supports prefix arguments for moving multiple lines

### `copy-line (arg)`
**Interactive function** - Advanced line copying with features:
- Copies current line(s) to kill ring without moving cursor
- **Sequential calls**: Appends to previous copy
- **With argument**: Copies multiple lines
- **With active region**: Copies all lines in region
- Always includes newline character, even on last line of buffer

## Buffer Navigation

### `instant-switch-to-previous-buffer`
**Interactive function** - Quick toggle between current and previous buffer:
- First call: Switch to most recently used buffer
- Repeated calls: Toggle back and forth between the two buffers

## Project Management

### Project Prefix Key Bindings
Configures `C-c p` as an additional project prefix (alongside default `C-x p`):

#### Enhanced Project Commands
- **`C-c p s`**: `consult-ripgrep` - Search within project using ripgrep
- **`C-c p B`**: `consult-project-buffer` - Switch between project buffers

#### Project Switch Menu (Emacs 29+)
Customized project switching interface with:
- **`f`**: Find file in project
- **`s`**: Search project with ripgrep (Consult)
- **`b`**: Switch to project buffer
- **`!`**: Open shell in project root
- **`g`**: Open Magit status for project

## Usage Tips

Most of these functions are designed to be bound to convenient key combinations. The interactive functions can be called via `M-x function-name` or assigned to custom keybindings for frequent use.

The project enhancements require the `consult` and `project` packages to be installed and configured.

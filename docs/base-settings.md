# Base Settings Configuration

This file (`lisp/base-settings.el`) contains the fundamental Emacs configuration settings optimized for macOS environments.

## Key Modifier Mappings

- **Option key**: Mapped to Meta
- **Control key**: Remains Control  
- **Command key**: Mapped to Meta

This allows both Option and Command keys to function as Meta keys for Emacs shortcuts.

## User Interface Settings

- **Menu bar**: Disabled (`menu-bar-mode -1`)
- **Scroll bar**: Disabled (`scroll-bar-mode -1`) 
- **Tool bar**: Disabled (`tool-bar-mode -1`)
- **Fringe**: Left fringe of 5 pixels, no right fringe
- **Line numbers**: Enabled globally
- **Startup screen**: Disabled for faster startup

## Font and Display

- **Font**: Fira Code size 13
- **Line spacing**: 1 pixel between lines
- **Pixel scroll precision**: Enabled for smoother scrolling

## Window Configuration

- **Default size**: 130 columns × 60 rows
- **Default position**: 50 pixels from left, 30 pixels from top
- **Default directory**: `/Users/vutran/Works/`

## Editor Behavior

### File Management
- Auto-save disabled
- Backup files disabled
- Recent files menu: 15 items max
- Final newline required on save
- Whitespace cleanup on save

### Indentation and Formatting
- Spaces instead of tabs
- JavaScript indent: 2 spaces

### User Experience
- Short yes/no prompts (y/n instead of yes/no)
- Delete selection mode enabled
- Silent bell (no audio/visual bell)
- Recent files mode enabled

### Programming Features
- **Comment shortcut**: `M-;` bound to `comment-line` in programming modes

### Remote Access
- **TRAMP default method**: SSH for remote file editing

## Startup Message

Custom scratch buffer message: ";; Don\`t Complain!"

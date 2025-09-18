# AI Integration Setup

This document explains how the AI functionality is configured in this Emacs setup through `vutr-ai.el`.

## Overview

The AI module provides three main components:

1. **Copilot** - Inline AI autocomplete with ghost text
2. **Copilot Chat** - Side-panel AI agent for conversations
3. **Aider** - Repository-aware AI diff editing tool

## Components

### Copilot (Inline Autocomplete)

- Automatically enabled in `prog-mode` buffers
- Provides ghost text suggestions as you type
- Includes performance guards for large buffers (>200k characters)
- Excludes temporary buffers and minibuffers

**Toggle Function:**
- `vutr/copilot-toggle` - Enable/disable Copilot in current buffer

### Copilot Chat

- Side-panel interface for AI conversations
- Uses shell-maker frontend with streaming support
- Available commands:
  - `copilot-chat-display` - Show chat panel
  - `copilot-chat-ask` - Ask a question
  - `copilot-chat-explain` - Explain code
  - `copilot-chat-fix` - Fix code issues
  - `copilot-chat-review` - Review code
  - `copilot-chat-reset` - Reset conversation

### Aider Integration

- Repository-aware AI editing with diff preview
- Integrated with Magit for git workflow
- Provides AI-powered code changes across multiple files

## Aider Configuration

To make Aider work properly, you need to create two configuration files in your `.emacs.d` directory:

### Required Files

1. **`.emacs.d/.aider.conf.yaml`** - Main Aider configuration
2. **`.emacs.d/.aider.model.settings.yml`** - Model-specific settings

These files should be placed directly in your Emacs configuration directory (`.emacs.d`). Without these configuration files, Aider may not function correctly.

## Environment Requirements

- **macOS GUI Users**: The module automatically initializes `exec-path-from-shell` to ensure proper PATH environment
- **Aider Installation**: Install via `pipx install aider-chat` or `pip install -U aider-chat`

## Performance Considerations

- Copilot is disabled for buffers larger than 300k characters
- Temporary buffers and minibuffers are excluded from Copilot
- Auto-revert mode is enabled globally for Aider file synchronization

## Package Dependencies

- `copilot` - Main Copilot package
- `copilot-chat` - Chat interface
- `aider` - Aider integration
- `exec-path-from-shell` - Environment setup (macOS/GUI only)

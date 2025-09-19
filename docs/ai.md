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

```yaml
model: github_copilot/claude-sonnet-4
weak-model: github_copilot/gpt-4o-mini
show-model-warnings: false
auto-accept-architect: false
auto-commits: false
```

2. **`.emacs.d/.aider.model.settings.yml`** - Model-specific settings
```yaml
- name: github_copilot/claude-sonnet-4
  edit_format: diff
  extra_params:
    max_tokens: 80000
    extra_headers:
      User-Agent: GithubCopilot/1.155.0
      Editor-Plugin-Version: copilot/1.155.0
      Editor-Version: vscode/1.85.1
      Copilot-Integration-Id: vscode-chat

- name: github_copilot/gpt-4o-mini
  edit_format: diff
  extra_params:
    max_tokens: 80000
    extra_headers:
      User-Agent: GithubCopilot/1.155.0
      Editor-Plugin-Version: copilot/1.155.0
      Editor-Version: vscode/1.85.1
      Copilot-Integration-Id: vscode-chat
```

These files should be placed directly in your Emacs configuration directory (`.emacs.d`). Without these configuration files, Aider may not function correctly.

### Listing Available Models

To discover what models are available from GitHub Copilot, you can query the API directly:

```bash
curl -s https://api.githubcopilot.com/models \
-H "Authorization: Bearer ${oath_token found from ~/.config/github-copilot/apps.json}" \
-H "Content-Type: application/json" \
-H "Copilot-Integration-Id: vscode-chat" | jq -r '.data[].id'
```

This will return a list of available model IDs that you can use in your Aider configuration files. The OAuth token can be found in your GitHub Copilot configuration at `~/.config/github-copilot/apps.json`.

## Git Workflow

### Committing Aider Changes

When Aider makes changes to your files, you'll want to commit them using the integrated Magit workflow:

1. **Review Changes**: Aider automatically shows diffs before applying changes
2. **Check Status**: Use `magit-status` to see all modified files
3. **Stage Changes**: Stage the files you want to commit using Magit's staging interface
4. **Commit**: Create a commit with an appropriate message describing the AI-assisted changes
5. **Push**: Push your changes to the remote repository as needed

**Best Practices:**
- Review all AI-generated changes before committing
- Write descriptive commit messages that mention AI assistance
- Test the code after AI changes but before committing
- Use Aider's built-in git integration for automatic commits when desired

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

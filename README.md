# 🚀 Modern Emacs Configuration

A comprehensive, modular Emacs configuration designed for modern development workflows with AI integration, language-specific tooling, and streamlined productivity features.

## ✨ Features

### 🤖 AI-Powered Development
- **GitHub Copilot Integration** - Inline autocomplete with ghost text suggestions
- **Copilot Chat** - Side-panel AI assistant for code explanations and fixes
- **Aider Integration** - Repository-aware AI diff editing with Magit workflow

### 🛠 Language Support
- **Python** - Virtual environment detection with flycheck integration
- **Clojure** - CIDER-based development environment
- **Go** - Complete Go development setup
- **Rust** - Modern Rust toolchain with Eglot LSP
- **Web Development** - TypeScript, React, and modern web frameworks
- **Org Mode** - Enhanced productivity and documentation features

### ⚡ Core Features
- **Modular Architecture** - Clean separation across multiple configuration files
- **Smart Completion** - Vertico + Orderless + Consult + Corfu stack
- **Performance Optimized** - Guards against large buffers and resource usage
- **Cross-Platform** - Optimized for macOS with cross-platform compatibility

## 📁 Project Structure

```
.
├── init.el                     # Main entry point
├── vutr.el                     # Module loader
├── lisp/
│   ├── base-settings.el        # Core Emacs settings (fonts, UI, behavior)
│   ├── global-packages-setup.el # Essential packages (completion, LSP, navigation)
│   ├── keybindings.el          # Global keybinding definitions
│   ├── user-defined.el         # Custom utility functions
│   ├── vutr-ai.el             # AI integration (Copilot + Aider)
│   ├── vutr-clojure.el        # Clojure development
│   ├── vutr-go.el             # Go development
│   ├── vutr-org.el            # Org mode enhancements
│   ├── vutr-python.el         # Python development
│   ├── vutr-rust.el           # Rust development
│   └── vutr-web.el            # Web development (JS/TS/React)
└── docs/                       # Comprehensive documentation
```

## 🚀 Quick Start

### Prerequisites

- **Emacs 27.1+** (recommended: Emacs 29+)
- **Git** for package management
- **Internet connection** for initial package installation

### Installation

1. **Backup existing configuration:**
   ```bash
   mv ~/.emacs.d ~/.emacs.d.backup
   ```

2. **Clone this configuration:**
   ```bash
   git clone <your-repo-url> ~/.emacs.d
   cd ~/.emacs.d
   ```

3. **Start Emacs** - packages install automatically on first run

### AI Setup (Optional)

For AI features, install Aider and configure GitHub Copilot:

```bash
pipx install aider-chat
```

Create `.aider.conf.yaml` and `.aider.model.settings.yml` in your `.emacs.d` directory. See [docs/ai.md](docs/ai.md) for complete setup instructions.

## 🎯 Key Features

### Completion & Navigation Stack
- **Vertico** - Vertical completion interface
- **Orderless** - Flexible matching styles
- **Consult** - Enhanced search and navigation
- **Corfu** - In-buffer completion popup
- **Marginalia** - Rich completion annotations

### Core Productivity Tools
- **Magit** - Git integration
- **Project.el** - Project management
- **Avy** - Quick character/word jumping
- **Expand Region** - Smart text selection
- **Smartparens** - Structured editing

### Language Development
Each language module provides LSP integration, syntax highlighting, formatting, testing, and build tool support.

## 📚 Documentation

Detailed documentation available for each component:

- **[AI Integration](docs/ai.md)** - Complete AI setup and usage guide
- **[Base Settings](docs/base-settings.md)** - Core configuration details
- **[Global Packages](docs/global-packages.md)** - Package stack overview
- **[User Functions](docs/user-defined.md)** - Custom utility functions

## 🔧 Customization

### Enabling Language Modules

Edit `vutr.el` to uncomment desired language modules:

```elisp
;; Uncomment modules you want to use
(require 'vutr-python)
(require 'vutr-web)
(require 'vutr-clojure)
```

### Key Customization Areas

- **Keybindings** - Edit `lisp/keybindings.el`
- **Themes** - Available in `global-packages-setup.el`
- **LSP Settings** - Per-language module configuration
- **AI Features** - Toggle in `vutr-ai.el`

### Performance Notes

The configuration includes optimizations for:
- Large buffer handling
- Lazy package loading
- AI feature resource management
- Startup performance

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make changes with appropriate documentation
4. Test thoroughly
5. Submit a pull request

## 📝 License

This configuration is provided as-is for educational and personal use. Individual packages maintain their respective licenses.

---

**Happy Coding!** 🎉

*For detailed usage instructions, see the documentation in the `docs/` directory.*

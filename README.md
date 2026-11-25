# Homebrew tap for LiteNotch

## Channels

| Channel | Install | Update |
|---|---|---|
| Stable (regular releases) | `brew install --cask tangnatta/litenotch/litenotch` | `brew update && brew upgrade --cask litenotch` |
| Beta (pre-releases, `-beta`) | `brew install --cask tangnatta/litenotch/litenotch@beta` | `brew update && brew upgrade --cask litenotch@beta` |

Both install the same app, so only one can be installed at a time. To switch,
uninstall the other first (`brew uninstall --cask litenotch@beta`, or
`litenotch` to go the other way).

The beta cask appears with the first pre-release published after the channels
were introduced.

[LiteNotch](https://github.com/tangnatta/LiteNotch) turns the MacBook notch into
a small control centre. This repository only holds its Homebrew cask; each
LiteNotch release updates `version` and `sha256` here automatically. Report
problems in the [LiteNotch repository](https://github.com/tangnatta/LiteNotch/issues).

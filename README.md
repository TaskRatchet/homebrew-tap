# TaskRatchet Homebrew tap

Homebrew formulae for TaskRatchet command-line tools.

```sh
brew install taskratchet/tap/taskratchet
```

Or add the tap first, then install by name:

```sh
brew tap taskratchet/tap
brew install taskratchet
```

## What's here

| Formula | What it installs |
|---|---|
| `taskratchet` | The TaskRatchet CLI — a pre-built Go binary for macOS and Linux, arm64 and amd64. |

## How it stays current

`Formula/taskratchet.rb` is updated automatically. The `Release CLI` workflow in the TaskRatchet monorepo cross-compiles the binaries, publishes them as GitHub release assets on [`PinePeakDigital/taskratchet-cli-releases`](https://github.com/PinePeakDigital/taskratchet-cli-releases), then rewrites this formula's version, release tag and four `sha256` values and commits the result here.

The marker comments in the formula (`# tr-sha-darwin-arm64` and friends) are what that update step keys on — don't remove them.

Nothing is compiled at install time; the formula downloads the published binary for the host platform.

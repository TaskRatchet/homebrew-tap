# Formula for the TaskRatchet CLI.
#
# Binaries are pre-built Go executables published by the `Release CLI` workflow
# in the private taskratchet monorepo; they land as GitHub release assets on
# PinePeakDigital/taskratchet-cli-releases. Nothing is compiled here.
#
# This file is machine-updated: release-cli.yml rewrites the version, the four
# sha256 values and the tag in each URL on every CLI release. Keep the marker
# comments intact — the update step keys on them.
class Taskratchet < Formula
  desc "Alpha CLI for TaskRatchet, task management with financial stakes"
  homepage "https://taskratchet.com"
  version "0.1.0" # tr-version
  # Declared in the taskratchet monorepo's root package.json.
  license "ISC"

  on_macos do
    on_arm do
      url "https://github.com/PinePeakDigital/taskratchet-cli-releases/releases/download/cli-vv0.1.0/taskratchet-darwin-arm64"
      sha256 "11b2e2afe78beef365f3d3b704a9969ebf6ec911d5cf9cb498170b2d4dfaddc8" # tr-sha-darwin-arm64
    end
    on_intel do
      url "https://github.com/PinePeakDigital/taskratchet-cli-releases/releases/download/cli-vv0.1.0/taskratchet-darwin-amd64"
      sha256 "2030dfac28e71aa8b31ff583414fd6e4462c2d4f74d9ebc1ff405dcdc8ac1bdd" # tr-sha-darwin-amd64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/PinePeakDigital/taskratchet-cli-releases/releases/download/cli-vv0.1.0/taskratchet-linux-arm64"
      sha256 "03e7e77e57e4602ec8235912d423b0a7f1e428817ab32a21b8395e9e4b34be67" # tr-sha-linux-arm64
    end
    on_intel do
      url "https://github.com/PinePeakDigital/taskratchet-cli-releases/releases/download/cli-vv0.1.0/taskratchet-linux-amd64"
      sha256 "4fe38e3a8493b4d6311ca57d5469838adddb51144e0c4fd91524632780a70328" # tr-sha-linux-amd64
    end
  end

  def install
    # The asset is a bare, platform-suffixed executable; Homebrew saves it under
    # the URL's basename, so install it under the plain command name.
    bin.install Dir["taskratchet-*"].first => "taskratchet"
  end

  def caveats
    <<~EOS
      The TaskRatchet CLI is alpha. Commands, flags and output format may change
      between releases. Pin a version if you script against it.
    EOS
  end

  test do
    assert_match "taskratchet version", shell_output("#{bin}/taskratchet --version")
  end
end

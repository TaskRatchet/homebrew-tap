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
  version "0.4.1" # tr-version
  # Declared in the taskratchet monorepo's root package.json.
  license "ISC"

  on_macos do
    on_arm do
      url "https://github.com/PinePeakDigital/taskratchet-cli-releases/releases/download/cli-v0.4.1/taskratchet-darwin-arm64"
      sha256 "f41e3980b1a4365124031eb2c28274798b93a8b98f15802a95ae525ddeb9ec03" # tr-sha-darwin-arm64
    end
    on_intel do
      url "https://github.com/PinePeakDigital/taskratchet-cli-releases/releases/download/cli-v0.4.1/taskratchet-darwin-amd64"
      sha256 "8c9f9f21233f4290ccca963f4e89762876f612e1e51eb34b56cb4b0fdb93bcdd" # tr-sha-darwin-amd64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/PinePeakDigital/taskratchet-cli-releases/releases/download/cli-v0.4.1/taskratchet-linux-arm64"
      sha256 "e779cefc88d233b62433388191c38d25b8d3252dc68424a3b77aba9450f1d7e3" # tr-sha-linux-arm64
    end
    on_intel do
      url "https://github.com/PinePeakDigital/taskratchet-cli-releases/releases/download/cli-v0.4.1/taskratchet-linux-amd64"
      sha256 "75c50a8bd84bb5eb27c45050abce131358a1290e2772c8ad45854a909a1f976f" # tr-sha-linux-amd64
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

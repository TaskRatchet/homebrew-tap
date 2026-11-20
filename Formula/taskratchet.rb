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
  version "0.5.0" # tr-version
  # Declared in the taskratchet monorepo's root package.json.
  license "ISC"

  on_macos do
    on_arm do
      url "https://github.com/PinePeakDigital/taskratchet-cli-releases/releases/download/cli-v0.5.0/taskratchet-darwin-arm64"
      sha256 "cf865fd032709ff5086e1020cd98cb1c695722c55a5a7e6aa781df554b4cf964" # tr-sha-darwin-arm64
    end
    on_intel do
      url "https://github.com/PinePeakDigital/taskratchet-cli-releases/releases/download/cli-v0.5.0/taskratchet-darwin-amd64"
      sha256 "b217d089213e03d9b373c0de20f182b2c91bdd1a9b65d486b46968ce3abeb41d" # tr-sha-darwin-amd64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/PinePeakDigital/taskratchet-cli-releases/releases/download/cli-v0.5.0/taskratchet-linux-arm64"
      sha256 "867da265a6a0f1af7e1ca82f46208a70b231391b074f49edb4cf023be76d153f" # tr-sha-linux-arm64
    end
    on_intel do
      url "https://github.com/PinePeakDigital/taskratchet-cli-releases/releases/download/cli-v0.5.0/taskratchet-linux-amd64"
      sha256 "0dc7dcefacdebcec8f795c3e7dec99786951a758b629a72a2c55a81205c7c4ff" # tr-sha-linux-amd64
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

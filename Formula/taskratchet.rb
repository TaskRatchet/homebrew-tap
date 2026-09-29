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
  version "0.2.0" # tr-version
  # Declared in the taskratchet monorepo's root package.json.
  license "ISC"

  on_macos do
    on_arm do
      url "https://github.com/PinePeakDigital/taskratchet-cli-releases/releases/download/cli-v0.2.0/taskratchet-darwin-arm64"
      sha256 "9c01993df92ec8a478ac6ba98e8b505b1d2eb17bcbf4677945b60004b7465496" # tr-sha-darwin-arm64
    end
    on_intel do
      url "https://github.com/PinePeakDigital/taskratchet-cli-releases/releases/download/cli-v0.2.0/taskratchet-darwin-amd64"
      sha256 "c34ac4e452af5f81b8768c4b4afc55f8813fcaf1c81d21cc86ea8d2466222982" # tr-sha-darwin-amd64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/PinePeakDigital/taskratchet-cli-releases/releases/download/cli-v0.2.0/taskratchet-linux-arm64"
      sha256 "a5deccada320d50a4e05380e415897f50f1f1134998b96fdea9bf11d9a9c8137" # tr-sha-linux-arm64
    end
    on_intel do
      url "https://github.com/PinePeakDigital/taskratchet-cli-releases/releases/download/cli-v0.2.0/taskratchet-linux-amd64"
      sha256 "03fa6a9eb40a7036a41183014fd4d701f5a1b7d3472ed655574ede86562d69b4" # tr-sha-linux-amd64
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

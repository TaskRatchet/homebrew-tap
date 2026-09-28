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
  desc "Command-line interface for TaskRatchet, task management with financial stakes"
  homepage "https://taskratchet.com"
  # Declared in the taskratchet monorepo's root package.json.
  license "ISC"
  version "0.1.0" # tr-version

  on_macos do
    on_arm do
      url "https://github.com/PinePeakDigital/taskratchet-cli-releases/releases/download/cli-vv0.1.0/taskratchet-darwin-arm64"
      sha256 "c5b2a1b2d546f9e1c2e236e07903a75128d4c49fcca617c1476bcb5db773cc0a" # tr-sha-darwin-arm64
    end
    on_intel do
      url "https://github.com/PinePeakDigital/taskratchet-cli-releases/releases/download/cli-vv0.1.0/taskratchet-darwin-amd64"
      sha256 "5724cc86ee322efcecfbb654fd528c0745346ee37ca579bc3372028a5d4fa9a2" # tr-sha-darwin-amd64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/PinePeakDigital/taskratchet-cli-releases/releases/download/cli-vv0.1.0/taskratchet-linux-arm64"
      sha256 "39f93ae713f1c63ad57df527a232d6e842f7dee4b165585be28a67183b2bcb53" # tr-sha-linux-arm64
    end
    on_intel do
      url "https://github.com/PinePeakDigital/taskratchet-cli-releases/releases/download/cli-vv0.1.0/taskratchet-linux-amd64"
      sha256 "0fceb2105e60ea5468d064df296567d5aeaee35fc24a7bcfad0307231cb96b27" # tr-sha-linux-amd64
    end
  end

  def install
    # The asset is a bare, platform-suffixed executable; Homebrew saves it under
    # the URL's basename, so install it under the plain command name.
    bin.install Dir["taskratchet-*"].first => "taskratchet"
  end

  test do
    assert_match "taskratchet version", shell_output("#{bin}/taskratchet --version")
  end
end

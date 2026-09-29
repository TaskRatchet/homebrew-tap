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
  version "0.3.0" # tr-version
  # Declared in the taskratchet monorepo's root package.json.
  license "ISC"

  on_macos do
    on_arm do
      url "https://github.com/PinePeakDigital/taskratchet-cli-releases/releases/download/cli-v0.3.0/taskratchet-darwin-arm64"
      sha256 "a1fcf032636281232e50bfed667404e25a79835c9cc27942c19029e4e5519b86" # tr-sha-darwin-arm64
    end
    on_intel do
      url "https://github.com/PinePeakDigital/taskratchet-cli-releases/releases/download/cli-v0.3.0/taskratchet-darwin-amd64"
      sha256 "a1e5a3db8bc4158e23f50857e2f2aaa1db5e70bd57801c824015ce32295f335d" # tr-sha-darwin-amd64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/PinePeakDigital/taskratchet-cli-releases/releases/download/cli-v0.3.0/taskratchet-linux-arm64"
      sha256 "34766292333491bfee30367f96cd250e1059988236aea88490b46508ebef7eeb" # tr-sha-linux-arm64
    end
    on_intel do
      url "https://github.com/PinePeakDigital/taskratchet-cli-releases/releases/download/cli-v0.3.0/taskratchet-linux-amd64"
      sha256 "68ef0efd9cebeab2bea7c7402969ad7110d550a49f0b64514f0ceceb81bcefb6" # tr-sha-linux-amd64
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

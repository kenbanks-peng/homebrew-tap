class RexStatusline < Formula
  desc "Status line for Rex, rendered with Oh My Posh"
  homepage "https://github.com/kenbanks-peng/rex-statusline"
  version "1.0.1"

  depends_on "oh-my-posh"

  on_macos do
    on_arm do
      url "https://github.com/kenbanks-peng/rex-statusline/releases/download/v#{version}/rex-statusline-darwin-arm64.tar.gz"
      sha256 "ebd78dfa74975f79fc137ad934b549c0fd4f80bd266069e8e5ba93cdf742fb65"
    end
    on_intel do
      url "https://github.com/kenbanks-peng/rex-statusline/releases/download/v#{version}/rex-statusline-darwin-amd64.tar.gz"
      sha256 "4d7ee2fe1d4ef0a7392516155d4d4bbde47340493d367cd80e431f2924d1ff15"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kenbanks-peng/rex-statusline/releases/download/v#{version}/rex-statusline-linux-arm64.tar.gz"
      sha256 "00f0b148fc799917758b68a0055201e811a0eb6ac4562bb096c7e8ff71881430"
    end
    on_intel do
      url "https://github.com/kenbanks-peng/rex-statusline/releases/download/v#{version}/rex-statusline-linux-amd64.tar.gz"
      sha256 "274d2969e8175347c7ce2d6336e1254c81a9a06939a0be8c9290f2f710c512b4"
    end
  end

  def install
    bin.install "rex-statusline"
  end

  def caveats
    <<~EOS
      Requires Rex: https://www.superlogical.com/rex/docs
      Ensure rex is on your PATH.

      Add shell integration to ~/.zshrc:
        eval "$(rex-statusline init zsh)"
      Or to ~/.bashrc:
        eval "$(rex-statusline init bash)"

      Start status lines and enable login startup:
        rex-statusline add
      Stop status lines (leaves login startup enabled):
        rex-statusline remove
    EOS
  end

  test do
    assert_equal "v#{version}", shell_output("#{bin}/rex-statusline --version").strip
    assert_match "rex-statusline", shell_output("#{bin}/rex-statusline init bash")
    assert_match "rex-statusline", shell_output("#{bin}/rex-statusline init zsh")
  end
end

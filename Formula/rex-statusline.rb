class RexStatusline < Formula
  desc "Status line for Rex, rendered with Oh My Posh"
  homepage "https://github.com/kenbanks-peng/rex-statusline"
  version "1.0.2"

  depends_on "oh-my-posh"

  on_macos do
    on_arm do
      url "https://github.com/kenbanks-peng/rex-statusline/releases/download/v#{version}/rex-statusline-darwin-arm64.tar.gz"
      sha256 "fa354dc34c31a62f5ef45fa12b44648b88ad7f25201a7daf907f30a64d653ba5"
    end
    on_intel do
      url "https://github.com/kenbanks-peng/rex-statusline/releases/download/v#{version}/rex-statusline-darwin-amd64.tar.gz"
      sha256 "d6a9141e39acfdada2d0f666feca9299a10e691517420d40d6c7f92d65abb06a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kenbanks-peng/rex-statusline/releases/download/v#{version}/rex-statusline-linux-arm64.tar.gz"
      sha256 "2b97c36ebfba58d1c15892dbe0b573e3845b497c8de282cdcdbfdc3e6627d818"
    end
    on_intel do
      url "https://github.com/kenbanks-peng/rex-statusline/releases/download/v#{version}/rex-statusline-linux-amd64.tar.gz"
      sha256 "16b4477f77817b44f137658003261aa6bae0f8cbc5e6d9e7acb744df7c56dfc2"
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

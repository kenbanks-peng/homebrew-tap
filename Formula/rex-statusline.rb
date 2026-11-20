class RexStatusline < Formula
  desc "Status line for Rex, rendered with Oh My Posh"
  homepage "https://github.com/kenbanks-peng/rex-statusline"
  version "1.0.4"

  depends_on "oh-my-posh"

  on_macos do
    on_arm do
      url "https://github.com/kenbanks-peng/rex-statusline/releases/download/v#{version}/rex-statusline-darwin-arm64.tar.gz"
      sha256 "e870d2cebc5335de48bb3236e7ec5a40cfb9201af0e1baad64d72c2930298dcc"
    end
    on_intel do
      url "https://github.com/kenbanks-peng/rex-statusline/releases/download/v#{version}/rex-statusline-darwin-amd64.tar.gz"
      sha256 "4cec563f63e8f363372b97474b2772a5bc9dc1562ad89c60d65513a3a659851a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kenbanks-peng/rex-statusline/releases/download/v#{version}/rex-statusline-linux-arm64.tar.gz"
      sha256 "70de58f651c4b700e443bc57de2df55b1524393268c016f740f5a8964cacd7a2"
    end
    on_intel do
      url "https://github.com/kenbanks-peng/rex-statusline/releases/download/v#{version}/rex-statusline-linux-amd64.tar.gz"
      sha256 "ef160b89a812bf5c4a1d7ad84733721c7a54f9176202048574cc2d627d38caf1"
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

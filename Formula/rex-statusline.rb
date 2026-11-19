class RexStatusline < Formula
  desc "Status line for Rex, rendered with Oh My Posh"
  homepage "https://github.com/kenbanks-peng/rex-statusline"
  version "1.0.3"

  depends_on "oh-my-posh"

  on_macos do
    on_arm do
      url "https://github.com/kenbanks-peng/rex-statusline/releases/download/v#{version}/rex-statusline-darwin-arm64.tar.gz"
      sha256 "d1de97ce202dd41f5b0b25bb8fe2294cc94aefaa7b5217e9794cc0f46c4e6b73"
    end
    on_intel do
      url "https://github.com/kenbanks-peng/rex-statusline/releases/download/v#{version}/rex-statusline-darwin-amd64.tar.gz"
      sha256 "7f0777c2de2c034e685b9c97fa40b74a884778d12e1140819e1953acba49a02d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kenbanks-peng/rex-statusline/releases/download/v#{version}/rex-statusline-linux-arm64.tar.gz"
      sha256 "788793de20889c20887590d9d156cb24c62c7d5fd217b6525011357a7388ecce"
    end
    on_intel do
      url "https://github.com/kenbanks-peng/rex-statusline/releases/download/v#{version}/rex-statusline-linux-amd64.tar.gz"
      sha256 "7daf4523ae6372156db15849840bfe56a4fbba15f5c7fe18d8dfa95d4fe542a2"
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

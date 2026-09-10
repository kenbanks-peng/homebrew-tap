cask "athas-editor" do
  arch arm: "aarch64", intel: "x64"

  version "0.14.2"
  sha256 arm:   "a4a3c278dbe3bfc2f6912949aff01e198a987672048194ff46d26b195beabe64",
         intel: "74876fc3976634fcdb64876e1f7dbc4b43d1057ef16f8f1bcc541a5f6eda377b"

  url "https://github.com/athasdev/athas/releases/download/v#{version}/Athas_#{version}_#{arch}.dmg",
      verified: "github.com/athasdev/athas/"
  name "Athas"
  desc "AI-powered code editor"
  homepage "https://github.com/athasdev/athas"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Athas.app"

  zap trash: [
    "~/Library/Application Support/com.code.athas",
    "~/Library/Caches/com.code.athas",
    "~/Library/Logs/com.code.athas",
    "~/Library/Preferences/com.code.athas.plist",
    "~/Library/WebKit/com.code.athas",
  ]
end

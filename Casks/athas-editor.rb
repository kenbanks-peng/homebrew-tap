cask "athas-editor" do
  version "0.1.2"

  on_arm do
    sha256 "df49108f61f7bc5ca0d2ec0fa3cacb8ac5915983a00c226636f17d2891b995bb"

    url "https://github.com/athasdev/athas/releases/download/v#{version}/Athas_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "e82d38abaa4925b8171951428008e6f770e157f64bb9a21f3faa1d8a358dfc58"

    url "https://github.com/athasdev/athas/releases/download/v#{version}/Athas_#{version}_x64.dmg"
  end

  name "Athas"
  desc "AI-powered code editor"
  homepage "https://github.com/athasdev/athas"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Athas.app"

  zap trash: [
    "~/Library/Application Support/com.athas.dev",
    "~/Library/Caches/com.athas.dev",
    "~/Library/Preferences/com.athas.dev.plist",
    "~/Library/Saved Application State/com.athas.dev.savedState",
  ]
end

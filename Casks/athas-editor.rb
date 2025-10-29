cask "athas-editor" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.2"
  sha256 arm:   "df49108f61f7bc5ca0d2ec0fa3cacb8ac5915983a00c226636f17d2891b995bb",
         intel: "e82d38abaa4925b8171951428008e6f770e157f64bb9a21f3faa1d8a358dfc58"

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

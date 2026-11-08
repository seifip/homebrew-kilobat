cask "kilobat" do
  version "1.39.3"
  sha256 "13cdc0989d9087214da6c489ccf735a59394520cbbb71289107dd96a0c483252"

  url "https://kilobat.app/downloads/Kilobat-1.39.3.dmg"
  name "Kilobat"
  desc "Menu-bar network monitor: per-app traffic, Wi-Fi diagnostics and data budgets"
  homepage "https://kilobat.app/"

  livecheck do
    url "https://kilobat.app/updates/v1/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Kilobat.app"

  uninstall quit: "co.seifi.kilobat"

  zap trash: [
    "~/Library/Application Support/Kilobat",
    "~/Library/Caches/co.seifi.kilobat",
    "~/Library/HTTPStorages/co.seifi.kilobat",
    "~/Library/Preferences/co.seifi.kilobat.plist",
  ]

  caveats <<~EOS
    Before removing Kilobat, choose Settings › Remove Kilobat › Remove Network Filter in the app.
    The app and the CLI are free; Kilobat Pro adds rules, history and radar.
  EOS
end

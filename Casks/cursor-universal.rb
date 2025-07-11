cask "cursor-universal" do
  version "1.2.4,2025-07-10,a8e95743c5268be73767c46944a71f4465d05c90"
  sha256 arm:   "ed0ee60f257b422f0934d6b9a298523c741677b0b9333a33b566910e672f55b1",
         intel: "ed0ee60f257b422f0934d6b9a298523c741677b0b9333a33b566910e672f55b1"

  url "https://downloads.cursor.com/production/#{version.csv.third}/darwin/universal/Cursor-darwin-universal.dmg"
  name "Cursor"
  desc "Яджипитуны вперед!!!"
  homepage "https://www.cursor.com/"

  livecheck do
    url "https://api2.cursor.sh/updates/api/update/darwin-universal/cursor/0.0.0/"
    regex(%r{/production/(\h+)/darwin/universal/Cursor[._-]darwin[._-]universal\.dmg}i)
    strategy :json do |json, regex|
      match = json["url"]&.match(regex)
      next if match.blank?

      "#{json["name"]},#{match[1]}"
    end
  end

  auto_updates true
  depends_on macos: ">= :catalina"

  app "Cursor.app"
  binary "#{appdir}/Cursor.app/Contents/Resources/app/bin/code", target: "cursor"

  zap trash: [
    "~/.cursor",
    "~/.cursor-tutor",
    "~/Library/Application Support/Caches/cursor-updater",
    "~/Library/Application Support/Cursor",
    "~/Library/Caches/com.todesktop.*",
    "~/Library/Caches/com.todesktop.*.ShipIt",
    "~/Library/HTTPStorages/com.todesktop.*",
    "~/Library/Logs/Cursor",
    "~/Library/Preferences/ByHost/com.todesktop.*.ShipIt.*.plist",
    "~/Library/Preferences/com.todesktop.*.plist",
    "~/Library/Saved Application State/com.todesktop.*.savedState",
    "~/Library/Saved Application State/todesktop.com.ToDesktop-Installer.savedState",
  ]
end

cask "dkd-sprint-tracker" do
  version "1.2.0"
  sha256 "86302b365a33fbac5f4f255fde8f8d0a0128edf4b108a2002f5dffc5df8b6e94"

  url "https://github.com/dkd-dobberkau/DkdSprintTracker/releases/download/v#{version}/dkd-Sprint-Tracker-v#{version}.zip"
  name "dkd Sprint Tracker"
  desc "macOS menu bar app showing the current dkd sprint number and working day"
  homepage "https://github.com/dkd-dobberkau/DkdSprintTracker"

  depends_on macos: ">= :ventura"

  app "dkd Sprint Tracker.app"

  zap trash: [
    "~/Library/Preferences/de.dkd.sprint-tracker.plist",
  ]
end

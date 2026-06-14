cask "dkd-sprint-tracker" do
  version "1.3.0"
  sha256 "faf5ce7ceda8db1ec67362df241f39db4fa50ce352b3a79dfc3c03f0dc1facf1"

  url "https://github.com/dkd-dobberkau/DkdSprintTracker/releases/download/v#{version}/DkdSprintTracker-#{version}.dmg"
  name "dkd Sprint Tracker"
  desc "macOS menu bar app showing the current dkd sprint number and working day"
  homepage "https://github.com/dkd-dobberkau/DkdSprintTracker"

  depends_on macos: :ventura

  app "dkd Sprint Tracker.app"

  zap trash: [
    "~/Library/Preferences/de.dkd.sprint-tracker.plist",
  ]
end

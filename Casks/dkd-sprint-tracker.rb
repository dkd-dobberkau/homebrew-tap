cask "dkd-sprint-tracker" do
  version "1.1.0"
  sha256 "ce7f923057ba179908a672692e5bbfaf281ed84d415a5084f631c34bab936757"

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

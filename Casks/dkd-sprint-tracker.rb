cask "dkd-sprint-tracker" do
  version "1.2.0"
  sha256 "c7b5d928016ba1dbd0416e3c29371d383ae55822e87d651d9633bb07c1515699"

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

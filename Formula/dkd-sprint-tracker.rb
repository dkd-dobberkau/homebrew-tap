class DkdSprintTracker < Formula
  desc "macOS menu bar app showing the current dkd sprint number and working day"
  homepage "https://github.com/dkd-dobberkau/DkdSprintTracker"
  url "https://github.com/dkd-dobberkau/DkdSprintTracker/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "59c3ef83dd16d2e79ea1122f1a57d1d77f904b7c667092d74e4caba159a90b62"
  license "MIT"

  depends_on :macos
  depends_on :xcode => ["14.0", :build]

  def install
    system "swiftc", "-o", "DkdSprintTracker-arm64",
           "-framework", "Cocoa",
           "-framework", "ServiceManagement",
           "-target", "arm64-apple-macos13",
           "DkdSprintTracker.swift"
    system "swiftc", "-o", "DkdSprintTracker-x86_64",
           "-framework", "Cocoa",
           "-framework", "ServiceManagement",
           "-target", "x86_64-apple-macos13",
           "DkdSprintTracker.swift"
    system "lipo", "-create", "-output", "DkdSprintTracker",
           "DkdSprintTracker-arm64", "DkdSprintTracker-x86_64"

    # Generate icon
    system "swiftc", "-o", "generate_icon", "-framework", "Cocoa", "generate_icon.swift"
    system "./generate_icon"
    system "iconutil", "-c", "icns", "AppIcon.iconset", "-o", "AppIcon.icns"

    # Create app bundle
    app_name = "dkd Sprint Tracker.app"
    (buildpath/app_name/"Contents/MacOS").mkpath
    (buildpath/app_name/"Contents/Resources").mkpath

    cp "DkdSprintTracker", buildpath/app_name/"Contents/MacOS/DkdSprintTracker"
    cp "AppIcon.icns", buildpath/app_name/"Contents/Resources/AppIcon.icns"

    (buildpath/app_name/"Contents/Info.plist").write <<~PLIST
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
      <dict>
          <key>CFBundleName</key>
          <string>dkd Sprint Tracker</string>
          <key>CFBundleDisplayName</key>
          <string>dkd Sprint Tracker</string>
          <key>CFBundleIdentifier</key>
          <string>de.dkd.sprint-tracker</string>
          <key>CFBundleVersion</key>
          <string>#{version}</string>
          <key>CFBundleShortVersionString</key>
          <string>#{version}</string>
          <key>CFBundleExecutable</key>
          <string>DkdSprintTracker</string>
          <key>CFBundlePackageType</key>
          <string>APPL</string>
          <key>LSMinimumSystemVersion</key>
          <string>13.0</string>
          <key>LSUIElement</key>
          <true/>
          <key>CFBundleIconFile</key>
          <string>AppIcon</string>
          <key>NSHighResolutionCapable</key>
          <true/>
      </dict>
      </plist>
    PLIST

    prefix.install app_name
    # Symlink into /Applications
    (HOMEBREW_PREFIX/"bin/dkd-sprint-tracker").delete if (HOMEBREW_PREFIX/"bin/dkd-sprint-tracker").exist?
  end

  def caveats
    <<~EOS
      The app has been installed to:
        #{prefix}/dkd Sprint Tracker.app

      To copy it to Applications:
        cp -r "#{prefix}/dkd Sprint Tracker.app" /Applications/

      To start:
        open "/Applications/dkd Sprint Tracker.app"

      To autostart: System Settings → General → Login Items → add "dkd Sprint Tracker"
    EOS
  end

  test do
    assert_predicate prefix/"dkd Sprint Tracker.app/Contents/MacOS/DkdSprintTracker", :executable?
  end
end

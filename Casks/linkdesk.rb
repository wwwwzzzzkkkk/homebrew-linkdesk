# frozen_string_literal: true

cask "linkdesk" do
  version "1.1.0"
  sha256 "52c48e9f41e91906c10b712e0d3b00fcda5914654138e3644dd9e38eb7d27fc0"

  url "https://github.com/wwwwzzzzkkkk/LinkDesk/releases/download/v#{version}/LinkDesk-#{version}-macos-arm64.zip"
  name "LinkDesk"
  desc "Cross-device workspace with remote keyboard, display, PDF ink and mirroring"
  homepage "https://github.com/wwwwzzzzkkkk/LinkDesk"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  installer script: {
    executable: "/bin/bash",
    args:       ["#{staged_path}/LinkDesk/scripts/install-mac.sh", "#{staged_path}/LinkDesk/LinkDesk.app"],
    sudo:       false,
  }

  uninstall quit:   "com.zhekuan.linkdesk.mac",
            script: {
              executable: "/bin/rm",
              args:       ["-rf", "/Applications/LinkDesk.app"],
              sudo:       false,
            }

  caveats <<~EOS
    Install DevEco Studio or restore LinkDesk local USB tools; see the README.
    Build and sign the unified HarmonyOS tablet app in DevEco Studio; personal device profiles are not distributed.
    This release uses a local development certificate and is not notarized.
    Screen recording permission must be enabled in System Settings.
    Keyboard input needs Accessibility / Device Control and Data Access permission.
    Audio drivers require a separate administrator-authorized installation:
      python3 "#{staged_path}/LinkDesk/scripts/authorize-audio-driver-install.py"
    Drivers are retained when uninstalling the app.
    MacBook 0.5.2 is preserved on the legacy/macbook source branch.
    An existing application with a different signer will not be overwritten.
  EOS
end

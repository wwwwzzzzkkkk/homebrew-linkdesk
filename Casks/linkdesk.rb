# frozen_string_literal: true

cask "linkdesk" do
  version "1.5.0"
  sha256 "0470b4504c49e9d362f1668d0a83ef4c0fc23b5a09d7ba2210f7f823ba82329b"

  url "https://github.com/wwwwzzzzkkkk/LinkDesk/releases/download/v#{version}/LinkDesk-#{version}-macos-arm64.zip"
  name "LinkDesk"
  desc "Cross-device workspace with file sharing, remote input and display"
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

cask "linkdesk" do
  version "0.6.4"
  sha256 "b80eb78f1caad1004c28d587b1013ae5a3b2f6b0795f42fdd43b10224fa8d50c"

  url "https://github.com/wwwwzzzzkkkk/LinkDesk/releases/download/v#{version}/LinkDesk-#{version}-macos-arm64.zip"
  name "连屏 LinkDesk"
  desc "USB extended display and tablet audio"
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
    The tablet app must be installed separately.
    This release uses a local development certificate and is not notarized.
    Screen recording permission must be enabled in System Settings.
    Audio drivers require a separate administrator-authorized installation:
      python3 "#{staged_path}/LinkDesk/scripts/authorize-audio-driver-install.py"
    Drivers are retained when uninstalling the app.
    MacBook 0.5.2 is preserved on the legacy/macbook source branch.
    An existing application with a different signer will not be overwritten.
  EOS
end

cask "linkdesk" do
  version "0.6.2"
  sha256 "1838105b3df96cb9c58c0d7a80f374bf3d41ed707fee1544cd88977dd3bd729a"

  url "https://github.com/wwwwzzzzkkkk/LinkDesk/releases/download/v#{version}/LinkDesk-#{version}-macos-arm64.zip"
  name "LinkDesk"
  desc "USB extended display and tablet audio for Mac and MatePad"
  homepage "https://github.com/wwwwzzzzkkkk/LinkDesk"

  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

  installer script: {
    executable: "/bin/bash",
    args:       ["#{staged_path}/LinkDesk/scripts/install-mac.sh", "#{staged_path}/LinkDesk/LinkDesk.app"],
    sudo:       false,
  }

  uninstall quit:   "com.zhekuan.linkdesk.mac",
            delete: "/Applications/LinkDesk.app"

  caveats <<~EOS
    Install Huawei DevEco Studio and the tablet app first; see the project README.
    This release uses a local development certificate and is not notarized.
    Screen recording permission must be enabled in System Settings.
    Audio drivers require a separate administrator-authorized installation:
      python3 "#{staged_path}/LinkDesk/scripts/authorize-audio-driver-install.py"
    Drivers are retained when uninstalling the app.
    MacBook 0.5.2 is preserved on the legacy/macbook source branch.
    An existing application with a different signer will not be overwritten.
  EOS
end

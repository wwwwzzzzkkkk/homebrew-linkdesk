cask "linkdesk" do
  version "0.6.3"
  sha256 "818cb6476e96fb626cec5a6e03c11fd84662d4a1ceda6a37fafa447ac7bcc9f2"

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

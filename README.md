# LinkDesk Homebrew Tap

```sh
brew tap wwwwzzzzkkkk/linkdesk
brew install --cask wwwwzzzzkkkk/linkdesk/linkdesk
```

新版适用于 Apple Silicon Mac、macOS 14+。需安装 DevEco Studio 或保留本机 USB 工具，并安装签名后的平板端应用。MacBook 原版保留于 [legacy/macbook](https://github.com/wwwwzzzzkkkk/LinkDesk/tree/legacy/macbook)。

Cask 使用固定版本和 SHA-256，安装时调用官方签名保护脚本。不要使用 `--force` 覆盖已有应用；若要保留旧版，无需安装本 Cask。音频插件另行请求管理员授权安装，见 [使用说明](https://github.com/wwwwzzzzkkkk/LinkDesk#使用)。

更新：`brew update && brew upgrade --cask linkdesk`。卸载：`brew uninstall --cask linkdesk`，音频插件保留。

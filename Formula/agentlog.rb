class Agentlog < Formula
  desc "Local-first decision log daemon for agentic workflows"
  homepage "https://github.com/byronxlg/agentlog"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/byronxlg/agentlog/releases/download/v#{version}/agentlog-v#{version}-darwin-arm64.tar.gz"
      sha256 "e3f815eaa3787ca72aced3eb22cd24c897fc0f97f7fd84a610021af91bf4ed9d"
    end
    on_intel do
      url "https://github.com/byronxlg/agentlog/releases/download/v#{version}/agentlog-v#{version}-darwin-amd64.tar.gz"
      sha256 "b528c92336b89d90d39d27f3a5e3f7f00cf25aa017c6387dd2edbd6a475e715c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/byronxlg/agentlog/releases/download/v#{version}/agentlog-v#{version}-linux-arm64.tar.gz"
      sha256 "4c9795800215478e27f9915969c7d1cf0c98ea3d572159d61eea1c84262014c0"
    end
    on_intel do
      url "https://github.com/byronxlg/agentlog/releases/download/v#{version}/agentlog-v#{version}-linux-amd64.tar.gz"
      sha256 "362e38eff35030f083e449409e7ddd37f8d48cdee081e0a1d22672fe88096452"
    end
  end

  def install
    os = OS.mac? ? "darwin" : "linux"
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    bin.install "agentlog-#{os}-#{arch}" => "agentlog"
    bin.install "agentlogd-#{os}-#{arch}" => "agentlogd"
  end

  test do
    assert_match "agentlog", shell_output("#{bin}/agentlog 2>&1", 1)
  end
end

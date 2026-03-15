class Agentlog < Formula
  desc "Local-first decision log daemon for agentic workflows"
  homepage "https://github.com/byronxlg/agentlog"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/byronxlg/agentlog/releases/download/v#{version}/agentlog-v#{version}-darwin-arm64.tar.gz"
      sha256 "da1d9e01c410de893c9e1b59aa016721db912f0d0706aac4fff45f6b9cb95a8d"
    end
    on_intel do
      url "https://github.com/byronxlg/agentlog/releases/download/v#{version}/agentlog-v#{version}-darwin-amd64.tar.gz"
      sha256 "33eceafb82efe4f6f43cc1fc9b888226a89d88e7216faa9bc1b8ca757966e37a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/byronxlg/agentlog/releases/download/v#{version}/agentlog-v#{version}-linux-arm64.tar.gz"
      sha256 "fd8c15e4b0f7ec68a5aa7fd092ce1f42496c5f5ea6e39c804aa44d94938bff0b"
    end
    on_intel do
      url "https://github.com/byronxlg/agentlog/releases/download/v#{version}/agentlog-v#{version}-linux-amd64.tar.gz"
      sha256 "d09b4de60a922592177d996110115f5e645bcded2d6225c560a9e9b3d2b7afe7"
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

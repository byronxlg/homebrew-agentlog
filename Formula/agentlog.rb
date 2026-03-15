class Agentlog < Formula
  desc "Local-first decision log daemon for agentic workflows"
  homepage "https://github.com/byronxlg/agentlog"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/byronxlg/agentlog/releases/download/v#{version}/agentlog-v#{version}-darwin-arm64.tar.gz"
      sha256 "PLACEHOLDER"
    end
    on_intel do
      url "https://github.com/byronxlg/agentlog/releases/download/v#{version}/agentlog-v#{version}-darwin-amd64.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/byronxlg/agentlog/releases/download/v#{version}/agentlog-v#{version}-linux-arm64.tar.gz"
      sha256 "PLACEHOLDER"
    end
    on_intel do
      url "https://github.com/byronxlg/agentlog/releases/download/v#{version}/agentlog-v#{version}-linux-amd64.tar.gz"
      sha256 "PLACEHOLDER"
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

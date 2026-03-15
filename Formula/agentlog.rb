class Agentlog < Formula
  desc "Local-first decision log daemon for agentic workflows"
  homepage "https://github.com/byronxlg/agentlog"
  version "0.1.1"

  on_macos do
    on_arm do
      url "https://github.com/byronxlg/agentlog/releases/download/v#{version}/agentlog-v#{version}-darwin-arm64.tar.gz"
      sha256 "8804784957bbd13ba2fc47358586717488ebb9287ec4e4b39452c8420331e0e8"
    end
    on_intel do
      url "https://github.com/byronxlg/agentlog/releases/download/v#{version}/agentlog-v#{version}-darwin-amd64.tar.gz"
      sha256 "5d8c5ffd03e72f5d5a2ac667199d237e9b29b3dc1371966e4ebd7786178bb1c6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/byronxlg/agentlog/releases/download/v#{version}/agentlog-v#{version}-linux-arm64.tar.gz"
      sha256 "3c5e8092299ff7832980de3cb64bb782dc03c62103665f4fe67af32f32dfa2ee"
    end
    on_intel do
      url "https://github.com/byronxlg/agentlog/releases/download/v#{version}/agentlog-v#{version}-linux-amd64.tar.gz"
      sha256 "13cc47144d7a23ecc3c225048f49a853ddd8a37a59812f75193fd223e44068f4"
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

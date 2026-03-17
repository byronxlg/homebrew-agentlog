class Agentlog < Formula
  desc "Local-first decision log daemon for agentic workflows"
  homepage "https://github.com/byronxlg/agentlog"
  version "0.2.0"

  on_macos do
    on_arm do
      url "https://github.com/byronxlg/agentlog/releases/download/v#{version}/agentlog-v#{version}-darwin-arm64.tar.gz"
      sha256 "d3d94ea4762132b58fe2af077d34ef83a9a73908bc2c0063bafe136a18592360"
    end
    on_intel do
      url "https://github.com/byronxlg/agentlog/releases/download/v#{version}/agentlog-v#{version}-darwin-amd64.tar.gz"
      sha256 "a28bc672a17b4810b0398521b89bf3bf43de64a045049ff11272fa4e6d763ae6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/byronxlg/agentlog/releases/download/v#{version}/agentlog-v#{version}-linux-arm64.tar.gz"
      sha256 "035251063d2e31c503a7bcfabe3446ebba6ada6b559d5a0ac7bbd79e017d5d86"
    end
    on_intel do
      url "https://github.com/byronxlg/agentlog/releases/download/v#{version}/agentlog-v#{version}-linux-amd64.tar.gz"
      sha256 "110a2d2c0039f494aba86a3aec070862cf887d343c9f9a3dfdba576befa38245"
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

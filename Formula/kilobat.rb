class Kilobat < Formula
  desc "macOS network diagnostics CLI and MCP server"
  homepage "https://kilobat.app"
  url "https://kilobat.app/downloads/kilobat-cli-1.48.3-universal.tar.gz"
  version "0.49.0"
  sha256 "05ae94c5ff67ab1b0393a8a0a3cf331d277320b7d4476fb3571787d00f1a7286"
  license all_of: ["GPL-3.0-only", "CC-BY-4.0", "BSD-2-Clause"]

  livecheck do
    url "https://github.com/seifip/kilobat-cli"
    strategy :github_latest
  end

  depends_on macos: :sonoma

  def install
    libexec.install Dir["*"]
    bin.write_exec_script libexec/"kilobat"
    bin.install_symlink "kilobat" => "kb"
  end

  test do
    assert_match "Kilobat #{version}", shell_output("#{bin}/kilobat --version")
    assert_match "Kilobat #{version}", shell_output("#{bin}/kb --version")
    assert_match "MCP server", shell_output("#{bin}/kilobat mcp --help")
  end
end

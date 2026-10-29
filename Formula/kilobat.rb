class Kilobat < Formula
  desc "macOS network diagnostics CLI and MCP server"
  homepage "https://kilobat.app"
  url "https://github.com/seifip/kilobat-cli/archive/refs/tags/v0.5.1.tar.gz"
  sha256 "1f7d06142ede8a342abe1b0484b704b38361de8349d4bd11cffebc28b37ee708"
  license "GPL-3.0-only"

  depends_on macos: :sonoma
  depends_on xcode: ["16.0", :build]

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/kilobat"
    bin.install_symlink "kilobat" => "kb"
  end

  test do
    assert_match "Kilobat #{version}", shell_output("#{bin}/kb --version")
    assert_match "Kilobat #{version}", shell_output("#{bin}/kilobat --version")
    assert_match "MCP server", shell_output("#{bin}/kilobat mcp --help")
  end
end

class Kilobat < Formula
  desc "macOS network diagnostics CLI and MCP server"
  homepage "https://kilobat.app"
  url "https://github.com/seifip/kilobat-cli/archive/refs/tags/v0.8.0.tar.gz"
  sha256 "a0e4d1566dcaacf191d9bdf7d38cfd7f0b6ac579f4fe9cfcf94e0134a96ff282"
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

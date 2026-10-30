class Kilobat < Formula
  desc "macOS network diagnostics CLI and MCP server"
  homepage "https://kilobat.app"
  url "https://github.com/seifip/kilobat-cli/archive/refs/tags/v0.11.0.tar.gz"
  sha256 "0ef971c5143207810c52dc35b5c81ff81737571aa39a983d3fcfb7c43cec3e15"
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

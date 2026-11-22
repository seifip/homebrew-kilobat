class Kilobat < Formula
  desc "macOS network diagnostics CLI and MCP server"
  homepage "https://kilobat.app"
  url "https://kilobat.app/downloads/kilobat-cli-1.47.0-universal.tar.gz"
  version "0.49.0"
  sha256 "b2398a9d9eca447558aa54ea4d48da06894c0342ea6ddf854f98b06a4a3f1f21"
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

class Kilobat < Formula
  desc "macOS network diagnostics CLI and MCP server"
  homepage "https://kilobat.app"
  url "https://kilobat.app/downloads/kilobat-cli-1.49.5-universal.tar.gz"
  version "0.49.1"
  sha256 "7dab7625bdae6a98e6dd0a76b7a70aa7e095fbedc03b5ffcc07b06609bcbc5c5"
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

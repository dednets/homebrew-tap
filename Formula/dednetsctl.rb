# Generated from apps/homebrew-tap/Formula/dednetsctl.rb.tmpl in the DedNets
# monorepo by scripts/sync-homebrew-tap.sh. Do not edit in the tap.
class Dednetsctl < Formula
  desc "Manage DedNets hosts, public URLs, and the MCP server for AI agents"
  homepage "https://dednets.com"
  version "0.4.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://releases.dednets.com/cli/v0.4.2/dednetsctl-0.4.2-darwin-arm64.tar.gz"
      sha256 "da4e0be646dca0482e4653ef1d20394e5df0aaf5aef6f9bbe304c27d20122143"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.4.2/dednetsctl-0.4.2-darwin-amd64.tar.gz"
      sha256 "049e0a3a373b9646d266bfcd2f2b428d1220eeed4a4f37e8fa39fedffd45bef3"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.dednets.com/cli/v0.4.2/dednetsctl-0.4.2-linux-arm64.tar.gz"
      sha256 "c2404e6a3a916c4dec01f6fc89f8837c64073beeea8fbc20b5326a3fc4d80b49"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.4.2/dednetsctl-0.4.2-linux-amd64.tar.gz"
      sha256 "ef5d9afa2d2f324bf1cfa3c42650a213830cdaacc8c44b7cf1ecc2d2703a6826"
    end
  end

  def install
    bin.install "dednetsctl"
  end

  def caveats
    <<~EOS
      Point dednetsctl at your Console and give it a token:

        export DEDNETS_CONSOLE=https://console.dednets.com
        export DEDNETS_TOKEN=...   # Console > Settings > API tokens

      Then wire an AI agent to it with:  dednetsctl mcp
      Guide: https://docs.dednets.com/automation/ai-agent/

      This formula pins one CLI version. If the MCP server warns on stderr that
      the CLI and the Console disagree, run:  brew upgrade dednetsctl
      (or use "npx -y @dednets/mcp", which follows your Console automatically).
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dednetsctl version")
  end
end

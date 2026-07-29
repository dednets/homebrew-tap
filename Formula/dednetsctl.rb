# Generated from apps/homebrew-tap/Formula/dednetsctl.rb.tmpl in the DedNets
# monorepo by scripts/sync-homebrew-tap.sh. Do not edit in the tap.
class Dednetsctl < Formula
  desc "Manage DedNets hosts, public URLs, and the MCP server for AI agents"
  homepage "https://dednets.com"
  version "0.6.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://releases.dednets.com/cli/v0.6.1/dednetsctl-0.6.1-darwin-arm64.tar.gz"
      sha256 "3e70af7f1eacd4aaa316baa3d0bbcab1d5a04d83da0bd0d98256caa1bdb67ae1"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.6.1/dednetsctl-0.6.1-darwin-amd64.tar.gz"
      sha256 "71f32ef1f704a0be238035725b8648be7ff638b8cb312c700caca86c721fb7ad"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.dednets.com/cli/v0.6.1/dednetsctl-0.6.1-linux-arm64.tar.gz"
      sha256 "856bf96c6bde017811e11cde8990aa2f55fb2058c227334883efd8ff5c6398a8"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.6.1/dednetsctl-0.6.1-linux-amd64.tar.gz"
      sha256 "fe93fc6267a01169c4b04bf873069d3abcee467199520e811518dfefb4eb9b72"
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

# Generated from apps/homebrew-tap/Formula/dednetsctl.rb.tmpl in the DedNets
# monorepo by scripts/sync-homebrew-tap.sh. Do not edit in the tap.
class Dednetsctl < Formula
  desc "Manage DedNets hosts, public URLs, and the MCP server for AI agents"
  homepage "https://dednets.com"
  version "0.14.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://releases.dednets.com/cli/v0.14.1/dednetsctl-0.14.1-darwin-arm64.tar.gz"
      sha256 "97179a7f4f951454a4e8cf5f4228ae23cbab75a0bf978e236076e8fd6c551834"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.14.1/dednetsctl-0.14.1-darwin-amd64.tar.gz"
      sha256 "f1705bdf9d4145b774aa9d5d5d867e0b526afe0c6e8386247b9891699b9511e9"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.dednets.com/cli/v0.14.1/dednetsctl-0.14.1-linux-arm64.tar.gz"
      sha256 "618cba67eab2973e2e8492d0cb8d951c93d2c580cf7955a2314fedc93876a89b"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.14.1/dednetsctl-0.14.1-linux-amd64.tar.gz"
      sha256 "386ca94718d2e24091cc19ffa5eb39a37b95f836ee15c1f1e7f4cdf0701b6eeb"
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

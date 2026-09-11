# Generated from apps/homebrew-tap/Formula/dednetsctl.rb.tmpl in the DedNets
# monorepo by scripts/sync-homebrew-tap.sh. Do not edit in the tap.
class Dednetsctl < Formula
  desc "Manage DedNets hosts, public URLs, and the MCP server for AI agents"
  homepage "https://dednets.com"
  version "0.14.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://releases.dednets.com/cli/v0.14.5/dednetsctl-0.14.5-darwin-arm64.tar.gz"
      sha256 "0c70ffea3b869660d6eaa11dd99e3e39d4e923b7cbda61fca2ae13305437d892"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.14.5/dednetsctl-0.14.5-darwin-amd64.tar.gz"
      sha256 "6020acc976d3cd5f1262b695891beffbc3942e215faf99db5308781c509ec63c"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.dednets.com/cli/v0.14.5/dednetsctl-0.14.5-linux-arm64.tar.gz"
      sha256 "74d18aeba00212b2a3774ce7d0e0dbc4c86b9d5295490d0556e2e12bb71e936a"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.14.5/dednetsctl-0.14.5-linux-amd64.tar.gz"
      sha256 "2b545cc54f279ac8fc09943f3cd819cb9f32ee9240bbda9b6fe062843717e5d9"
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

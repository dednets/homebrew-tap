# Generated from apps/homebrew-tap/Formula/dednetsctl.rb.tmpl in the DedNets
# monorepo by scripts/sync-homebrew-tap.sh. Do not edit in the tap.
class Dednetsctl < Formula
  desc "Manage DedNets hosts, public URLs, and the MCP server for AI agents"
  homepage "https://dednets.com"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://releases.dednets.com/cli/v0.6.0/dednetsctl-0.6.0-darwin-arm64.tar.gz"
      sha256 "2c6f6725933e3162cf18dc842ee96449936d5b3a3fe1a088fffa4a7640f2aa04"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.6.0/dednetsctl-0.6.0-darwin-amd64.tar.gz"
      sha256 "744b37a1f37d6c4b6f40640fba95445e9d9fc483b2b4c41c25793a118e1e3e32"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.dednets.com/cli/v0.6.0/dednetsctl-0.6.0-linux-arm64.tar.gz"
      sha256 "a123e04353437f31e39db07caeb2d0f29db37be138d081bbeb0ebc659d1b6bcd"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.6.0/dednetsctl-0.6.0-linux-amd64.tar.gz"
      sha256 "a57501e928a783cb0f0b8e92a90a304e97b1a2655ba2c1c1c53dc97d2f6e17c6"
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

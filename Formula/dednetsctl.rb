# Generated from apps/homebrew-tap/Formula/dednetsctl.rb.tmpl in the DedNets
# monorepo by scripts/sync-homebrew-tap.sh. Do not edit in the tap.
class Dednetsctl < Formula
  desc "Manage DedNets hosts, public URLs, and the MCP server for AI agents"
  homepage "https://dednets.com"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://releases.dednets.com/cli/v0.8.0/dednetsctl-0.8.0-darwin-arm64.tar.gz"
      sha256 "a4c822965ca8fa32b9b6219370d26216f8f44e6f36d76f9a1cc0b8505221edbb"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.8.0/dednetsctl-0.8.0-darwin-amd64.tar.gz"
      sha256 "69125fa657add3e9448f257915501c03f3cacccb0025b6d230ab608e904c6bee"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.dednets.com/cli/v0.8.0/dednetsctl-0.8.0-linux-arm64.tar.gz"
      sha256 "b410d1b141d1a09c61015ce9ee18e6da32d8ce94f71add91cc888408a7876d04"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.8.0/dednetsctl-0.8.0-linux-amd64.tar.gz"
      sha256 "0eedf1e2e2fc085aac667b8a9f726c9091c5989242949cd9fa0b32e380566fba"
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

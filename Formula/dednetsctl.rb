# Generated from apps/homebrew-tap/Formula/dednetsctl.rb.tmpl in the DedNets
# monorepo by scripts/sync-homebrew-tap.sh. Do not edit in the tap.
class Dednetsctl < Formula
  desc "Manage DedNets hosts, public URLs, and the MCP server for AI agents"
  homepage "https://dednets.com"
  version "0.9.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://releases.dednets.com/cli/v0.9.2/dednetsctl-0.9.2-darwin-arm64.tar.gz"
      sha256 "62aac39a54bee078ea15ef2be486056e5c127d5453163e89bf9ebde05541da3a"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.9.2/dednetsctl-0.9.2-darwin-amd64.tar.gz"
      sha256 "51390a04b3d1aac3c4f616682b28d1109c28a0cf03f0c66d64ea013313c2408d"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.dednets.com/cli/v0.9.2/dednetsctl-0.9.2-linux-arm64.tar.gz"
      sha256 "c99c04b0914ff6421decac4d4dba1f577fd5200bc2804ecfd6ce708a1a72f158"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.9.2/dednetsctl-0.9.2-linux-amd64.tar.gz"
      sha256 "59cd6b8e495deb67d96d93775dd1ec69f081e19732a3236c4a8f9e43ed088610"
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

# Generated from apps/homebrew-tap/Formula/dednetsctl.rb.tmpl in the DedNets
# monorepo by scripts/sync-homebrew-tap.sh. Do not edit in the tap.
#
# license :cannot_represent is a PLACEHOLDER pending a human decision: the
# monorepo ships no LICENSE file today (the same gap docs/mcp.md records for
# the npm package), and inventing an SPDX id would be a lie. `brew audit
# --strict` accepts :cannot_represent. When a license is chosen, set it here.
class Dednetsctl < Formula
  desc "Manage DedNets hosts, public URLs, and the MCP server for AI agents"
  homepage "https://dednets.com"
  version "0.4.1"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://releases.dednets.com/cli/v0.4.1/dednetsctl-0.4.1-darwin-arm64.tar.gz"
      sha256 "4ef1cf5bfad69f6c1bdea97e5c6ea9fcbf1550cd10fd84efb765ebc95b4be220"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.4.1/dednetsctl-0.4.1-darwin-amd64.tar.gz"
      sha256 "923164bfa5780ebb49369b07290ee931685b91849f9bc076f6bb4318f2df4213"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.dednets.com/cli/v0.4.1/dednetsctl-0.4.1-linux-arm64.tar.gz"
      sha256 "bce5df21d5dbea37c2a58bae059bb45116f0150e3c10134f217e90faf2258a46"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.4.1/dednetsctl-0.4.1-linux-amd64.tar.gz"
      sha256 "949f486c8b2abaafab7d94b046ffb14377d5e5f6a3b9a8997e5c7c9742ba1de3"
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

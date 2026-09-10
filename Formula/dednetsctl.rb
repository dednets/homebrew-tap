# Generated from apps/homebrew-tap/Formula/dednetsctl.rb.tmpl in the DedNets
# monorepo by scripts/sync-homebrew-tap.sh. Do not edit in the tap.
class Dednetsctl < Formula
  desc "Manage DedNets hosts, public URLs, and the MCP server for AI agents"
  homepage "https://dednets.com"
  version "0.13.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://releases.dednets.com/cli/v0.13.6/dednetsctl-0.13.6-darwin-arm64.tar.gz"
      sha256 "718293cc49b87f693887b3c51bfab187e6672ed2177dcbcde92f9af62fa81b6d"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.13.6/dednetsctl-0.13.6-darwin-amd64.tar.gz"
      sha256 "5875b97d48b0f0b2e4aad314e6a3c79654276b127d430bf677bf666d72843156"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.dednets.com/cli/v0.13.6/dednetsctl-0.13.6-linux-arm64.tar.gz"
      sha256 "8ce7e3b09db1a49eeed745df394d1d4e38538a55d3e25eef3c4e7f801082048f"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.13.6/dednetsctl-0.13.6-linux-amd64.tar.gz"
      sha256 "214b22a98c6917f73b4b185ff58133a5078d1d245abcdeeb34e339175483b44f"
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

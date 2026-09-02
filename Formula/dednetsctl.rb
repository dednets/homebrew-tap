# Generated from apps/homebrew-tap/Formula/dednetsctl.rb.tmpl in the DedNets
# monorepo by scripts/sync-homebrew-tap.sh. Do not edit in the tap.
class Dednetsctl < Formula
  desc "Manage DedNets hosts, public URLs, and the MCP server for AI agents"
  homepage "https://dednets.com"
  version "0.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://releases.dednets.com/cli/v0.10.0/dednetsctl-0.10.0-darwin-arm64.tar.gz"
      sha256 "819904613cbc82c3371389a9a8ac26287cc1675a7ec4b202a6ec4b46b0ffd6cd"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.10.0/dednetsctl-0.10.0-darwin-amd64.tar.gz"
      sha256 "63d4c434633c78884829dbb17065b17418ea0e7ac0e40fd07c0153daca248407"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.dednets.com/cli/v0.10.0/dednetsctl-0.10.0-linux-arm64.tar.gz"
      sha256 "27c3b09e870d056737c5cc3d527c431de30b6154810e9ad38fd1bb06a35889cf"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.10.0/dednetsctl-0.10.0-linux-amd64.tar.gz"
      sha256 "51171f4d65aab069bd7f280182db9ba1bd53c73de9e4d59b77f058eecf0ee962"
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

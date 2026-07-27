# Generated from apps/homebrew-tap/Formula/dednetsctl.rb.tmpl in the DedNets
# monorepo by scripts/sync-homebrew-tap.sh. Do not edit in the tap.
class Dednetsctl < Formula
  desc "Manage DedNets hosts, public URLs, and the MCP server for AI agents"
  homepage "https://dednets.com"
  version "0.4.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://releases.dednets.com/cli/v0.4.6/dednetsctl-0.4.6-darwin-arm64.tar.gz"
      sha256 "f1d458a661ce158a547f66f07f88baa51948d956a0db2c7cc72d22b26a9c336b"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.4.6/dednetsctl-0.4.6-darwin-amd64.tar.gz"
      sha256 "9f74e66a18624f513a5b0146240f7ec9e388e6bbef8b1e8bfc2903a7c7476d5a"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.dednets.com/cli/v0.4.6/dednetsctl-0.4.6-linux-arm64.tar.gz"
      sha256 "c00baeb48e7bdcded16631582c46e8362acf53c9cb250e27a590580534fb2a30"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.4.6/dednetsctl-0.4.6-linux-amd64.tar.gz"
      sha256 "f3b8c031da70faca767df98b8ea7be9bacc50d4252ee4b1ff857912e4b3faef4"
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

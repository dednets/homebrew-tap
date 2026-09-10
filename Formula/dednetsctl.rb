# Generated from apps/homebrew-tap/Formula/dednetsctl.rb.tmpl in the DedNets
# monorepo by scripts/sync-homebrew-tap.sh. Do not edit in the tap.
class Dednetsctl < Formula
  desc "Manage DedNets hosts, public URLs, and the MCP server for AI agents"
  homepage "https://dednets.com"
  version "0.14.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://releases.dednets.com/cli/v0.14.0/dednetsctl-0.14.0-darwin-arm64.tar.gz"
      sha256 "5a0d9b4581f9cac5e1d52283e33903bfae58dd3f33d79753e92b8237bf0f4df2"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.14.0/dednetsctl-0.14.0-darwin-amd64.tar.gz"
      sha256 "3d888003938875dd73cc79daa658e3855a06a384911adca3dc6d97b5e3456ef2"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.dednets.com/cli/v0.14.0/dednetsctl-0.14.0-linux-arm64.tar.gz"
      sha256 "644c16b364aaaa067c2f543138821d9dee3cb382a064add9600768f8e40ca9ee"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.14.0/dednetsctl-0.14.0-linux-amd64.tar.gz"
      sha256 "393ae220f21638d2833780a6a2b050d8788dc637051f2fc15c092770d572d1b6"
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

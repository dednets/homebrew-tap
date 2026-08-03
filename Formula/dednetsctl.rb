# Generated from apps/homebrew-tap/Formula/dednetsctl.rb.tmpl in the DedNets
# monorepo by scripts/sync-homebrew-tap.sh. Do not edit in the tap.
class Dednetsctl < Formula
  desc "Manage DedNets hosts, public URLs, and the MCP server for AI agents"
  homepage "https://dednets.com"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://releases.dednets.com/cli/v0.7.0/dednetsctl-0.7.0-darwin-arm64.tar.gz"
      sha256 "032f903af954cc540a12c46a9537e1baa50ec08f659c662d15e49f1e61dcd914"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.7.0/dednetsctl-0.7.0-darwin-amd64.tar.gz"
      sha256 "3cbec30eaeb392ccb419ea3e87874b17218b4d8e239aa7e66900710315f1c2b1"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.dednets.com/cli/v0.7.0/dednetsctl-0.7.0-linux-arm64.tar.gz"
      sha256 "15d70fb81e1634bedc8a9d88d6f89cc2a14fdea0b893bd4f7a3e66c7506f76e9"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.7.0/dednetsctl-0.7.0-linux-amd64.tar.gz"
      sha256 "bd746fc827222be986963455a7921d9b39d6ceb643bdb0dc9d2c23fffeb4f69d"
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

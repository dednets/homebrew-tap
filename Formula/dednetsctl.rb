# Generated from apps/homebrew-tap/Formula/dednetsctl.rb.tmpl in the DedNets
# monorepo by scripts/sync-homebrew-tap.sh. Do not edit in the tap.
class Dednetsctl < Formula
  desc "Manage DedNets hosts, public URLs, and the MCP server for AI agents"
  homepage "https://dednets.com"
  version "0.4.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://releases.dednets.com/cli/v0.4.3/dednetsctl-0.4.3-darwin-arm64.tar.gz"
      sha256 "1ee007352aab6b01ba8f53248d4e9b1a634aa9326297d295678e4ab84166412b"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.4.3/dednetsctl-0.4.3-darwin-amd64.tar.gz"
      sha256 "bc5478da04f6c0843904bf01449ccc3fbcaf8a296b953190450788f17776b5ac"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.dednets.com/cli/v0.4.3/dednetsctl-0.4.3-linux-arm64.tar.gz"
      sha256 "498ad7f5473dfc4b566f40c9881dbb7cb15535b41a739996ac874415657cc8c8"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.4.3/dednetsctl-0.4.3-linux-amd64.tar.gz"
      sha256 "7ddc07c469cea35cd8337af45274bba3c3ac42d6a93bc220e10c701216e90872"
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

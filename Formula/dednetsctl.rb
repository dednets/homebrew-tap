# Generated from apps/homebrew-tap/Formula/dednetsctl.rb.tmpl in the DedNets
# monorepo by scripts/sync-homebrew-tap.sh. Do not edit in the tap.
class Dednetsctl < Formula
  desc "Manage DedNets hosts, public URLs, and the MCP server for AI agents"
  homepage "https://dednets.com"
  version "0.13.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://releases.dednets.com/cli/v0.13.4/dednetsctl-0.13.4-darwin-arm64.tar.gz"
      sha256 "3e3cf5ef66d170052fae8c3ff14cf06bdf38f668d2266e0cf8a07c591fc7d1e4"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.13.4/dednetsctl-0.13.4-darwin-amd64.tar.gz"
      sha256 "978f849e29cecb39fa249212ac0de7e78a4967b89073dfafca200c39b92ba4d6"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.dednets.com/cli/v0.13.4/dednetsctl-0.13.4-linux-arm64.tar.gz"
      sha256 "0f08da8154e3bf4dfe38284bd7e7a6cb684086c2154753d467e7041e2e5a70d2"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.13.4/dednetsctl-0.13.4-linux-amd64.tar.gz"
      sha256 "4ee8cbf4b960975e79a7f4c069316798e9a8a490ae5c08da420d09cca11f80ad"
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

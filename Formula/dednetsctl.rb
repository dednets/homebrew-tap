# Generated from apps/homebrew-tap/Formula/dednetsctl.rb.tmpl in the DedNets
# monorepo by scripts/sync-homebrew-tap.sh. Do not edit in the tap.
class Dednetsctl < Formula
  desc "Manage DedNets hosts, public URLs, and the MCP server for AI agents"
  homepage "https://dednets.com"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://releases.dednets.com/cli/v0.9.0/dednetsctl-0.9.0-darwin-arm64.tar.gz"
      sha256 "1ef254e6d4882ba2f7df3ef3e0a7cf9009a921a2d2a64d80734c24b0f6647f42"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.9.0/dednetsctl-0.9.0-darwin-amd64.tar.gz"
      sha256 "8e5aa2c317aa5184e0066f6cd0cff00f8ce4da3e109bcd3960491bfba7c74905"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.dednets.com/cli/v0.9.0/dednetsctl-0.9.0-linux-arm64.tar.gz"
      sha256 "d6e30436ca1abdd0f4d0b15a23cf9b51242e9adae8ce4fedaf85da177a1275d7"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.9.0/dednetsctl-0.9.0-linux-amd64.tar.gz"
      sha256 "1af7446515e52ba92da46bb29d2deba48a9c93c4bf79dd963921e527fcb2da46"
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

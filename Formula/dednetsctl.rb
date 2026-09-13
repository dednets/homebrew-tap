# Generated from apps/homebrew-tap/Formula/dednetsctl.rb.tmpl in the DedNets
# monorepo by scripts/sync-homebrew-tap.sh. Do not edit in the tap.
class Dednetsctl < Formula
  desc "Manage DedNets hosts, public URLs, and the MCP server for AI agents"
  homepage "https://dednets.com"
  version "0.14.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://releases.dednets.com/cli/v0.14.7/dednetsctl-0.14.7-darwin-arm64.tar.gz"
      sha256 "d443468523bc484cb0b60ce9b6d4bfc79fa37cdcafaa45bf980ec3da35b29323"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.14.7/dednetsctl-0.14.7-darwin-amd64.tar.gz"
      sha256 "1cd61c839e9871bf5197a3d94108782d5f17bbc087698cf20a68c0c3e42d2c5e"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.dednets.com/cli/v0.14.7/dednetsctl-0.14.7-linux-arm64.tar.gz"
      sha256 "7e5ab4f54f8ff1a5df27e8ff8896cdb1ba20a234d485e6e8e9a88d402420696e"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.14.7/dednetsctl-0.14.7-linux-amd64.tar.gz"
      sha256 "49d2b61cbeda685bf04c80e5d0926226c5018ca58e7e606d69e3577ef6c0e1bb"
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

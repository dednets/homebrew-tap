# Generated from apps/homebrew-tap/Formula/dednetsctl.rb.tmpl in the DedNets
# monorepo by scripts/sync-homebrew-tap.sh. Do not edit in the tap.
class Dednetsctl < Formula
  desc "Manage DedNets hosts, public URLs, and the MCP server for AI agents"
  homepage "https://dednets.com"
  version "0.7.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://releases.dednets.com/cli/v0.7.1/dednetsctl-0.7.1-darwin-arm64.tar.gz"
      sha256 "945471bb5f68ac34f13dfa98dee72a6a4b4331c9e9e27f7856fe66d50de767dc"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.7.1/dednetsctl-0.7.1-darwin-amd64.tar.gz"
      sha256 "6b4db8b62f6a38403eef971ebfd8a27c7c3487e87183e63608003bbb9d703806"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.dednets.com/cli/v0.7.1/dednetsctl-0.7.1-linux-arm64.tar.gz"
      sha256 "76238a380e2f4cc9d667eca755c5b2b9b774b0e8708e4328af1f458ef179184a"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.7.1/dednetsctl-0.7.1-linux-amd64.tar.gz"
      sha256 "8dbee064dc74b052005aeade6ab594734e5fc10c65a0d534e0677c2830248b8a"
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

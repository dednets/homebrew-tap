# Generated from apps/homebrew-tap/Formula/dednetsctl.rb.tmpl in the DedNets
# monorepo by scripts/sync-homebrew-tap.sh. Do not edit in the tap.
class Dednetsctl < Formula
  desc "Manage DedNets hosts, public URLs, and the MCP server for AI agents"
  homepage "https://dednets.com"
  version "0.14.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://releases.dednets.com/cli/v0.14.3/dednetsctl-0.14.3-darwin-arm64.tar.gz"
      sha256 "53facd90487e0242baaa107bd263a285d2400729cab3e9e9435e2473b7645bac"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.14.3/dednetsctl-0.14.3-darwin-amd64.tar.gz"
      sha256 "8a5cdeff2a46dfe0829db751a30d354d3dc7ea3cddf48718dacf8f5507c0c7ed"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.dednets.com/cli/v0.14.3/dednetsctl-0.14.3-linux-arm64.tar.gz"
      sha256 "cdfa079efc194ff23c1114544681b170d021a4667bdc212debc02c4b46d971a8"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.14.3/dednetsctl-0.14.3-linux-amd64.tar.gz"
      sha256 "0e6834de448548f1ecac7e040ed1079c3668069b8c6c7ac220c4967b87057eee"
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

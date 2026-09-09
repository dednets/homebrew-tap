# Generated from apps/homebrew-tap/Formula/dednetsctl.rb.tmpl in the DedNets
# monorepo by scripts/sync-homebrew-tap.sh. Do not edit in the tap.
class Dednetsctl < Formula
  desc "Manage DedNets hosts, public URLs, and the MCP server for AI agents"
  homepage "https://dednets.com"
  version "0.13.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://releases.dednets.com/cli/v0.13.5/dednetsctl-0.13.5-darwin-arm64.tar.gz"
      sha256 "1c8b2f4432f95b5fa776aeaf662f669a92c33ac712f9c7fdc1d67dba8952df13"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.13.5/dednetsctl-0.13.5-darwin-amd64.tar.gz"
      sha256 "8c9ea3be322627d656c1febcec38b725f5eaba8c58e61e8dd32782ab460e0d94"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.dednets.com/cli/v0.13.5/dednetsctl-0.13.5-linux-arm64.tar.gz"
      sha256 "1d7b4db35f77f9cfaa2adacaf0bd7acada7a774279348bff9de85dd93776938c"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.13.5/dednetsctl-0.13.5-linux-amd64.tar.gz"
      sha256 "4c84bc5586f2165ec49bcaa3c7e16bb36af88eb45ff6ac65bf89572c1e3ecba5"
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

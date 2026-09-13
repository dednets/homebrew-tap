# Generated from apps/homebrew-tap/Formula/dednetsctl.rb.tmpl in the DedNets
# monorepo by scripts/sync-homebrew-tap.sh. Do not edit in the tap.
class Dednetsctl < Formula
  desc "Manage DedNets hosts, public URLs, and the MCP server for AI agents"
  homepage "https://dednets.com"
  version "0.14.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://releases.dednets.com/cli/v0.14.6/dednetsctl-0.14.6-darwin-arm64.tar.gz"
      sha256 "4fec44294b39601982f9d3cffcdcfe7f4cc3ebebd780be659f74a41133bf862f"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.14.6/dednetsctl-0.14.6-darwin-amd64.tar.gz"
      sha256 "45bbbb79d55e8d56d86aeee800e415d5c7a03c4def9008a208da681826028ac5"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.dednets.com/cli/v0.14.6/dednetsctl-0.14.6-linux-arm64.tar.gz"
      sha256 "4b6d990a09c9fc2fac08282f2d9243fe96cf71ea6f4532117d211cbfcc2a4127"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.14.6/dednetsctl-0.14.6-linux-amd64.tar.gz"
      sha256 "7b748d341deb08232e9a2f80bb68ecb9c867c920ec9aee31292296c37741f02b"
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

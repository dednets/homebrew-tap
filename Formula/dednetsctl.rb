# Generated from apps/homebrew-tap/Formula/dednetsctl.rb.tmpl in the DedNets
# monorepo by scripts/sync-homebrew-tap.sh. Do not edit in the tap.
class Dednetsctl < Formula
  desc "Manage DedNets hosts, public URLs, and the MCP server for AI agents"
  homepage "https://dednets.com"
  version "0.4.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://releases.dednets.com/cli/v0.4.4/dednetsctl-0.4.4-darwin-arm64.tar.gz"
      sha256 "0574c128c3b807969ea2e181cbb158141ddd2f4a48da83b85268ba1312587ece"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.4.4/dednetsctl-0.4.4-darwin-amd64.tar.gz"
      sha256 "53526f2f214feda2f2c8e4a3494d484294eddacce53efb702c504a67ad5fc02e"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.dednets.com/cli/v0.4.4/dednetsctl-0.4.4-linux-arm64.tar.gz"
      sha256 "e414c52326b68c3dcbcb2ebf15d7afa216eaac520554f0f04cec1497607f2d50"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.4.4/dednetsctl-0.4.4-linux-amd64.tar.gz"
      sha256 "65aced256ccbe1ace1581dfee99bc4c250f8bec18bc9fbd3d85e8134f2b72f99"
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

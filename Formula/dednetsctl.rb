# Generated from apps/homebrew-tap/Formula/dednetsctl.rb.tmpl in the DedNets
# monorepo by scripts/sync-homebrew-tap.sh. Do not edit in the tap.
class Dednetsctl < Formula
  desc "Manage DedNets hosts, public URLs, and the MCP server for AI agents"
  homepage "https://dednets.com"
  version "0.13.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://releases.dednets.com/cli/v0.13.3/dednetsctl-0.13.3-darwin-arm64.tar.gz"
      sha256 "3e8124ac018f424005b75950696fafe8efbf97cdc346324381f747fd0005f976"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.13.3/dednetsctl-0.13.3-darwin-amd64.tar.gz"
      sha256 "709ce327794d52a9aab3fb531ccb4abb23f06e136b47cf8299ca04dbdf5e0553"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.dednets.com/cli/v0.13.3/dednetsctl-0.13.3-linux-arm64.tar.gz"
      sha256 "c53c158f18fc32e79f5529baaa4352fcee3f9731a979d958a6d9fcee2a8192a9"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.13.3/dednetsctl-0.13.3-linux-amd64.tar.gz"
      sha256 "9d52324a40cc30c1aa5802eab9fc756a5c06ad5f28798ab052c76191e73fb2d8"
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

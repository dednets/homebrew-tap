# Generated from apps/homebrew-tap/Formula/dednetsctl.rb.tmpl in the DedNets
# monorepo by scripts/sync-homebrew-tap.sh. Do not edit in the tap.
class Dednetsctl < Formula
  desc "Manage DedNets hosts, public URLs, and the MCP server for AI agents"
  homepage "https://dednets.com"
  version "0.4.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://releases.dednets.com/cli/v0.4.5/dednetsctl-0.4.5-darwin-arm64.tar.gz"
      sha256 "d90ea59b53068083401efd889455c7df13b8c362ac65aa54e19f3e849e641275"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.4.5/dednetsctl-0.4.5-darwin-amd64.tar.gz"
      sha256 "ce04215de23cb08f5ec8a82da9d40a03933550c96f791eae73a315ab75b1188f"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.dednets.com/cli/v0.4.5/dednetsctl-0.4.5-linux-arm64.tar.gz"
      sha256 "0ddc8215854677d5ecf59a70766e3d8ba5d131663b486b305a03a38a6c998dc9"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.4.5/dednetsctl-0.4.5-linux-amd64.tar.gz"
      sha256 "628eb86b0f6688e881b97d04ad3656d5f33900ed71718b4ba7c8620c5715ca61"
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

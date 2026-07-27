# Generated from apps/homebrew-tap/Formula/dednetsctl.rb.tmpl in the DedNets
# monorepo by scripts/sync-homebrew-tap.sh. Do not edit in the tap.
class Dednetsctl < Formula
  desc "Manage DedNets hosts, public URLs, and the MCP server for AI agents"
  homepage "https://dednets.com"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://releases.dednets.com/cli/v0.5.0/dednetsctl-0.5.0-darwin-arm64.tar.gz"
      sha256 "a74e37d81071dd471230ab9156675cba09bb8e4069612dbb48b8e938f105c733"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.5.0/dednetsctl-0.5.0-darwin-amd64.tar.gz"
      sha256 "f99a19b2cfe3f53e70a1fdde99cc14fd0b1b50c3a1455d3c0a8650e649716732"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.dednets.com/cli/v0.5.0/dednetsctl-0.5.0-linux-arm64.tar.gz"
      sha256 "e0a11e2793020d2e037079958d91801ccd35c480002b8c1e41fdb3e4b854a531"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.5.0/dednetsctl-0.5.0-linux-amd64.tar.gz"
      sha256 "513d40cd83995dde1b54b749ec4286e90d4bc61af14ca33fd2a7b1e9150c84b5"
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

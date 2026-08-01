# Generated from apps/homebrew-tap/Formula/dednetsctl.rb.tmpl in the DedNets
# monorepo by scripts/sync-homebrew-tap.sh. Do not edit in the tap.
class Dednetsctl < Formula
  desc "Manage DedNets hosts, public URLs, and the MCP server for AI agents"
  homepage "https://dednets.com"
  version "0.6.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://releases.dednets.com/cli/v0.6.2/dednetsctl-0.6.2-darwin-arm64.tar.gz"
      sha256 "c6a493b8553c588a6fcff33296e18fed28fab9d5564fb1e1178a31ad96d86af2"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.6.2/dednetsctl-0.6.2-darwin-amd64.tar.gz"
      sha256 "ce24e7c2836b15b74402af9049984ef69f26564cdaef1214226cf5a09601f2b5"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.dednets.com/cli/v0.6.2/dednetsctl-0.6.2-linux-arm64.tar.gz"
      sha256 "39215f8029d3ec3af72a765980f5d23112afb7812c54ec170a7e4ae36284cbb0"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.6.2/dednetsctl-0.6.2-linux-amd64.tar.gz"
      sha256 "dcf61ca7a10dc0bcab73ad025b6a27397455bf52b19f9aea752ee56f4b47706a"
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

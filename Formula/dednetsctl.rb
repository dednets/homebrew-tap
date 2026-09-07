# Generated from apps/homebrew-tap/Formula/dednetsctl.rb.tmpl in the DedNets
# monorepo by scripts/sync-homebrew-tap.sh. Do not edit in the tap.
class Dednetsctl < Formula
  desc "Manage DedNets hosts, public URLs, and the MCP server for AI agents"
  homepage "https://dednets.com"
  version "0.13.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://releases.dednets.com/cli/v0.13.1/dednetsctl-0.13.1-darwin-arm64.tar.gz"
      sha256 "d8200cbb15ed6a2b6ef9eae4b4612a6851889fd16212d705e1f9cd8bea24298a"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.13.1/dednetsctl-0.13.1-darwin-amd64.tar.gz"
      sha256 "f32040fb648b7668f9d0b7eaf10364b592f3cf7129b135da536d0c896595f757"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.dednets.com/cli/v0.13.1/dednetsctl-0.13.1-linux-arm64.tar.gz"
      sha256 "97a12491a4f41744b0cec4576c07eefaac9da503f19a601747bd1c7391d4483f"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.13.1/dednetsctl-0.13.1-linux-amd64.tar.gz"
      sha256 "f2cf905de9de4957041a9715c50ec2d2084d32153dbb6a8751931857ad8b35ac"
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

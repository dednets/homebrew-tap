# Generated from apps/homebrew-tap/Formula/dednetsctl.rb.tmpl in the DedNets
# monorepo by scripts/sync-homebrew-tap.sh. Do not edit in the tap.
class Dednetsctl < Formula
  desc "Manage DedNets hosts, public URLs, and the MCP server for AI agents"
  homepage "https://dednets.com"
  version "0.14.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://releases.dednets.com/cli/v0.14.2/dednetsctl-0.14.2-darwin-arm64.tar.gz"
      sha256 "db6f32539d8d35f766f126b6ca2898f0c28469f30e22ccbd7350b960c76755c5"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.14.2/dednetsctl-0.14.2-darwin-amd64.tar.gz"
      sha256 "a744ccecdd69318e36d0a8c68691d007deb7fd95b230f8b0e513ec161f296754"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.dednets.com/cli/v0.14.2/dednetsctl-0.14.2-linux-arm64.tar.gz"
      sha256 "e6e3c389c70facf1addd5f29185e29bf1f966e0a423bc58ccd88fd0e46b25b70"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.14.2/dednetsctl-0.14.2-linux-amd64.tar.gz"
      sha256 "e3c59df69619b5e71741858b6564dc6d674e70a27ecb7760ea2a1116718dba88"
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

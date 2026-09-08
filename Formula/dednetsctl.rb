# Generated from apps/homebrew-tap/Formula/dednetsctl.rb.tmpl in the DedNets
# monorepo by scripts/sync-homebrew-tap.sh. Do not edit in the tap.
class Dednetsctl < Formula
  desc "Manage DedNets hosts, public URLs, and the MCP server for AI agents"
  homepage "https://dednets.com"
  version "0.13.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://releases.dednets.com/cli/v0.13.2/dednetsctl-0.13.2-darwin-arm64.tar.gz"
      sha256 "e9b491aca2f78aed012984c717664718d383dc4c99732b9013061f69694e51c1"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.13.2/dednetsctl-0.13.2-darwin-amd64.tar.gz"
      sha256 "68f4897f2038203db63e0dc4654b43ea40ecc3375b6fea9f9d74e630699e671f"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.dednets.com/cli/v0.13.2/dednetsctl-0.13.2-linux-arm64.tar.gz"
      sha256 "52ae9f344234e3d2d57a328177a1a7b7b664452952d4f7a7d896b169c7bdca5b"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.13.2/dednetsctl-0.13.2-linux-amd64.tar.gz"
      sha256 "111c100238d625bb3c760b7c03d8d0fcf5eac8a605bb8ebab7a644726a709836"
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

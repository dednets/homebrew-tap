# Generated from apps/homebrew-tap/Formula/dednetsctl.rb.tmpl in the DedNets
# monorepo by scripts/sync-homebrew-tap.sh. Do not edit in the tap.
class Dednetsctl < Formula
  desc "Manage DedNets hosts, public URLs, and the MCP server for AI agents"
  homepage "https://dednets.com"
  version "0.14.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://releases.dednets.com/cli/v0.14.4/dednetsctl-0.14.4-darwin-arm64.tar.gz"
      sha256 "09afd27c7063f776f90ef28e55c3d0a7c8f057e3debe5b81ac828f8cafee65f9"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.14.4/dednetsctl-0.14.4-darwin-amd64.tar.gz"
      sha256 "6684639e6847ad630b0ecbfc72e1eb3a36b0cba3f5efb5f1f4b6f9fe1813ecf4"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.dednets.com/cli/v0.14.4/dednetsctl-0.14.4-linux-arm64.tar.gz"
      sha256 "3c17d8a1406a66281c2c7f106fdeffd6c32b9a8a20a03277e71bf0b1de3c3875"
    end
    on_intel do
      url "https://releases.dednets.com/cli/v0.14.4/dednetsctl-0.14.4-linux-amd64.tar.gz"
      sha256 "5f0e755561322367ffca602319606d84ffcb41886ddd5572a7b996daad2d8236"
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

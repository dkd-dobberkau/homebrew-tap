class ClaudeInsightsAgent < Formula
  desc "Sync Claude Code sessions to team server"
  homepage "https://github.com/dkd-dobberkau/claude-insights-agent"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dkd-dobberkau/claude-insights-agent/releases/download/v0.1.0/claude-insights-agent-darwin-arm64"
      sha256 "2cf62e95a9625df4a810bd21c9e6e3845041273797a49123b7743ac9bd462d11"

      def install
        bin.install "claude-insights-agent-darwin-arm64" => "claude-insights-agent"
      end
    else
      url "https://github.com/dkd-dobberkau/claude-insights-agent/releases/download/v0.1.0/claude-insights-agent-darwin-amd64"
      sha256 "b74105825ab3408b79ed828c711cff65cff238b00a92fed3c3cc6e46a0004855"

      def install
        bin.install "claude-insights-agent-darwin-amd64" => "claude-insights-agent"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dkd-dobberkau/claude-insights-agent/releases/download/v0.1.0/claude-insights-agent-linux-arm64"
      sha256 "ea1ea9b02ab1d2248b95c5f08cee14a98169431065f17729a8a74251fd590961"

      def install
        bin.install "claude-insights-agent-linux-arm64" => "claude-insights-agent"
      end
    else
      url "https://github.com/dkd-dobberkau/claude-insights-agent/releases/download/v0.1.0/claude-insights-agent-linux-amd64"
      sha256 "093bd8d8a207f946ceb6534ffb7180b812a5ea7a5ecd1d98a27a8a4e8cc28994"

      def install
        bin.install "claude-insights-agent-linux-amd64" => "claude-insights-agent"
      end
    end
  end

  def caveats
    <<~EOS
      To get started, run:
        claude-insights-agent init

      To run as a background service:
        brew services start claude-insights-agent
    EOS
  end

  service do
    run [opt_bin/"claude-insights-agent", "run"]
    keep_alive true
    log_path var/"log/claude-insights-agent.log"
    error_log_path var/"log/claude-insights-agent.log"
  end

  test do
    assert_match "claude-insights-agent v#{version}", shell_output("#{bin}/claude-insights-agent version")
  end
end

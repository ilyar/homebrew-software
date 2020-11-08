class TonosCli < Formula
  desc "Command line tool for TON OS"
  homepage "https://github.com/tonlabs/tonos-cli"
  url "https://github.com/tonlabs/tonos-cli/archive/v0.1.25.tar.gz"
  sha256 "ca667e95763da14240ab3b2190378b72ebff2d055e7d9ca4f4250b3c43080941"
  head "https://github.com/tonlabs/tonos-cli.git"
  license "Apache-2.0"

  depends_on "rust" => :build
  depends_on "docker" => :build
  def install
    system "docker", "run", "--name", "test-tonos-cli-#{version}", "--network", "host", "--detach", "tonlabs/local-node"
    system "cargo", "test", "--", "--test-threads", "1"
    system "docker", "rm", "--force", "test-tonos-cli-#{version}"
    system "cargo", "install", *std_cargo_args
  end

  test do
    output = shell_output("#{bin}/tonos-cli --version")
    assert_match "#{version}", output
  end
end

class TonosCli < Formula
  desc "Command line tool for TON OS"
  homepage "https://github.com/tonlabs/tonos-cli"
  url "https://github.com/tonlabs/tonos-cli/archive/v0.1.27.tar.gz"
  sha256 "b3bf3e12fd4bd0590f7741035ca949c92c65ce24d004b0cf6744dcf8ddb5dd48"
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

class TonosCli < Formula
  desc "Command-line tool for TON OS"
  homepage "https://github.com/tonlabs/tonos-cli"
  url "https://github.com/tonlabs/tonos-cli.git",
      tag:      "v0.2.0",
      revision: "5eed060d15e4faf2da2bc4ec6f73b3d32007b4a8"
  license "Apache-2.0"
  head "https://github.com/tonlabs/tonos-cli.git"

  bottle do
    root_url "https://github.com/ilyar/homebrew-software/releases/download/tonos-cli-0.2.0"
    cellar :any_skip_relocation
    sha256 "fdea3dcb3d854a72fa246cd396f74c7ecbe3d0f398c4d673ecd004f375ccb5ab" => :catalina
    sha256 "ef8d42ce8d6471eeee7bbc8fab06d0ae1615c627380111fb496f8995d4ef3500" => :x86_64_linux
  end

  depends_on "rust" => :build
  depends_on "openssl"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    output = shell_output("#{bin}/tonos-cli --version")
    assert_match @version.to_s, output
  end
end

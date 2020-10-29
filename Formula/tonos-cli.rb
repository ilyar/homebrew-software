class TonosCli < Formula
  desc "Command line tool for TON OS"
  homepage "https://github.com/tonlabs/tonos-cli"
  url "https://github.com/tonlabs/tonos-cli/archive/v0.1.22.tar.gz"
  sha256 "f49d22bcf9660fe0cea7659a4de2ea78547203793bbd37a059ae55147986d4a0"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    # TODO system "cargo", "test"
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/tonos-cli", "--version"
  end
end

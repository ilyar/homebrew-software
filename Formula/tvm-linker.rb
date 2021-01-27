class TvmLinker < Formula
  desc "TVM assembly source code of TON smart contract, compiles it and links its parts"
  homepage "https://github.com/tonlabs/TVM-linker"
  url "https://github.com/tonsoft/TVM-linker.git",
      tag:      "v0.2.1-head-2001271811",
      revision: "11f66ec619656b74d146116ada27b11ceedde658"
  license "Apache-2.0"
  head "https://github.com/tonlabs/TVM-linker.git"

  bottle do
    root_url "https://github.com/ilyar/homebrew-software/releases/download/tvm-linker-2001271811"
    cellar :any_skip_relocation
    sha256 "fef71476f518c2c9536318e536c2156733c9d5add488362df08f72083407c5ca" => :catalina
    sha256 "c5dc667f261ae49a7e925fd1b71d5d6154badb1795cdf332bf2a8ed634b7bdff" => :x86_64_linux
  end

  depends_on "rust" => :build

  def install
    cd "tvm_linker" do
      system "cargo", "test", "--release", "--", "--nocapture", "--test-threads=1"
      system "cargo", "install", *std_cargo_args
      bin.install_symlink bin/"tvm_linker" => "tvm-linker"
    end
  end

  test do
    system "tvm-linker", "--version"
  end
end

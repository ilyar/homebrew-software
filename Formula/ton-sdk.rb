class TonSdk < Formula
  desc "TONOS Client Library for TON DApp development"
  homepage "https://github.com/tonlabs/TON-SDK"
  url "https://github.com/tonlabs/TON-SDK/archive/1.1.2.tar.gz"
  sha256 "d59cc8474b347e571fa7724afbce153dba26462e0ad60db7338636b3a2923b77"
  head "https://github.com/tonlabs/TON-SDK.git"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    cd "ton_client/client" do
      system "cargo", "build", "--release", "--target-dir", "target"
      include.install "tonclient.h"
      on_macos do
        lib.install "target/release/libton_client.dylib"
      end
      on_linux do
        lib.install "target/release/libton_client.so"
      end
    end
  end
end

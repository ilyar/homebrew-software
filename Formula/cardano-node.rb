class CardanoNode < Formula
  desc "Core component that is used to participate in a Cardano decentralised blockchain"
  homepage "https://github.com/input-output-hk/cardano-node"
  url "https://github.com/input-output-hk/cardano-node/archive/1.25.1.tar.gz"
  sha256 "82ddae50b79e4bf96a779f375f51ce1295d85311ff150486989389e0b3a849a6"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "cabal-install" => :build
  depends_on "ghc@8.10" => :build
  depends_on "libsodium" => :build

  def install
    system "cabal", "v2-update"
    system "cabal", "v2-install", *std_cabal_v2_args
  end

  test do
    system "false"
  end
end
